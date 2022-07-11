// SPDX-License-Identifier: MIT
pragma solidity ^0.8.15;

abstract contract Mintable {

    uint32 public constant STATE_CLOSED = 0;
    uint32 public constant STATE_OPEN = 1;

    uint32 public constant STATE_ALLOWLIST = 2;
    uint32 public constant STATE_GIVEAWAY = 3;
    uint32 public constant STATE_PUBLIC = 4;


    uint32 private _state;


    function _setState(uint32 state) internal {
        _state = state;
    }

    function isGiveawayOpen() public view returns(bool) {
        return _state == STATE_OPEN || _state == STATE_GIVEAWAY;
    }

    function isMintAllowlist() public view returns(bool) {
        return _state == STATE_OPEN || _state == STATE_ALLOWLIST;
    }

    function isMintClosed() public view returns(bool) {
        return _state == STATE_CLOSED;
    }

    function isMintOpen() public view returns(bool) {
        return _state != STATE_CLOSED;
    }

    function isMintPublic() public view returns(bool) {
        return _state == STATE_OPEN || _state == STATE_PUBLIC;
    }
}
