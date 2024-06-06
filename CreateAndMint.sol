// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract CreateAndMint {
    address public owner; // contract owner
    uint256 public totalSupply;
    string public name = "Philip";
    string public symbol = "PHIL";

    mapping(address => uint256) public balances;

    constructor() {
        owner = msg.sender;
    }

    modifier onlyOwner() {
        require(msg.sender == owner, "Only owner can perform this action");
        _;
    }

    function mint(address _address, uint256 _value) public onlyOwner {
        require(_value > 0, "Mint value must be greater than zero");
        totalSupply += _value;
        balances[_address] += _value;
    }

    function burn(uint256 _value) public {
        require(_value > 0, "Burn value must be greater than zero");
        require(balances[msg.sender] >= _value, "Insufficient balance to burn");
        totalSupply -= _value;
        balances[msg.sender] -= _value;
    }

    function transfer(address _to, uint256 _value) public {
        require(_value > 0, "Transfer value must be greater than zero");
        require(_value <= 10000, "Transfer amount exceeds maximum limit");
        require(balances[msg.sender] >= _value, "Insufficient balance for transfer");
        balances[msg.sender] -= _value;
        balances[_to] += _value;
    }
}
