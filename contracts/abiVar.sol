//SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

contract AbiExample{
    //abi编码 
    function encodeData(string memory text,uint256 number) public pure returns (bytes memory, bytes memory){
        return ( abi.encode(text, number),abi.encodePacked(text, number));
        //encodePacked 是encode的压缩版
    }
    //abi解码 压缩版的encodeStr不能直接解码的
    function decodeData(bytes memory encodeStr) public pure returns (string memory, uint256){
        return abi.decode(encodeStr, (string, uint256));
    }

    //获取当前函数签名
    function GetSelect() public pure returns(bytes4){
        return msg.sig;
    }
    //调用函数获取函数签名 入参funcName包括()
    function ComputeSelector(string memory funcName) public pure returns (bytes4){
        return bytes4(keccak256(bytes(funcName)));
    }

    //获取msg
    function Transfer(address addr, uint256 amount) public pure returns (bytes memory){
        return msg.data;
    }
    //调用函数生成msg.data
    function EncodeFunctionCall() public pure returns(bytes memory){
        return abi.encodeWithSignature("Transfer(address,uint256)", 0x5B38Da6a701c568545dCfcB03FcB875f56beddC4,100);
    }
}