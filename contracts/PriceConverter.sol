// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@chainlink/contracts/src/v0.8/interfaces/AggregatorV3Interface.sol";

library PriceConverter {
    function getPrice(
        AggregatorV3Interface priceFeed
    ) internal view returns (uint256) {
        // ABI
        // Address 0x3de1bE9407645533CD0CbeCf88dFE5297E7125e6
        // AggregatorV3Interface priceFeed = AggregatorV3Interface(
        //     0x3de1bE9407645533CD0CbeCf88dFE5297E7125e6
        // );
        (, int256 price, , , ) = priceFeed.latestRoundData();
        // Eth in USD -> 1308.0000
        return uint256(price * 1e10); // 1 ** 10 == 10000000000
    }

    function getConversionRate(
        uint256 ethAmount,
        AggregatorV3Interface priceFeed
    ) internal view returns (uint256) {
        uint256 ethPrice = getPrice(priceFeed);
        uint256 ethAmountInUsd = (ethPrice * ethAmount) / 1e18; // Remember in Solidity 1st (*) then (/)
        return ethAmountInUsd;
    }
}
