//SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract AddressExample{

    //获取当前地址的余额
    function GetBalance(address addr) public view returns(uint256){
        return addr.balance;
    }
    //给当前地址转账
    function SendEther(address payable  addr) public payable {
        addr.transfer(msg.value);
    }

}