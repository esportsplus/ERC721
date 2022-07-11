// SPDX-License-Identifier: MIT
pragma solidity ^0.8.15;

import {Pausable} from "@openzeppelin/contracts/security/Pausable.sol";
import {ERC721Ownable} from "./ERC721Ownable.sol";

abstract contract ERC721Pausable is ERC721Ownable, Pausable {

    constructor() Pausable() {}


    function pause() external onlyOwner {
        _pause();
    }

    function unpause() external onlyOwner {
        _unpause();
    }
}
