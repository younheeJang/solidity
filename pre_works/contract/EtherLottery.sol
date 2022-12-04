//SPDX-License-Identifier: MIT
pragma solidity >=0.7.0 <0.9.0;

// get each person 3 ether.-> all money to one person 
// only owner can check balance

contract EtherLottery {
    event personWhoPaid(address indexed sender, uint256 money);
    address owner;

    //in list, check person who try to pay over once.
    // th => (paidPerson => true || false) : th > person > bool
    mapping (uint256 => mapping(address => bool)) paidPersonList;
    uint256 th = 1;

    //deployer:
    constructor(){
        owner = msg.sender;
    }

    //fallback function
    receive() external payable{
        //only 3 ether could paid
        require(msg.value == 3 ether, "only 3ether possible");

        //list > th mapping, sender mapping => get bool result
        require(paidPersonList[th][msg.sender]==false,"could pay once per person");

        //set person who paid:
        paidPersonList[th][msg.sender] = true;


        emit personWhoPaid(msg.sender, msg.value);
        if(address(this).balance == 30 ether){
            (bool paid,) = payable(msg.sender).call{value:address(this).balance}("");
            require(paid, "failed");

            //new 
            th++;
        }
    }
    function checkTh() public view returns(uint256){
        return th;
    }
    function checkBalance() public view returns(uint256){
        require(owner == msg.sender, "no atuthentification");
        //this -> smart contract itself
        return address(this).balance;
    }
}