//SPDX-License-Identifier : GPL-30
pragma solidity >=0.7.0 <0.9.0;

contract Event {
    //이벤트를 실행을 통한 변수 값은 저장되며 다시 꺼내올 수 있음.
    event info(string name, uint256 money);

    function sendMoney() public {
        emit info("curious", 100);
    }
}