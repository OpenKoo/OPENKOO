//   SPDX-License-Identifier: Apache-2.0
pragma solidity ^0.8.0;

import "../token/OERC1155.sol";
import "@openzeppelin/contracts/token/ERC1155/IERC1155Receiver.sol";

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