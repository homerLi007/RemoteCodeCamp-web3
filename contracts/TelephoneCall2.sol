// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

interface ITelephoneCall1 {
    function changeOwner(address _owner) external;
}

contract TelephoneCall2 {
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