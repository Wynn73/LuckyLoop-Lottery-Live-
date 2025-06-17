// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract LuckyLoop {
    address public owner;
    uint256 public nextDrawTime;
    uint256 public prizePool;
    address[] public players;

    constructor() {
        owner = msg.sender;
        nextDrawTime = block.timestamp + 1 days;
    }

    function enterLottery() external payable {
        if (msg.value != 0.002 ether && msg.value != 0.02 ether) {
            revert("Wrong amount");
        }
        players.push(msg.sender);
        prizePool += msg.value;
    }

    function getNextDrawTime() external view returns (uint256) {
        return nextDrawTime;
    }

    function getPrizePool() external view returns (uint256) {
        return prizePool;
    }
}