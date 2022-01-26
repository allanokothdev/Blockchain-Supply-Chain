pragma solidity ^0.5.0;

import "./ERC20Interface.sol";

contract ERC20Token is ERC20Interface {

  uint constant private MAX_UINT256 = 2**256 - 1;
  mapping (address => uint) public balances;
  mapping (address => mapping (address => uint)) public allowed;

  uint public totalCoins;  //Total Number of tokens
  string public name;       //Descriptive Name
  uint public decimals;     //How many decimals to use to display amounts
  string public symbol;     //Short identifier for Token

  constructor (uint _initialAmount, string memory _tokenName, uint _decimalUnits, string memory _tokenSymbol) public {
    balances[msg.sender] = _initialAmount;    //Creator Owns all the _tokens
    totalCoins = _initialAmount;             //Update total Token Supply
    name = _tokenName;                        //Token name
    decimals = _decimalUnits;                 //Number of decimals
    symbol = _tokenSymbol;                    //Token Symbol
  }

  //totalSupply function returns the total number of token in circulation
  function totalSupply() public view returns (uint) {
    return totalCoins;
  }

  //allowance function returns the remaining Number of approved tokens that can be transferred from one address to another specified address
  function allowance(address _owner, address _spender) public view returns (uint remaining) {
    return allowed[_owner][_spender];
  }

  //Approve Function grants permission to transfer a specified number of tokens from one address to naother specified address
  function approve(address _spender, uint _value) public returns (bool success) {
    allowed[msg.sender][_spender] = _value;
    emit Approval(msg.sender, _spender, _value);
    return true;
  }

  //balanceOf Function returns the number of tokens owned by a specified address
  function balanceOf(address _owner) public view returns (uint balance) {
    return balances[_owner];
  }

  //TransferFrom Function transfers tokens from one specified address to another specified address
  function transferFrom(address _from, address _to, uint _value) public returns (bool success) {
    uint allowancet = allowed[_from][msg.sender];
    require(balances[_from] >= _value && allowancet >= _value, "Insufficient Funds");
    balances[_from] -= _value;
    balances[_to] += _value;

    if(allowancet < MAX_UINT256){
      allowed[_from][msg.sender] -= _value;
    }
    emit Transfer(_from, _to, _value);
    return true;
  }


  //Transfer function transfers tokens from calling address to a specified address
  function transfer(address _to, uint _value) public returns (bool success) {
    require(_value >= 0, "Cannot Transfer negative amount.");
    require(balances[msg.sender] >= _value, "Insufficient Funds");
    balances[msg.sender] -= _value;
    balances[_to] += _value;
    emit Transfer(msg.sender, _to, _value);
    return true;
  }
}
