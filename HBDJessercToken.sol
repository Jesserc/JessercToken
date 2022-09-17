// SPDX-License-Identifier: MIT

pragma solidity ^0.8.16;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "https://github.com/transmissions11/solmate/blob/main/src/utils/ReentrancyGuard.sol";

contract HappyBirthdayJesserc is ERC20, ReentrancyGuard{
    //Contract Address = 0x8b5968463563520679138A0a1CB3b483969b8b88 on Goerli chain
    address owner;
    error NotOwner(string);

    modifier OnlyOwner(){
        if(msg.sender != owner){
            revert NotOwner("Not contract owner");
        }
        _;
    }

    constructor() ERC20("Happy Birthday Jesserc", unicode"🎂") {
        owner = msg.sender;
        _mint(owner, 2022*10**decimals());
    }

    function setOwner(address newOwner) external OnlyOwner nonReentrant{
        owner = newOwner;
    }


}
