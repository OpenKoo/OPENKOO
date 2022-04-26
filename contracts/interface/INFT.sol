//   SPDX-License-Identifier: Apache-2.0
pragma solidity ^0.8.0;

interface INFT {
    function safeMint_(address to, uint256 tokenId) external;
}