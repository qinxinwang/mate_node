// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract EventExample{
    event DepositEvent(address indexed sender, uint amount);
    function Deposit() external payable {
        emit DepositEvent(msg.sender, msg.value);
    }
}