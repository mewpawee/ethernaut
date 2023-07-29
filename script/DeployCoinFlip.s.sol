// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.20;

import "forge-std/Script.sol";
import {CoinFlipAttack} from "src/CoinFlipAttack.sol";

contract DeployCoinFlip is Script {
    uint256 deployerPrivateKey;
    CoinFlipAttack coinFlipAttack;

    function setUp() public {
        deployerPrivateKey = vm.envUint("PRIVATE_KEY");
    }

    function run() public {
        vm.startBroadcast(deployerPrivateKey);
        _deploy();
        vm.stopBroadcast();
    }

    function _deploy() private {
        coinFlipAttack = new CoinFlipAttack();
        console.log("Deployed at: ", address(coinFlipAttack));
    }
}
