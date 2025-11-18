// SPDX-License-Identifier: MIT
pragma solidity > 0.8.0 < 0.9.0;

contract FuncSample{
    string private hello = "hello ";
    /*
    可见度修饰符 
        public    当前合约        其他合约         子合约           外部账户
        external 当前合约不可调用    其他合约         子合约不可调用      外部账户
        private  当前合约         其他合约不可调用    子合约不可调用      外部账户不可调用
        internal 当前合约         其他合约不可调用   子合约           外部账户不可调用
    */

    //所有都可调用
    function SayHello1(string memory name) public view returns (string memory){
        return  string.concat(hello, name);
        //return  SayHello2(name); 这里不能调用sayhello2
        //return SayHello3(name); 这里可以调用private
       // return SayHello4(name); 这里也可以调用internal
    }
    //当前合约 子合约都不可调用
    function SayHello2(string memory name) external view returns(string memory){
        return string.concat(hello, name);
    }
    //只有当前合约可以调用
    function SayHello3(string memory name) private view returns(string memory){
        return string.concat(hello, name);
    }

    function SayHello4(string memory name) internal view returns(string memory){
        return string.concat(hello, name);
    }

}
