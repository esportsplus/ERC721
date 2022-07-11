// SPDX-License-Identifier: MIT
pragma solidity ^0.8.15;

import {ERC721AQueryable} from "erc721a/contracts/extensions/ERC721AQueryable.sol";
import {ERC721, ERC721A} from "./ERC721.sol";

abstract contract ERC721Queryable is ERC721, ERC721AQueryable {

    function _baseURI() internal override(ERC721, ERC721A) view virtual returns (string memory) {
        return super._baseURI();
    }

    function _startTokenId() internal override(ERC721, ERC721A) view virtual returns(uint256) {
        return super._startTokenId();
    }
}
