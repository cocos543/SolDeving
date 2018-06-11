pragma solidity ^0.4.21;

import "./Claimable.sol";
import "./Pausable.sol";
import "./SafeMath.sol";
import "./ERC721BasicToken.sol";


contract PausableToken is ERC721BasicToken, Pausable {
	function approve(address _to, uint256 _tokenId) public whenNotPaused {
		super.approve(_to, _tokenId);
	}

	function setApprovalForAll(address _operator, bool _approved) public whenNotPaused {
		super.setApprovalForAll(_operator, _approved);
	}

	function transferFrom(address _from, address _to, uint256 _tokenId) public whenNotPaused {
		super.transferFrom(_from, _to, _tokenId);
	}

	function safeTransferFrom(address _from, address _to, uint256 _tokenId) public whenNotPaused {
		super.safeTransferFrom(_from, _to, _tokenId);
	}
	
	function safeTransferFrom(
	    address _from,
	    address _to,
	    uint256 _tokenId,
	    bytes _data
	  )
	    public whenNotPaused {
		super.safeTransferFrom(_from, _to, _tokenId, _data);
	}
}


/**
 * @title WorldCupFactory
 * @author Cocos
 * @dev Declare token struct, and generated all toekn
 */
contract WorldCupFactory is Claimable, PausableToken {

	using SafeMath for uint256;

	uint public initPrice;

	//string[] public initTokenData = [];

	// @dev Declare token struct    
	struct Country {
		// token name
		string name;
		
		// token current price
		uint price;
	}

	Country[] public countries;

    /// @dev A mapping from countryIDs to an address that has been approved to call
    ///  transferFrom(). Each Country can only have one approved address for transfer
    ///  at any time. A zero value means no approval is outstanding.
	//mapping (uint => address) internal tokenOwner;

	// @dev A mapping from owner address to count of tokens that address owns.
    //  Used internally inside balanceOf() to resolve ownership count.
	//mapping (address => uint) internal ownedTokensCount;

	
	/// @dev The WorldCupFactory constructor sets the initialized price of One token
	function WorldCupFactory(uint _initPrice) public {
		initPrice = _initPrice;
		paused    = true;
	}

	function createToken() external onlyOwner {
		// Create tokens
		uint length = countries.length;
		for (uint i = length; i < length + 100; i++) {
			if (i >= 836 ) {
				break;
			}

			if (i < 101) {
				_createToken("Country");
			}else {
				_createToken("Player");
			}
		}
	}

	/// @dev Create token with _name, internally.
	function _createToken(string _name) internal {
		uint id = countries.push( Country(_name, initPrice) ) - 1;
		tokenOwner[id] = msg.sender;
		ownedTokensCount[msg.sender] = ownedTokensCount[msg.sender].add(1);
	}

}



