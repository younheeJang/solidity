//SPDX-License-Identifier : GPL-30
pragma solidity >=0.7.0 <0.9.0;

//contract define
contract Father {
    string public firstName = "C";
    string public lastName = "L";
    uint256 public money = 1000;
    constructor(string memory _lastName) public {
        lastName = _lastName;
    }
    function getFirstName() view public returns(string memory){
        return firstName;
    }
    function getLastName() view public returns(string memory){
        return lastName;
    }
    function getMoney() view virtual public returns(uint256){
        return money;
    }

}

contract Son is Father("J"){
    uint256 public earning = 0;
    function work() public {
        earning+=100;
    }
    function getMoney() view override public returns(uint256){
            return money+earning;
    }

}