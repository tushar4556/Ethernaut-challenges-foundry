
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;


// ownership will transfer to us if we call changeOwner from another address
contract Telephone {
    address public owner;

    constructor() {
        owner = msg.sender;
    }

    function changeOwner(address _owner) public {
        if (tx.origin != msg.sender) {
            owner = _owner;
        }
    }
}