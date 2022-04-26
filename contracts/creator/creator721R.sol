//   SPDX-License-Identifier: Apache-2.0
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/access/Ownable.sol";
import "erc721a/contracts/ERC721A.sol";


contract creator721R is ERC721A, Ownable{

    uint256 public constant mintPrice = 0.01 ether;

    bool public refundState;

    address public _agent;

    mapping(address => uint256) public userMintAmount;


    constructor() ERC721A("KOO","KOO"){
        _agent = msg.sender;
    }
    
    modifier notContract(){
        require(!Address.isContract(msg.sender),"No contract");
        _;
    }

    function publicMint(uint256 amount) public payable notContract(){

        require(msg.value >= amount*mintPrice ,"Not enough eth sent");

        userMintAmount[msg.sender] += amount;
        
        _safeMint(msg.sender, amount);

    }

    function setAgent(address agent) public onlyOwner(){
        _agent = agent;
    }

    function ownerMint(uint256 amount) public onlyOwner(){
        _safeMint( msg.sender, amount);
    } 

    function withdraw() public onlyOwner(){
        uint256 balance = address(this).balance;
        Address.sendValue(payable(owner()),balance);
    }

    function refund(uint256[] calldata tokenIds) external {
        require(refundState == true , "can't to refund");

        for(uint256 i = 0 ; i < tokenIds.length; i ++){
            uint256 tokenId = tokenIds[i];
            require(msg.sender == ownerOf(tokenId), "Not token owner");
            transferFrom(msg.sender, _agent, tokenId);
        }

        uint256 refundAmount = tokenIds.length * mintPrice;
        Address.sendValue(payable(msg.sender), refundAmount);
    }

    function refundActive() public onlyOwner {
        refundState = !refundState;
    }


}