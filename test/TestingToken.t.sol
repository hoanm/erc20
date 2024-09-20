// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.20;

import {Test, console} from "../lib/forge-std/src/Test.sol";
import {TestingToken} from "../src/TestingToken.sol";

contract TestingTokenTest is Test {
    TestingToken public testingToken;

    function setUp() public {
        testingToken = new TestingToken("New Testing Token", "TT", 18);
    }

    function test_Decimals() public view {
        uint8 decimals = testingToken.decimals();
        assertEq(decimals, 18);
    }

    function test_Mint() public {
        testingToken.mint(address(this), 100);
        assertEq(testingToken.balanceOf(address(this)), 100);
    }

    function test_Burn() public {
        testingToken.mint(address(this), 100);
        testingToken.burn(address(this), 100);
        assertEq(testingToken.balanceOf(address(this)), 0);
    }

    function test_Burn_OnlyOwnerCanBurn() public {
        testingToken.mint(address(this), 100);
        testingToken.burn(address(this), 100);
        vm.expectRevert();
        testingToken.burn(address(this), 100);
    }
}
