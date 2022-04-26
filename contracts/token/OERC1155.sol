//  SPDX-License-Identifier: Apache-2.0
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC1155/ERC1155.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract OERC1155 is ERC1155{
    uint256 public constant GOLD = 0;
    uint256 public constant SILVER = 1;
    uint256 public constant THORS_HAMMER = 2;
    uint256 public constant SWORD = 3;
    uint256 public constant SHIELD = 4;

    constructor (address userAddr) ERC1155("TOKEN_1155") {
        _mint(userAddr, GOLD, 10**18, "");
        _mint(userAddr, SILVER, 10**27, "");
        _mint(userAddr, THORS_HAMMER, 1, "");
        _mint(userAddr, SWORD, 10**9, "");
        _mint(userAddr, SHIELD, 10**9, "");

    }

}