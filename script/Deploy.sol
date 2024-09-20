// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.20;

import {Script, console} from "../lib/forge-std/src/Script.sol";
import {TestingToken} from "../src/TestingToken.sol";

contract TestingTokenScript is Script {
    TestingToken public testingToken;

    function setUp() public {}

    function run() public {
        // read the private key from the .secret file as uint256
        // string memory privateKey = vm.readFile("../.secret");

        vm.startBroadcast();

        testingToken = new TestingToken("New Testing Token", "TT", 18);

        vm.stopBroadcast();
    }
}
