//  SPDX-License-Identifier: Apache-2.0

pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract NFT is ERC721 , Ownable {

    address public creator;

    constructor() ERC721("OPK","OPK") {

    }
    modifier onlyCreator() {
        require(msg.sender == creator);
        _;
    }

    function initialize(address _creator) public onlyOwner(){
        creator = _creator;
    }

    function safeMint_(address to, uint256 tokenId) public onlyCreator() {
        _safeMint(to, tokenId);
    }
}