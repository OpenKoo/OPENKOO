// SPDX-License-Identifier: GPL-3.0-or-later
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/access/Ownable.sol";
import "../interface/INFT.sol";

contract creator721 is Ownable{

    INFT NFT;
    uint256 public tokenId;
    address public admin;

    function initialize(address _NFT) public {
        NFT = INFT(_NFT);
    }

    function creatNFT() public {
        ++tokenId;
        NFT.safeMint_( msg.sender, tokenId);
    }
    
}