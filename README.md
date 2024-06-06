# Create-and-Mint-Token
This Solidity program provides simple functionality for creating tokens on the blockchain.
## Description
This program consists of simple functions and variables which help in mapping data, minting tokens, and burning resources as necessary. It includes checks to prevent excessive minting and burning of tokens.

## Getting Started
This program contains straightforward functions and variables designed for mapping data, minting tokens, and burning resources as necessary.

### Functionality
Only contract owner should be able to mint tokens: The mint function is restricted to the contract owner, ensuring only the owner can create new tokens.
Any user can transfer tokens: The transfer function allows any user to transfer tokens to another address, provided they have a sufficient balance.
Any user can burn tokens: The burn function allows any user to burn their tokens, reducing the total supply and their balance accordingly.
### Explanation
The mint function is protected by the onlyOwner modifier, which ensures that only the contract owner can mint new tokens.
The transfer function can be called by any user to transfer tokens to another address. The function checks for sufficient balance and enforces a maximum transfer limit.
The burn function can be called by any user to burn their tokens. The function checks for sufficient balance to ensure the user has enough tokens to burn.
### Executing Program
To run this program, you can utilize Remix, an online Solidity IDE. Begin by navigating to the Remix website.

Once you're on the Remix website, initiate a new file by selecting the "+" icon in the left-hand sidebar. Save the file with a .sol extension (for instance, MyToken.sol). Then, copy and paste the provided code into the file.

solidity
Copy code
```
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
```
To compile the code, click on the "Solidity Compiler" tab in the left-hand sidebar. Make sure the "Compiler" option is set to "0.8.0" (or another compatible version), and then click on the "Compile MyToken.sol" button.

Once the code is compiled, you can deploy the contract by clicking on the "Deploy & Run Transactions" tab in the left-hand sidebar. Select the "MyToken" contract from the dropdown menu, and then click on the "Deploy" button.

After deployment, you can interact with the contract using the default addresses provided. You can mint new tokens to an address and burn tokens from an address. Each address acts as a different user, allowing you to perform various operations on it.

## Authors
Aditi Rajput
[@Chandigarh University](https://www.linkedin.com/in/aditi-rajput-b9360720b/)



## License
This project is licensed under the MIT License - see the LICENSE.md file for details
