//SPDX-License-Identifier: MIT
pragma solidity >=0.7.0 <0.9.0;

contract Struct {
    struct Lecture {
        uint256 id;
        string name;
        string category;
    }
    mapping(uint256=>Lecture) public LectureMapping;
    Lecture[] public LectureArray;
    function createLecture(uint256 _id, string memory _name, string memory _category) pure public returns(Lecture memory){
        return Lecture(_id, _name, _category);
    }
}