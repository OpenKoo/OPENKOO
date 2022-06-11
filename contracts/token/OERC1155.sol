//  SPDX-License-Identifier: Apache-2.0
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC1155/ERC1155.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract OERC1155 is ERC1155{
    uint256 public constant OPT = 0;
    uint256 public constant OPK = 1;
    uint256 public constant OPNFT = 2;

    constructor (address userAddr) ERC1155("TOKEN_1155") {
        _mint(userAddr, OPT, 10**18, "");
        _mint(userAddr, OPK, 10**27, "");
        _mint(userAddr, OPNFT, 1, "");
    }

}