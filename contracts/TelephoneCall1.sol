// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

interface ITelephone {
    function changeOwner(address _owner) external;
}

contract TelephoneCall1 {
    address public owner;

    event FunctionCalled(string);

    constructor() {
        owner = msg.sender;
    }

    function changeOwner(address _owner) public {
        ITelephone(_owner).changeOwner(_owner);
    }

 
    receive() external payable {
        emit FunctionCalled("this is receive");
    }


    fallback() external payable {
        emit FunctionCalled("this is fallback");
    }
    
}