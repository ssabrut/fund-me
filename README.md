# Smart Contract Fundraising

A **simple and secure smart contract** designed for fundraising on Ethereum. This contract allows you to receive ETH from contributors and enables authorized withdrawals once the fundraising goal is reached. This guide will help you run and test the smart contract step-by-step using [Remix IDE](https://remix.ethereum.org).

---

## Table of Contents

- [Overview](#overview)
- [Prerequisites](#prerequisites)
- [Setup with Remix IDE](#setup-with-remix-ide)
- [Deployment](#deployment)
- [Testing the Contract](#testing-the-contract)
- [Contributing](#contributing)
- [License](#license)

---

## Overview

The smart contract is written in Solidity and provides the following functionalities:

- **Receive ETH contributions:** Allow anyone to send ETH to the contract.
- **Withdraw ETH:** Enable authorized accounts to withdraw the collected funds.
- **Transparency:** All transactions are recorded on the Ethereum blockchain.

---

## Prerequisites

Before you begin, ensure you have the following:

- A modern web browser (Chrome/Firefox recommended)
- Internet connection
- [Remix IDE](https://remix.ethereum.org) (a web-based Solidity IDE)
- Basic knowledge of Ethereum and Solidity (helpful but not required)

---

## Setup with Remix IDE

Follow these steps to run the project using Remix IDE:

1. **Open Remix IDE:**
   - Navigate to [Remix IDE](https://remix.ethereum.org) in your browser.

2. **Create a New File:**
   - In the File Explorer on the left, click on the "+" icon to create a new Solidity file.
   - Name the file (e.g., `Fundraising.sol`).

3. **Copy the Contract Code:**
   - Paste your smart contract source code into the new file. If you need a starting point, use the template code provided in this repository.

4. **Select the Solidity Compiler:**
   - Click on the "Solidity Compiler" tab (the compiler icon on the left sidebar).
   - Choose the appropriate compiler version that matches your contract's pragma statement.
   - Click "Compile Fundraising.sol" to compile the contract.

---

## Deployment

After successfully compiling the contract:

1. **Navigate to the Deploy & Run Transactions Panel:**
   - Click on the "Deploy & Run Transactions" tab in Remix (the Ethereum logo on the left sidebar).

2. **Configure Environment:**
   - Select the environment suitable for you:
     - **JavaScript VM:** For local testing.
     - **Injected Web3:** To connect using MetaMask.
   - Ensure your account has some ETH (only required if not using JavaScript VM).

3. **Deploy the Contract:**
   - From the "Contract" dropdown, select your compiled contract (`Fundraising`).
   - (Optional) Set the constructor parameters if required.
   - Click "Deploy" and wait for the transaction to complete.

4. **Verify Deployment:**
   - Once deployed, your contract instance will appear under the "Deployed Contracts" section.

---

## Testing the Contract

1. **Receiving ETH (Donation):**
   - Expand the deployed contract in the Remix interface.
   - Locate the function (e.g., `donate` or a fallback function) that allows ETH contributions.
   - Enter a value in ETH in the "Value" field.
   - Click the function button to execute the transaction.

2. **Withdraw ETH:**
   - After accumulating funds, use the withdrawal function provided (e.g., `withdraw`) to transfer funds to the authorized account.
   - Ensure you have the proper permissions set in the contract if applicable.

3. **Interact and Verify:**
   - Use Remix's built-in transaction logs and console to inspect the transaction details.
   - Confirm that the expected amount of ETH has been received or withdrawn.

---

## Contributing

Contributions are welcome! Follow these steps to contribute:

1. **Fork the Repository:** Fork this repository to create your own copy.
2. **Create a Branch:** Make your changes on a feature branch.
3. **Submit a Pull Request:** Describe your changes and submit your PR for review.

---

## License

This project is licensed under the **MIT License**. See the [LICENSE](LICENSE) file for details.
