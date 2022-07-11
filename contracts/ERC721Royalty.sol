// SPDX-License-Identifier: MIT
pragma solidity ^0.8.15;

import {ERC2981} from "./ERC2981/ERC2981.sol";
import {ERC721A} from "./ERC721.sol";
import {ERC721Ownable} from "./ERC721Ownable.sol";

abstract contract ERC721Royalty is ERC721Ownable, ERC2981 {

    constructor(address receiver, uint64 fee) ERC2981(receiver, fee) {}


    function setDefaultRoyaltyInfo(address receiver, uint64 fee) internal onlyOwner {
        _setDefaultRoyaltyInfo(receiver, fee);
    }

    function setRoyaltyInfo(uint256 tokenId, address receiver, uint64 fee) internal onlyOwner {
        _setRoyaltyInfo(tokenId, receiver, fee);
    }

    function supportsInterface(bytes4 interfaceId) public view virtual override(ERC721A, ERC2981) returns (bool) {
        return super.supportsInterface(interfaceId);
    }
}
