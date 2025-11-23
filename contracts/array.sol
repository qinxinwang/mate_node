//SPDX-License-Identifier: MIT
pragma solidity >0.8.0 < 0.9.0;

contract BasicType{
   
   
   //数组
   // 1、静态数组  数组定义的时候长度固定，且不可更改 不能通过new声明赋值 也不能用push
   uint[5] public arr1;
   string[2] public arr2 = ["zhangsan","lisi"];
   //uint[3] public  arr = new uin[](3); 静态不允许通过new

   //2、动态数组  长度可根据需要动态调整
   uint[] public arr3;
   uint[] public arr4 = [1,2,3];
   uint[] public arr5 = new uint[](2);

   function PushArr() public {
      //arr2.push("wangwu") ; 静态数组不允许push
      arr4.push(11);
   }

   //切片  切片只能从calldata中来  不能是memory变量， 原因是内存结构
   function TestSlice(uint[] calldata data, uint256 start, uint256 end) public pure returns (uint[] memory){
      return  data[start: end];

   }
    
}