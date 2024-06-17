// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;

contract SimpleContract {
    function add() public pure returns (uint) {
        uint a = 1; 
        uint b = 2; 
        return (a+b);
    }
}