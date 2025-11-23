// SPDX-License-Identifier: MIT
pragma solidity > 0.8.0 < 0.9.0;

contract FuncSample3{
    //数据存储位置

    //状态变量 存储在storage即stateDB
    uint public stateVar = 100;
    mapping(address => uint256) public balances;
    uint256[] someStorageArray;

    //常量 编译的时候确定  存储在字节码中
    uint256 public constant CONSTANT_VAR = 1000;

    //immutable 部署的时候确定 存储在代码区
    uint256 public immutable IMMUTABLE_VAR;
    constructor(){
        IMMUTABLE_VAR = 1112;
    }

    //函数中的变量都存储在栈上
    //pure函数和view函数的区别 view函数多了一次sload操作 view函数读取的变量存储在storage 
    function PureFunc(uint x) public pure returns (uint){
        uint y = 2 * x;
        return y;
    }
    function ViewFunc() public view returns(uint){
        return stateVar;
    }

    //calldata修饰的参数不可修改 一般用于外部函数
    //memory变量可以通过calldata得到 但calldata不能通过memory得到 且calldata不能再函数内声明
    function CallDataFunc(string calldata str) external  view returns(string memory){
       // str = string.concat(str, "adbc  ");
       string  memory str2 = str; //str是calldata  str是memory
        return str;
    }

    function ClaimVar() public view returns (uint256){
        //memory变量 临时存储在内存中
        uint[] memory memoryArr = new uint[](3);
        string memory str = "hello";
        bytes memory tempBytes = new bytes(10);

        //存在栈上的 基本类型都是栈上
        uint num1 = 10;
        bool flag = true;
        address sender = msg.sender;

        //存在storage上   指针
        uint256[] storage storageArr = someStorageArray;
        mapping(address => uint256) storage storageMap = balances;

        return num1;
    }

    function Test1(uint8 x, uint8 y) public pure returns (uint8){
    //solidity会自动检查溢出 a+b> uint8.max会自动报错 如果要禁用溢出检查可以用unchecked
        unchecked{
            return  x + y;
        }
   }

}