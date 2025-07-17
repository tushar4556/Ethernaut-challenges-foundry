// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity ^0.8.20;

import "../src/Level0.sol";
import {Script} from "forge-std/Script.sol";
import {console} from "forge-std/console.sol";

contract Level0Solution is Script {
    Level0 public level0;

    function run() external {
        level0 = Level0(0x21DA1eD8419a0Cc7D68ab23637172fD6b4407b39);
        string memory password = level0.password();
        console.log("password: ", password);
        vm.startBroadcast(vm.envUint("MY_PRIVATE_KEY"));
        level0.authenticate(password);
        vm.stopBroadcast();
    }
}
