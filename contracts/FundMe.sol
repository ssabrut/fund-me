// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

import { PriceConverter } from "./PriceConverter.sol";

error notOwner();

// 810.098 gas
// 790.140 gas (after using constant)
contract FundMe {
    using PriceConverter for uint256;

    uint256 public constant MINIMUM_USD = 5e18;
    address[] public funders;
    mapping(address => uint256) public addressToAmountFunded;

    address public immutable i_owner;

    constructor() {
        i_owner = msg.sender;
    }

    receive() external payable {
        fund();
    }

    fallback() external payable {
        fund();
    }

    function fund() public payable {
        // require user to minimum send 5$ worth of wei, need to convert to wei
        // why parameter empty? because the value that called the function are already passed as parameter
        require(
            msg.value.getConversionRate() >= MINIMUM_USD,
            "Didn't sent enough ETH"
        );
        funders.push(msg.sender);
        addressToAmountFunded[msg.sender] += msg.value;
    }

    function withdraw() public onlyOwner {
        for (
            uint256 funderIndex = 0;
            funderIndex < funders.length;
            funderIndex++
        ) {
            address funder = funders[funderIndex];
            addressToAmountFunded[funder] = 0;
        }

        // reset the array
        funders = new address[](0);

        // transfer the fund using "call" return bool
        (bool callSuccess, ) = payable(msg.sender).call{
            value: address(this).balance
        }("");
        require(callSuccess, "Call failed");
    }

    // decorator
    modifier onlyOwner() {
        // if _ first then the require, it will run the code first then require
        // the order of the _ is matter
        if (msg.sender != i_owner) {
            revert notOwner(); // replacement for "require" function for gas efficiency
        }
        _;
    }
}
