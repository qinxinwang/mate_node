// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract MapAndStruct{
    //map 只能是状态变量 不能再函数中声明 不能作为函数参数、返回值 map不支持遍历
    mapping(address => uint) public myMap;
    mapping (address account => uint amount) public myMap2;

    function SetMyMap(address _key, uint _val) public {
        myMap[_key] = _val;
    }
    function GetMyMap(address _key) public view returns (uint){
        return  myMap[_key]; 
    }
    function DelMyMap(address _key) public {
        delete  myMap[_key];
    }
   //结构体内不能包含mapping
    struct Person {
        string name;
        int age;
        int gender;
    }
}