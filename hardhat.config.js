require("@nomiclabs/hardhat-ethers")
require("@nomicfoundation/hardhat-toolbox")
require("@nomiclabs/hardhat-etherscan")
require("@nomicfoundation/hardhat-chai-matchers")
require("dotenv").config()
require("hardhat-gas-reporter")
require("solidity-coverage")
require("hardhat-deploy")

// RPC_URL from Alchemy | If one 1st varaible doesn't exist it goes to the 2nd one
const GOERLI_RPC_URL = process.env.GOERLI_RPC_URL || "goerlinetwork"
// Private Key Metamask
const PRIVATE_KEY = process.env.PRIVATE_KEY || "privatekey"
// API Key Etherscan
const ETHERSCAN_API_KEY = process.env.ETHERSCAN_API_KEY || "apikey1"
// COINMARKET-API-KEY
const COINMARKET_API_KEY = process.env.COINMARKET_API_KEY || "apikey2"

// This module has the default network of Hardhat
// Hardhat give differnt test net and Private keys
/** @type import('hardhat/config').HardhatUserConfig */
module.exports = {
    solidity: "0.8.17",
    defaultNetwork: "hardhat",
    networks: {
        goerli: {
            url: GOERLI_RPC_URL,
            accounts: [PRIVATE_KEY],
            chainId: 5,
            blockConfirmations: 6,
        },
    },
    gasReporter: {
        enabled: true,
        outputFile: "gas-report.txt",
        noColors: true,
        currency: "USD",
        // To get currency we net to get an API key from Coinmarket
        coinmarketcap: COINMARKET_API_KEY,
        token: "ETH",
    },
    etherscan: {
        apiKey: ETHERSCAN_API_KEY,
    },
    namedAccounts: {
        deployer: {
            default: 0,
        },
        user: {
            default: 1,
        },
    },
}
