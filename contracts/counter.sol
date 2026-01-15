// SPDX-License-Identifier: MIT
pragma solidity >0.8.0 < 0.9.0;

contract Counter {
    uint counter;
    constructor(){
      counter = 0;
    }
    function count() public {
        counter += 1;
    }
    function get() public view returns (uint) {
        return counter;
    }
}
