//  SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

import {Script, console} from "forge-std/Script.sol";
import {Token} from "../src/token.sol";

contract Deploy is Script {
    function run() public {
        vm.startBroadcast();

        Token token = new Token("TestDeployToken","TDT", 1000);

        console.log("Token deployed at:", address(token));
        console.log("Token name:", token.name());
        console.log("Total supply:", token.totalSupply());
        console.log("Owner balance:", token.balanceOf(msg.sender));

        vm.stopBroadcast();
    }
}