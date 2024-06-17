// SPDX-License-Identifier: MIT
pragma solidity ^0.6.0;

contract GatePassOne {
    function enterGate(address _gateAddr, uint256 _gas) public returns (bool) {
        //bytes8 gateKey = bytes8(tx.origin);
        bytes8 gateKey = bytes8(uint64(uint160(tx.origin)));
        (bool success, ) = address(_gateAddr).call.gas(_gas)(abi.encodeWithSignature("enter(bytes8)", gateKey));
        return success;
    }
}