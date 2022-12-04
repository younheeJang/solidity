//SPDX-License-Identifier: MIT
pragma solidity >=0.7.0 <0.9.0;

//error handler : require, revert, assert,(에러 발생 후 바로 프로그램 종료) ///     try/catch
//가스 환불: require revert 
//false의 경우 에러 발생: assert, require 
//0.4 - 0.7
contract E {
    function assertNow() public pure{
        assert(false);
    }
    function revertNow() public pure {
        revert("revert");
    }
      function requireNow() public pure {
        require(false,"require");
    }
}