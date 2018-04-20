pragma solidity ^0.4.21;

import "./WorldCupControl.sol";


/**
 * @title Define 
 * @author Cocos
 * @dev Provide some function for web front-end that can be use for convenience.
 * 
 */
contract WorldCupHelper is WorldCupControl {

	/// @dev return tokenid array
	function getTokenByOwner(address _owner) external view returns(uint[]) {
	    uint[] memory result = new uint[](ownedTokensCount[_owner]);
	    uint counter = 0;

	    for (uint i = 0; i < countries.length; i++) {
			if (tokenOwner[i] == _owner) {
				result[counter] = i;
				counter++;
			}
	    }
		return result;
  	}

}