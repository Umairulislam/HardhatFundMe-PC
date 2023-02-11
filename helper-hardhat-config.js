const networkConfig = {
    // For Testnet
    5: {
        name: "goerli",
        ethUsdPriceFeed: "0xD4a33860578De61DBAbDc8BFdb98FD742fA7028e",
    },
    // For mainnet
    137: {
        name: "polygon",
        ethUsdPriceFeed: "0x5f4eC3Df9cbd43714FE2740f5E3616155c5b8419",
    },
}

const developmentChains = ["hardhat", "localhost"]
const decimals = 8
const initialAnswer = 200000000000

module.exports = {
    networkConfig,
    developmentChains,
    decimals,
    initialAnswer,
}
