// SPDX-License-Identifier: GPL-3.0-or-later
pragma solidity ^0.8.0;

interface INFT {
    function safeMint_(address to, uint256 tokenId) external;
}