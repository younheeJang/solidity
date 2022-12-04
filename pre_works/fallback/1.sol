//SPDX-License-Identifier: MIT
pragma solidity >=0.7.0 <0.9.0;

//이름없는 함수. external(필수), payable(가능)
//그 다음의 행동을 정의하는 함수.
//0.6이후, receive(ether만 받을 떄) , fallback

contract B {
    event justFallback(address _from, string message);
    event receiveFallback(address _from, uint256 _value, string message);
    event justFallbackWithFunds(address _from, uint256 _value, string message);

    fallback() external{
        emit justFallback(msg.sender, "just fallback");

    }
    //receive를 통해 이더를 받음 -> 이후 fallback실행
    receive() external payable{
        emit receiveFallback(msg.sender, msg.value, "receive fallback");
    }

}

contract S {

    //receive:
    function depositWithSend(address payable _to) public payable{
       bool result = _to.send(msg.value);
       require(result, "failed");
    }
    function depositWithTransfer(address payable _to) public payable {
        //실패시 에러.
        _to.transfer(msg.value);
    }
    function depositWithCall(address payable _to) public payable{
        (bool sent,) = _to.call{value: msg.value}("");
        require(sent, "failed");
    }

    //fallback:
    function justMessage(address _to)public{
        (bool success,) = _to.call("_");
        require(success, "failed");

    }
    function justMessageWithFunds(address payable _to)public payable{
        (bool success,) = _to.call{value:msg.value}("_");
        require(success, "failed");
        
    }
}