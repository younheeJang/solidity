//SPDX-License-Identifier: MIT
pragma solidity >=0.7.0 <0.9.0;

contract B {
    address owner;
    constructor()payable{
        //스마트 컨트렉 배포시 보내는 측의 주소를 오너에 저장.
        owner = msg.sender;
    }
    modifier prohibitOther{
        require(msg.sender==owner,"only for owner");
        //함수 변경자 : function modifier : 체크 후, 그 다음 실행 : _ -> 함수의 실행 시점을 말함.
        _;
    }
    //address.balance-> 잔액/ msg.value 송금액 / msg.sender 스마트 컨트랙의 주체
    event sendInfo(address _sender, uint256 _value);
    event currentValue(address _sender, uint256 _value);
    event currentValueOfSomeone(address _sender,address _to, uint256 _value);
    function sendEther(address payable _to)public prohibitOther payable{
        //보내려는 금액이 보내는 사람이 가지고 있는 금액보다 적을 떄, 
        require(msg.sender.balance>=msg.value, "balance is not enough");
        _to.transfer(msg.value);
        emit sendInfo(msg.sender, (msg.sender).balance);
    }
    function checkSenderValue()public prohibitOther{
        emit currentValue(msg.sender, msg.sender.balance);
    }
    function checkReceiverValue(address _to)public prohibitOther{ 
        emit currentValueOfSomeone(msg.sender,_to,_to.balance);
    }
}