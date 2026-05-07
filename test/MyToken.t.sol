// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

import {Test, console} from "forge-std/Test.sol";
import {Token} from "../src/token.sol";

contract MyTokenTest is Test {
    Token public token;
    address public owner = address(1);
    address public user1 = address(2);
    address public user2 = address(3);

    function setUp() public {
        vm.prank(owner);
        token = new Token("TestToken", "TT", 1000);
    }

    function test_Deployment() public view {
        assertEq(token.name(), "TestToken");
        assertEq(token.symbol(), "TT");
        assertEq(token.decimals(), 18);
        assertEq(token.totalSupply(), 1000 * (10 ** 18));
        assertEq(token.balanceOf(owner), 1000 * (10 ** 18));
    }

    function test_Transfer() public {
        vm.prank(owner);
        token.transfer(user1, 100 * (10 ** 18));
        assertEq(token.balanceOf(owner), 900 * (10 ** 18));
        assertEq(token.balanceOf(user1), 100 * (10 ** 18));
    }

    function test_Transfer_InsufficientBalance() public {
        vm.prank(user1);
        vm.expectRevert("Not enough balance");
        token.transfer(user2, 50 * (10 ** 18));
    }
}