pragma solidity ^0.4.19;

import "./Claimable.sol";
import "./Pausable.sol";
import "./SafaMath.sol";

/**
 * @title WorldCupFactory
 * @dev Declare token struct, and enerating all toekn
 */
contract WorldCupFactory is Claimable, Pausable {

	using SafaMath for uint256;

	uint public initPrice;

	string[] public initTokenData = ["a", "b", "c"];

	// @dev Declare token struct    
	struct Country {
		// token name
		string name;
		
		// token current price
		uint price;
	}

	Country[] public countries;

    mapping (address => uint256) ownershipTokenCount;

    /// @dev A mapping from countryIDs to an address that has been approved to call
    ///  transferFrom(). Each Country can only have one approved address for transfer
    ///  at any time. A zero value means no approval is outstanding.
	mapping (uint => address) public tokenToOwner;

	// @dev A mapping from owner address to count of tokens that address owns.
    //  Used internally inside balanceOf() to resolve ownership count.
	mapping (address => uint) public ownerTokenCount;

	
	/// @dev The WorldCupFactory constructor sets the initialized price of One token
	function WorldCupFactory(uint _initPrice) public {
		initPrice = _initPrice;
		
		// Create tokens
		for (uint i = 0; i < initTokenData.length; i++) {
		    _createToken(initTokenData[i]);
		}
	}


	/// @dev Create token with _name, internally.
	function _createToken(string _name) internal {
		uint id = countries.push( Country(_name, price) ) - 1;
		tokenToOwner[id] = msg.sender;
		ownerTokenCount[msg.sender].add(1);
	}

}



