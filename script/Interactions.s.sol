// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

import { Script } from "forge-std/Script.sol";
import { DevOpsTools } from "foundry-devops/src/DevOpsTools.sol";
import { FundMe } from "../src/FundMe.sol";

contract Fund is Script {
    uint256 constant SEND_VALUE = 0.01 ether;

    function fund(address _mostRecentlyDeployed) public {
        FundMe(payable(_mostRecentlyDeployed)).fund{ value: SEND_VALUE }();
    }

    function run() external {
        address mostRecentlyDeployed = DevOpsTools.get_most_recent_deployment(
            "FundMe",
            block.chainid
        );

        vm.startBroadcast();
        fund(mostRecentlyDeployed);
        vm.stopBroadcast();
    }
}

contract Withdraw is Script {
    function withdraw(address _mostRecentlyDeployed) public {
        vm.startBroadcast();
        FundMe(payable(_mostRecentlyDeployed)).withdraw();
        vm.stopBroadcast();
    }

    function run() external {
        address mostRecentlyDeployed = DevOpsTools.get_most_recent_deployment(
            "FundMe",
            block.chainid
        );

        withdraw(mostRecentlyDeployed);
    }
}
