// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "https://github.com/transmissions11/solmate/blob/main/src/utils/ReentrancyGuard.sol";

contract HappyBirthdayJesserc is ERC20, ReentrancyGuard{
    //0x8b5968463563520679138A0a1CB3b483969b8b88
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