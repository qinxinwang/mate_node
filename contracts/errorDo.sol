//SPDX-License-Identifier: MIT

pragma solidity > 0.8.0 < 0.9.0;

contract ErrorDo {

    //require 一般用于验证输入和合约状态
    function RequireError(bool cond) public pure returns(uint){
        require(cond,"input is false");
        return 1;
    }

    //assert 检查不应该为假的代码
    function AssertError(bool cond) public pure returns(uint){
        assert(cond);
        return 1;
    }

    //revert
    function RevertError(bool cond) public pure returns (uint){
        if (!cond){
            revert("cond is false");
        }
        return 1;
    }
}

contract Ower{
    address public ower;
    constructor(){
        ower = msg.sender;
    }
    //自定义修饰符
    modifier OnlyOwner{
        require(msg.sender == ower, "just for owner!");
        _;
    }

    function TestModifier(address addr) public OnlyOwner {
        ower = addr;
    }
}