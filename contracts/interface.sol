//SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

interface AnimalEat {
    function Eat() external  returns (string memory);
}

contract Cat {
    function Eat() public pure returns (string memory){
        return "cat eating fish...";
    }
}

contract Dog {
    function Eat() public pure returns (string memory){
        return "Dog eat meal";
    }
}

contract Animal {
    function TestAnimal(address addr) public  returns (string memory){
        AnimalEat general = AnimalEat(addr);
        return general.Eat();
    }
}
