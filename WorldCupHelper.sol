pragma solidity ^0.4.19;

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
	    uint[] memory result = new uint[](ownerTokenCount[_owner]);
	    uint counter = 0;

	    for (uint i = 0; i < countries.length; i++) {
			if (tokenToOwner[i] == _owner) {
				result[counter] = i;
				counter++;
			}
	    }
		return result;
  	}

}