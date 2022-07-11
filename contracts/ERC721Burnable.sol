// SPDX-License-Identifier: MIT
pragma solidity ^0.8.15;

import {ERC721} from "./ERC721.sol";

abstract contract ERC721Burnable is ERC721 {

    function burn(uint256 tokenId) public virtual {
        _burn(tokenId, true);
    }
}
