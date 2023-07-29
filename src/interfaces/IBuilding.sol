// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.20;

interface IBuilding {
    function isLastFloor(uint256) external returns (bool);
}
