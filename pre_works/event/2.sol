//SPDX-License-Identifier: MIT
pragma solidity >=0.7.0 <0.9.0;

contract Indexed {
    //이벤트를 실행을 통한 변수 값은 저장되며 다시 꺼내올 수 있음.
    event numberTracker(uint256 num,string str);

    //인덱스를 통해 원하는 이벤트의 값을 활용해 필터가능
    event numberTracker2(uint256 indexed num,string str);
    uint256 num = 0;
    function PushEvent(string memory _str) public {
        emit numberTracker(num, _str);
        emit numberTracker2(num, _str);
        num++;
    }
}