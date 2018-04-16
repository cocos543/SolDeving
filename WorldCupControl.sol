pragma solidity ^0.4.19;

import "./WorldCupFactory.sol";





/**
 * @title Control and manage
 * @author Cocos
 * @dev Use for owner setting operating income address, PayerInterface.
 * 
 */
contract WorldCupControl is WorldCupFactory {
	/// @dev Operating income address.
	address public cooAddress;


    function WorldCupControl() public {
        cooAddress = msg.sender;
    }

	/// @dev Assigns a new address to act as the COO.
    /// @param _newCOO The address of the new COO.
    function setCOO(address _newCOO) external onlyOwner {
        cooAddress = _newCOO;
    }

    /// @dev Allows the CFO to capture the balance available to the contract.
    function withdrawBalance() external onlyOwner {
        uint balance = address(this).balance;
        
        cooAddress.send(balance);
    }
}