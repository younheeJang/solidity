//SPDX-License-Identifier: MIT
pragma solidity >=0.7.0 <0.9.0;

contract discount{
    event _fallback(string _str);
    event _receive(string _str);
    function discounting(uint256 _p, uint256 _r) public pure returns(uint256){
        return _p-(_p/_r);
    }
    fallback() external {
        emit _fallback("you called function not existed on discount");
    }
    receive() external payable{
        emit _receive("receive");
    }
}

contract caller{
    event callFuncion(bool _success, bytes _output);
    function transferEther(address payable _to) public payable{
        (bool success,)=_to.call{value: msg.value}("");
        require(success, "failed");
    }
    function callFunction(address _discount,uint256 _p, uint256 _r )public {
        //ether를 송금하지 않아, value는 필요없고, call("함수 콜")
        (bool success, bytes memory _result) = _discount.call(
            //이더리움 플랫폼에서 스마트 컨트랙트를 상호작용시키는 인터페이스
            abi.encodeWithSignature("discounting(uint256,uint256)",_p, _r)
        );
        require(success, "failed");
        emit callFuncion(success, _result);
    }
}