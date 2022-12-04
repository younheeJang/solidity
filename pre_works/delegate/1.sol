//SPDX-License-Identifier: MIT
pragma solidity >=0.7.0 <0.9.0;

//업그레이드가 가능한 call을 사용해야 하는 이유: 블록체인 재배포시 주소가 바뀜. 한번 배포한 계약은, 기존 코드상에서 수정이 불가함.
//이 때문에, 실질적으로 값을 저장하는 계약과, 로직을 저장하는 계약을 따로 설정할 필요가 있음.
//주소 그대로 사용 가능, 데이터 이전 필요 없음.

//senario: 위임시 caller에서 multi의 함수를 호출하면, multi의 값이 바뀜.

contract multi{
    uint256 public n = 2;
    event info(address _address, uint256 _n);
    function multiply() public{
        n = n*n;
        emit info(msg.sender,n);
    }
  
}

contract caller{
    uint256 public n = 2;

    function callFuncion(address _addr) public payable{
        (bool success,)=_addr.call(abi.encodeWithSignature("multiply()"));
        require(success, "failed");
    }
    function delegateCallFunction(address _addr )public  payable{
        //ether를 송금하지 않아, value는 필요없고, call("함수 콜")
        (bool success,) = _addr.delegatecall(
            //이더리움 플랫폼에서 스마트 컨트랙트를 상호작용시키는 인터페이스
            abi.encodeWithSignature("multiply()")
        );
        require(success, "failed");
    }
}