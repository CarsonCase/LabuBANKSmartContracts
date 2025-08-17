// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Test, console} from "forge-std/Test.sol";
import {Labubank} from "../src/Labubank.sol";

contract LabuBankTest is Test {
    Labubank public labubank;

    address user1 = address(1234);
    address user2 = address(5678);

    function setUp() public {
        labubank= new Labubank(address(this));
        labubank.newLabubu(user1);
        labubank.newLabubu(user2);
    }

    function testSetName() public {
      vm.prank(user1);
      labubank.setMyLabubuName(1, "JeromePowel");
      assertEq(labubank.myLabubuName(1), "JeromePowel");
      vm.prank(user2);
      labubank.setMyLabubuName(2, "JeromePowel");
      assertEq(labubank.myLabubuName(2), "JeromePowel");

    }

}
