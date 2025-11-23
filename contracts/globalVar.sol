//SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract globalVar {
    //全局变量
    //block
    function TestBlock() public view returns (uint, uint, uint){
        //当前区块号 当前区块时间戳 当前区块gas限额
        return (block.number, block.timestamp,block.gaslimit);
    
    }

    //msg变量
    function TestMsg() public payable  returns (address, uint){
        //当前调用者 发送的wei数量
        return (msg.sender, msg.value);
    }

    //tx变量
    function TestTx() public view returns(address,uint){
        //交易的发起者，这个可能引起安全漏洞 建议用msg.sender 交易的gas价格
        return  (tx.origin, tx.gasprice);

    }
    //以太坊环境变量信息
    function TestEnv() public view returns (uint, uint, uint, address){
        //当前剩余的gas 当前链的ID 当前合约地址  当前合约地址的余额
        return (gasleft(), block.chainid, address(this).balance,address(this) );
    }

}