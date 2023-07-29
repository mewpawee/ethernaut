// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.20;

import "forge-std/Script.sol";
import {TelephoneAttack} from "src/TelephoneAttack.sol";

contract DeployCoinFlip is Script {
    uint256 deployerPrivateKey;
    TelephoneAttack telephoneAttack;

    function setUp() public {
        deployerPrivateKey = vm.envUint("PRIVATE_KEY");
    }

    function run() public {
        vm.startBroadcast(deployerPrivateKey);
        _deploy();
        vm.stopBroadcast();
    }

    function _deploy() private {
        telephoneAttack = new TelephoneAttack();
        console.log("Deployed at: ", address(telephoneAttack));
    }
}
