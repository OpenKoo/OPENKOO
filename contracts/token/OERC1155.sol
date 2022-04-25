// SPDX-License-Identifier: GPL-3.0-or-later
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC1155/ERC1155.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract OERC1155 is ERC1155{
    uint256 public constant GOLD = 0;
    uint256 public constant SILVER = 1;
    uint256 public constant THORS_HAMMER = 2;
    uint256 public constant SWORD = 3;
    uint256 public constant SHIELD = 4;

    constructor (address creator_user) ERC1155("TOKEN_1155") {
        _mint(creator_user, GOLD, 1, "");
        _mint(creator_user, SILVER, 1, "");
        _mint(creator_user, THORS_HAMMER, 1, "");
        _mint(creator_user, SWORD, 1, "");
        _mint(creator_user, SHIELD, 1, "");

    }

}