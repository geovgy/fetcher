// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.23;

import "forge-std/Test.sol";
import { Fetcher } from "../src/Fetcher.sol";
import { MockERC20 } from "./MockERC20.sol";

contract CounterTest is Test {
    Fetcher public fetcher;
    MockERC20 public token1;
    MockERC20 public token2;

    function setUp() public {
        fetcher = new Fetcher();
        token1 = new MockERC20();
        token2 = new MockERC20();
    }

    function test_balancesOf_eth() public {
        vm.deal(vm.addr(1), 1 ether);
        vm.deal(vm.addr(2), 2 ether);

        address[] memory addresses = new address[](2);
        addresses[0] = vm.addr(1);
        addresses[1] = vm.addr(2);
        uint256[] memory balances = fetcher.balancesOf(addresses);
        assertEq(balances[0], vm.addr(1).balance);
        assertEq(balances[1], vm.addr(2).balance);
    }

    // function test_balancesOf_erc20() public {
    //     token1.mint(vm.addr(1), 1 ether);
    //     token2.mint(vm.addr(2), 2 ether);
    //     console.log("Balance of Token 1: %s", token1.balanceOf(vm.addr(1)));

    //     address[] memory addresses = new address[](2);
    //     addresses[0] = vm.addr(1);
    //     addresses[1] = vm.addr(2);

    //     address[] memory tokens = new address[](2);
    //     tokens[0] = address(token1);
    //     tokens[1] = address(token2);
    //     console.log("Token 1: %s", tokens[0]);
    //     Fetcher.Balances[] memory balances = fetcher.tokenBalancesOf(addresses, tokens);
    //     console.log(balances[0].account);
    //     console.log(vm.addr(1));
    //     assertEq(balances[0].tokens[0].balance, 1 ether);
    //     assertEq(balances[1].tokens[0].balance, 0);
    //     assertEq(balances[0].tokens[1].balance, 0);
    //     assertEq(balances[1].tokens[1].balance, 2 ether);
    // }
}
