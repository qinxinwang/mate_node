// SPDX-License-Identifier: MIT
pragma solidity > 0.8.0 < 0.9.0;

contract FuncSample2{
    uint public numA = 10;
    uint public numB = 20;
    /*
    函数修饰符
    pure 不读取也不修改
    view 只读取 不修改
    default 可以修改
    payable 可以接收以太币
    */
    //不读取也不修改
    function GetSum(uint a, uint b) public pure returns(uint){
        return a + b; //不能修改入参
    }
    // 只读取  不修改
    function GetNum() public view returns(uint){
        return numA; 
    }
    // 可以修改numA
    function Increment() public {
        numA ++;
    }
    //该函数可以接收以太币
    function Deposit() public payable {
        //该函数可以接收以太币
    }
}