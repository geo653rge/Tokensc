
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.00;

contract Wednesday {
    address public _Owner;
    string public _name = "Kimani";
    string public _Symbol = "_KMN";
    uint256 public _totalSupply;
    mapping(address => mapping(address => uint256)) public _allowance;
    mapping(address => uint256) public _balanceof;

//events to display logs 
 event Transfer(
    address indexed From,
    address indexed To,
    uint256 amount 
 ) ;
 

 event Approve(
    address indexed From,
    address indexed To,
    uint256 amount 
 );
    modifier onlyOwner() {
        require(msg.sender == _Owner, "Not the owner");
        _;
    }

    constructor(address Owner) {
        _Owner = Owner;
    }

     function mint(address to, uint256 amount) public onlyOwner  {

   _totalSupply += amount *10**18 ;
    _balanceof[to] +=amount*10**18;
    emit Transfer(address(0), to, amount);


     }
 
 
function transfer(address _to,uint256 _amount)public returns(bool) {

     require(_balanceof[msg.sender]>=_amount ,"Tafuta pesa , ama Ruto akumalize");

     _balanceof[msg.sender] -=_amount ;
     _balanceof[_to] +=_amount ;
     emit Transfer(msg.sender, _to , _amount);
     return true;
}
}
