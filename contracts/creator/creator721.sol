//   SPDX-License-Identifier: Apache-2.0
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/access/Ownable.sol";
import "../interface/INFT.sol";
import "erc721a/contracts/ERC721A.sol";


contract creator721 is Ownable{

    INFT NFT;
    uint256 public tokenId;
    address public admin;
    mapping(uint256 => string) public url;

    modifier notContract(){
        require(!Address.isContract(msg.sender),"No contract");
        _;
    }

    function initialize(address _NFT) public {
        NFT = INFT(_NFT);
    }

    function creatNFT(string memory _url) public notContract{
        ++tokenId;
        url[tokenId] = _url;
        NFT.safeMint_( msg.sender, tokenId);
    }
    
}