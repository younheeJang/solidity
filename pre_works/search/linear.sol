//SPDX-License-Identifier: MIT
pragma solidity >=0.7.0 <0.9.0;

contract linearSearch{
    event IndexName(uint256 indexed _index, string _name);
    string[] private indexNameList = ["I1", "I2", "I3"];
    //string 비교 : 바이트 변환 후 내장함수 활용해 해시화 시켜야 함.
    function search(string memory _search) public view returns (uint256, string memory){
        for(uint256 i=0; i<indexNameList.length; i++){
            if(keccak256(bytes(indexNameList[i]))==keccak256(bytes(_search))){
                return (i, indexNameList[i]);
            }
        }
        return (0,"Nothing");
    }
}