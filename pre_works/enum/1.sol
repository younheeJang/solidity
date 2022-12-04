//SPDX-License-Identifier: MIT
pragma solidity >=0.7.0 <0.9.0;

contract product {
    enum Status {
        Sold, // == Status(0)
        OnDisplay,// == Status(1)
        Completed,
        OnWorking
    }

    Status public status;

    //배포시 값 설정
    constructor(){
        status = Status.OnWorking;
    }

    event currentStatus(Status _status, uint256 _statusInInt);
    function sold() public {
        require(status==Status.OnDisplay,"not displayed");
        status = Status.Sold;
        emit currentStatus(status, uint256(status));
    }
    function onDisplay() public {
         require(status==Status.Completed,"not completed");
        status = Status.OnDisplay;
        emit currentStatus(status, uint256(status));
    }
     function completed() public {
        require(status==Status.OnWorking,"not on working");
        status = Status.Completed;
        emit currentStatus(status, uint256(status));
    }
    function onWorking() public {
        status = Status.OnWorking;
        emit currentStatus(status, uint256(status));
    }
   
}