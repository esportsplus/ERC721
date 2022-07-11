// SPDX-License-Identifier: MIT
pragma solidity ^0.8.15;

import {MerkleProof} from "@openzeppelin/contracts/utils/cryptography/MerkleProof.sol";

error AddressNotAllowed();
error CannotMintMoreThan(uint256 amount);
error NeedToSendMoreETH();
error QuantityWouldExceedMaxSupply();
error MintHasNotStarted();
error MintHasEnded();
error MintClosed();
error PartialRefundFailed();

library MintGate {

    function allowed(address buyer, bytes32[] calldata proof, bytes32 root) internal pure {
        if (proof.length == 0 || !MerkleProof.verify(proof, root, keccak256(abi.encodePacked(buyer)))) {
            revert AddressNotAllowed();
        }
    }

    function open(bool value) internal pure {
        if (!value) {
            revert MintClosed();
        }
    }

    function open(uint256 end, uint256 start) internal view {
        if (block.timestamp < start) {
            revert MintHasNotStarted();
        }

        if (end != 0 && block.timestamp > end) {
            revert MintHasEnded();
        }
    }

    function price(address buyer, uint256 cost, uint256 quantity, uint256 received) internal {
        unchecked {
            uint256 total = cost * quantity;

            if (received < total) {
                revert NeedToSendMoreETH();
            }

            // Refund remaining value
            if (received > total) {
                (bool success, ) = payable(buyer).call{value: (received - total)}('');

                if (!success) {
                    revert PartialRefundFailed();
                }
            }
        }
    }

    function supply(uint256 available, uint256 quantity) internal pure {
        if (quantity > available) {
            revert QuantityWouldExceedMaxSupply();
        }
    }

    function supply(uint256 available, uint256 max, uint256 minted, uint256 quantity) internal pure {
        supply(available, quantity);

        unchecked {
            if (max > 0 && (minted + quantity) > max) {
                revert CannotMintMoreThan({ amount: max });
            }
        }
    }
}