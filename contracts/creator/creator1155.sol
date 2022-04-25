// SPDX-License-Identifier: GPL-3.0-or-later
pragma solidity ^0.8.0;

import "../token/OERC1155.sol";

contract creator1155 is Ownable {

    mapping(address => address) public user_token;
    constructor()  {
    }
    address public new1155Token;
    function creat1155Token(address user) public returns(address){
        address token = address(new OERC1155(user));
        new1155Token = token;
        user_token[user] = token;
        return token;
    }
}