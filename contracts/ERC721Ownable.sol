// SPDX-License-Identifier: MIT
pragma solidity ^0.8.15;

import {Ownable} from "@openzeppelin/contracts/access/Ownable.sol";
import {ERC721} from "./ERC721.sol";

abstract contract ERC721Ownable is ERC721, Ownable {

    constructor() Ownable() {}

}
