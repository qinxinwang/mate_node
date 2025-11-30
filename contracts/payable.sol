//SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

//合约的收款 转账问题
contract PayableContract{
    event Recevived(address sender, uint amount);
    event FallbackCalled(address sender, uint amount, bytes data);
    //当合约收到纯 ETH 转账（例如 address(this).transfer() 或 address(this).send()）且没有调用数据（data为空）时，会调用 receive() 函数。
    //不能有参数，也不能返回值。 每个合约只能有一个 receive() 函数。 external：只能被外部调用。 payable：允许接收 ETH。
    receive() external payable { 
        emit Recevived(msg.sender, msg.value);
    }
    //用途 当调用合约函数时，找不到对应函数签名或者调用时带有数据，但合约中没有receive() 函数可调用  会触发 fallback() 函数。
    fallback() external payable {
        emit FallbackCalled(msg.sender, msg.value, msg.data);
    }
    function GetBalance() public view returns(uint256) {
        return address(this).balance;
    }
}

//合约向外转账的三种方式
contract BankExample{
    receive() external payable { }
    //transfer对外转账 固定 2300 gas，失败自动 revert
    function WithDrawTransfer() external {
        payable(msg.sender).transfer(1 ether);
    }
    //send 对外转账 同样只提供 2300 gas，但需要手动检查返回值
    function WithDrawSend() external {
        bool success = payable(msg.sender).send(1 ether);
        require(success, "Send failed");
    }
    // call 对外转账  可调 gas，兼容新版本，官方推荐方式
    function WithDrawCall() external {
        (bool success, ) = payable(msg.sender).call{value: 1 ether}("");
        require(success, "Call failed");
    }
    function GetBalance() public view returns(uint256) {
        return address(this).balance;
    }
}

