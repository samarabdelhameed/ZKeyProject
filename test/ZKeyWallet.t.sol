// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

import "forge-std/Test.sol";
import "../src/ZKeyWallet.sol";

contract ZKeyWalletTest is Test {
    ZKeyWallet public wallet;
    address public user = address(0x123);

    function setUp() public {
        wallet = new ZKeyWallet(user);
    }

    function testDeployment() public {
        assertTrue(address(wallet) != address(0), "Contract deployment failed");
    }

    function testReceiveETH() public {
        vm.deal(address(this), 1 ether);
        (bool success, ) = address(wallet).call{value: 1 ether}("");
        assertTrue(success, "ETH transfer failed");
        assertEq(address(wallet).balance, 1 ether, "ETH balance incorrect");
    }
}
