// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

interface IToken {
    function transfer(address _to, uint256 _value) external returns (bool) ;

    function balanceOf(address _owner) external view returns (uint256 balance);
}

contract TokenCall {
    

    event FunctionCalled(string);

    constructor() {
        
    }

    function transfer(address _to, uint256 _value) external payable returns (bool){
        return IToken(_to).transfer(_to,_value);
    }
   
    receive() external payable {
        emit FunctionCalled("this is receive");
    }


    fallback() external payable {
        emit FunctionCalled("this is fallback");
    }
    
}