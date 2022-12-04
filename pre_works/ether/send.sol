//SPDX-License-Identifier: MIT
pragma solidity >=0.7.0 <0.9.0;

contract S {
    //payable > 주고받음
    //msg.value > 값
    /*
        이더 보내기 > send(return true or false) , transfer(if fail, error ), call(return true or false, 가스는 가변)
    */
    event printMoney (uint256 _money);
    function sendTo(address payable _to) public payable{
        bool sent = _to.send(msg.value);
        require(sent, "failed");
        emit printMoney(msg.value);
    }
    function transferTo(address payable _to) public payable{
        _to.transfer(msg.value);
        emit printMoney(msg.value);
    }
    function callTo(address payable _to) public payable {
        //-0.7
        //(bool sent, ) = _to.call.gas(1000).value(msg.value)("");
        //0.7-
        (bool sent, ) = _to.call{value:msg.value, gas: 1000}("");
        require(sent, "failed");
        emit printMoney(msg.value);


    }
}