//SPDX-License-Identifier : GPL-30
pragma solidity >=0.7.0 <0.9.0;

//contract define
contract Father {
    uint256 public fMoney = 1000;
    function getFatherName() view public returns(string memory){
        return "C";
    }
    function getMoney() view virtual public returns(uint256){
        return fMoney;
    }

}
contract Mother {
    uint256 public mMoney = 5600;
     function getMotherName() view public returns(string memory){
        return "M";
    }
    function getMoney() view virtual public returns(uint256){
        return mMoney;
    }
}
contract Son is Father, Mother{
     function getMoney() view override(Father, Mother) public returns(uint256){
        return fMoney+mMoney;
    }


}