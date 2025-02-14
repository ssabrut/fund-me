// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

import { PriceConverter } from "./PriceConverter.sol";

contract FundMe {
    using PriceConverter for uint256;

    uint256 public minimumUsd = 5e18;
    address[] public funders;
    mapping(address => uint256) public addressToAmountFunded;

    function fund() public payable {
        // require user to minimum send 5$ worth of wei, need to convert to wei
        // why parameter empty? because the value that called the function are already passed as parameter
        require(
            msg.value.getConversionRate() >= minimumUsd,
            "Didn't sent enough ETH"
        );

        funders.push(msg.sender);
        addressToAmountFunded[msg.sender] =
            addressToAmountFunded[msg.sender] +
            msg.value;
    }

    function withdraw() public {}
}
