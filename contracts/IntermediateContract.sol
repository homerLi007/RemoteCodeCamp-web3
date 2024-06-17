// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

interface ITelephone {
  function changeOwner(address _owner) external;
}

contract IntermediateContract {

        event FunctionCalled(string);


  function changeOwner(address _addr) public {
    emit FunctionCalled("this is changeOwner start");
    ITelephone(_addr).changeOwner(msg.sender);
    emit FunctionCalled("this is changeOwner end");

  }

   receive() external payable {
        emit FunctionCalled("this is receive");
    }


    fallback() external payable {
        emit FunctionCalled("this is fallback");
    }
}