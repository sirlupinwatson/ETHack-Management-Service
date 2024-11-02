// SPDX-License-Identifier: MIT
// Compatible with OpenZeppelin Contracts ^5.0.0
pragma solidity ^0.8.22;

import "@openzeppelin/contracts@5.1.0/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts@5.1.0/token/ERC20/extensions/ERC20Burnable.sol";
import "@openzeppelin/contracts@5.1.0/token/ERC20/extensions/ERC20Permit.sol";
import "@openzeppelin/contracts@5.1.0/token/ERC20/extensions/ERC20Votes.sol";
import "@openzeppelin/contracts@5.1.0/access/Ownable.sol";

/// @custom:security-contact am@quamtum.one
contract ETHack is ERC20, ERC20Burnable, ERC20Permit, ERC20Votes, Ownable {
    constructor(address initialOwner)
        ERC20("ETHack", "HACK")
        ERC20Permit("ETHack")
        Ownable(initialOwner)
    {
        _mint(msg.sender, 100000000 * 10 ** decimals());
    }

    // The following functions are overrides required by Solidity.

    function _update(address from, address to, uint256 value)
        internal
        override(ERC20, ERC20Votes)
    {
        super._update(from, to, value);
    }

    function nonces(address owner)
        public
        view
        override(ERC20Permit, Nonces)
        returns (uint256)
    {
        return super.nonces(owner);
    }
}
