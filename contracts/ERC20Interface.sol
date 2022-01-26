pragma solidity ^0.5.0;

//ERC - 20 Token Interface with nimimum data and functions
//This Interface defines the single variable, six functions and two events that every token contracy must implement to support the ERC 20 Token Standard


contract ERC20Interface {

    uint public totalCoins;

    function totalSupply() public view returns (uint);
    function balanceOf(address tokenOwner) public view returns (uint balance);
    function allowance(address tokenOwner, address spender) public view returns (uint remaining);
    function transfer(address to, uint tokens) public returns (bool success);
    function approve(address spender, uint tokens) public returns (bool success);
    function transferFrom(address from, address to, uint tokens) public returns (bool success);

    event Transfer(address indexed from, address indexed to, uint tokens);
    event Approval(address indexed tokenOwner, address indexed spender, uint tokens);
}
