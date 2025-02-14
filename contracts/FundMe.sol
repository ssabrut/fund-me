// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

contract FundMe {
    uint256 public minimumUsd = 5;

    function fund() public payable {
        // require user to minimum send 5$ worth of wei, need to convert to wei
        require(msg.value >= minimumUsd, "Didn't send enough ETH"); // if not successful, revert the transaction
    }

    function withdraw() public {}
}
