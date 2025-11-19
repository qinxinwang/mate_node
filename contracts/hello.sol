// SPDX-License-Identifier: MIT
pragma solidity > 0.8.0 < 0.9.0;

contract HelloDot {
    string public hello = "hello 3.0!";
    int public numberA = -2**255 ; //int 就是int256 MAX = 2 ** 255 -1;
    uint public numberB = 2 ** 256 -1; //uint就是uint256  MAX = 2**256 - 1;
    address public addr = 0x5B38Da6a701c568545dCfcB03FcB875f56beddC4; 
    bytes2 b2 = hex"1000";   //byte系列
    //枚举无法加public
    enum status{ 
        Active,
        Inactive
    }                   
}

/*
EVM的存储结构
    stack(栈 1024个槽 每槽32字节)
    memory(EVM自身的存储)
    storage(链上存储)
    calldata(函数参数的存储区域)
    code(智能合约的字节码)

    基本数据类型是少于32字节的 都存在栈 而大于32字节或者长度未知的都存在memory或者storage
    基本数据类型：
        整数 int系列
        bool
        地址
        bytes系列
        enum 枚举
    引用类型
        数组
        字符串
        结构体
        映射

*/