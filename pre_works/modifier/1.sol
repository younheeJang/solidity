//SPDX-License-Identifier: MIT
pragma solidity >=0.7.0 <0.9.0;

contract M {
    modifier limitation {
        revert("not allowed");
        _;
    }
    function inLimitation() public limitation returns (string memory){
        return "succeed";
    }

     modifier limitation2(uint256 _limit) {
         //false일 경우,   error
        require(_limit > 10, "not allowed");
        _;
    }
    function inLimitation2(uint256 _limit) public limitation2(_limit) returns (string memory){
        return "succeed";
    }
    string public str = "56";
    modifier change{
        _;
        str = "33";
    }
    function numChangeFunction() public change {
        str = "666";
    }
}