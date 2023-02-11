// SPDX-License-Identifier: MIT
// 1. Pragma
pragma solidity ^0.8.0;
// 2. Imports
import "@chainlink/contracts/src/v0.8/interfaces/AggregatorV3Interface.sol";
import "./PriceConverter.sol";
// Error codes
error FundMe__NotOwner();

// 3. Interfaces, Libraries, Contracts
/** @title A contract for crowd funding
 *  @author Umair ul islam
 *  @notice Funding contarct
 *  @dev This implements price feeds as our library
 */

// We are replacing public constant and immutable variables with new names
// S => storage
// i => immutable
// UPPERCASE => constant
contract FundMe {
    // Type Declarations
    using PriceConverter for uint256;
    // State Variables
    address[] public s_funders;
    address private immutable i_owner;
    uint256 public constant MINIMUM_USD = 50 * 1e18;
    mapping(address => uint256) public s_addressToAmountFunded;
    AggregatorV3Interface public s_priceFeed;

    // Modifiers
    modifier onlyOwner() {
        require(msg.sender == i_owner, "Sender is not owner!");
        _;
    }

    // Functions Order:
    // constructor
    // receice
    // fallback
    // external
    // public
    // internal
    // private
    // view/pure

    // i_owner of the contract
    constructor(address s_priceFeedAddress) {
        i_owner = msg.sender;
        s_priceFeed = AggregatorV3Interface(s_priceFeedAddress);
    }

    // receive() external payable {
    //     fund();
    // }

    // fallback() external payable {
    //     fund();
    // }

    function fund() public payable {
        // want to be able to set a min fund amount in USD
        require(
            msg.value.getConversionRate(s_priceFeed) >= MINIMUM_USD,
            "Didn't send enough ETH!"
        );
        // 1e18 == 1 * 10 ** 18 == 1000000000000000000 Wei
        s_funders.push(msg.sender);
        s_addressToAmountFunded[msg.sender] = msg.value;
    }

    function withdraw() public payable onlyOwner {
        for (
            uint256 funderIndex = 0;
            funderIndex < s_funders.length;
            funderIndex++
        ) {
            address funder = s_funders[funderIndex];
            s_addressToAmountFunded[funder] = 0;
        }
        // Reset array
        s_funders = new address[](0);
        (bool success, ) = payable(msg.sender).call{
            value: address(this).balance
        }("");
        // Call vs Delegate call
        require(success, "Transfer Failed");
    }

    // This function take less gas as compared to above
    function cheaperWithdraw() public payable onlyOwner {
        address[] memory funders = s_funders;
        // mappings can't be in memory
        for (
            uint256 funderIndex = 0;
            funderIndex < funders.length;
            funderIndex++
        ) {
            address funder = funders[funderIndex];
            s_addressToAmountFunded[funder] = 0;
        }
        s_funders = new address[](0);
        (bool success, ) = i_owner.call{value: address(this).balance}("");
        require(success);
    }
}
