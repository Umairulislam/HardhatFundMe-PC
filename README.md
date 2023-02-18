# Hardhat-FUND-ME PROJECT

## INTRODUCTION
This is a smart contract-based fundraising platform built on the Ethereum blockchain. The smart contract is written in Solidity and the project is built using the Hardhat development framework. The platform also uses JavaScript and NodeJS for front-end development.
### Built With
*  [JavaScript](https://www.javascript.com/)
*  [Solidity](https://docs.soliditylang.org/en/v0.8.18/)
*  [Node.js](https://nodejs.org/en/)
*  [ReactJs](https://reactjs.org/)
*  [Hardhat](https://hardhat.org/)
*  [ESLint](https://eslint.org/)
*  [Ethereum](https://ethereum.org/en/)
*  [Prettier](https://prettier.io/)
*  [Alchemy](https://www.alchemy.com/)
*  [Etherscan](https://etherscan.io/)
*  [git](https://git-scm.com/)
*  [MetaMask](https://metamask.io/)
*  [GitHub](https://github.com/)

## GETTING STARTED
* Git
* NodeJS
* Yarn | npm

In this project I will be uing *yarn* .
You van check the version by running
```shell
git --version
```
```shell
node --version
```
```shell
yarn --version
```
### Quick Start
Clone the repository from the GitHub
```bash
git clone https://github.com/Umairulislam/HardhatFundMe-PC.git
```
Install the project dependencies using yarn
```bash
yarn install
```

## USAGE
Here are some of the basic commands used in this project with Hardhat:

This command starts the Hardhat network and runs the development environment.
```shell
yarn run hardhat
```
This command runs the test cases for the smart contract.
```shell
yarn run test
```
This command deploys the smart contract to the Hardhat network.
```shell
yarn hardhat deploy
```
This command lists all the accounts available on the Hardhat network.
```shell
yarn hardhat account list
```
This command retrieves the details of a transaction with a given transaction hash.
```shell
yarn hardhat txn <transaction-hash>
```

## TESTING
The project can be tested using the following command:
```shell
yarn hardhat test
```
### Coverage
To see coverage detail run
```shell
yarn hardhat coverage
```

## DEPLOYING ON A TEST-NET OR MAIN-NET
1. Setup environment variables
* GOERLI_RPC_URL
* PRIVATE_KEY

You can get GOERLI_RPC_URL from [Alchemy](https://www.alchemy.com/)
You can get PRIVATE_KEY from your **MetaMask** wallet

**Remember Don't share yout Private key with anyone**
**Remember add your *GOERLI_RPC_URL* and *PRIVATE_KEY* in *.env* file**

2. Get test-net Eth from the following website
[Faucets.chainlink](https://faucets.chain.link/)

3. Deploy using following command
```shell
yarn hardhat deploy
```

## SCRIPTS
After deployment, the following scripts can be run:
```bash
yarn hardhat run scripts/fund.js
```
or
```bash
yarn hardhat run scripts/withdraw.js
```
### Formatting
You can formate your code by running
```bash
yarn format
```
