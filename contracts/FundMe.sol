// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

import { PriceConverter } from "./PriceConverter.sol";

contract FundMe {
    using PriceConverter for uint256;

    uint256 public minimumUsd = 5e18;
    address[] public funders;
    mapping(address => uint256) public addressToAmountFunded;

    address public owner;

    constructor() {
        owner = msg.sender;
    }

    function fund() public payable {
        // require user to minimum send 5$ worth of wei, need to convert to wei
        // why parameter empty? because the value that called the function are already passed as parameter
        require(
            msg.value.getConversionRate() >= minimumUsd,
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

        // // transfer the fund using "transfer", if error revert the transaction
        // payable(msg.sender).transfer(address(this).balance);

        // // transfer the fund using "send" return bool
        // bool isSuccess = payable(msg.sender).send(address(this).balance);
        // require(isSuccess, "Send failed");

        // transfer the fund using "call" return bool
        (bool callSuccess, ) = payable(msg.sender).call{
            value: address(this).balance
        }("");
        require(callSuccess, "Call failed");
    }

    // decorator
    modifier onlyOwner() {
        // require first then _ because it will call the require first then run the rest of the code
        // if _ first then the require, it will run the code first then require
        // the order of the _ is matter
        require(msg.sender == owner, "Sender is not owner!");
        _;
    }
}
