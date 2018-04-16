pragma solidity ^0.4.19;

import "./WorldCupOwnership.sol";
import "./SafaMath.sol";

/// @dev PayerInterface must implement ERC20 standard token.
contract PayerInterface {
	function totalSupply() public view returns (uint256);
	function balanceOf(address who) public view returns (uint256);
	function transfer(address to, uint256 value) public returns (bool);

	function allowance(address owner, address spender) public view returns (uint256);
  	function transferFrom(address from, address to, uint256 value) public returns (bool);
  	function approve(address spender, uint256 value) public returns (bool);
}


contract WorldCupAuction is WorldCupOwnership {

	using SafeMath for uint256;

	event PurchaseToken(address indexed _from, address indexed _to, uint256 _tokenId, uint256 _tokenPrice);

	/// @dev ERC721 Token upper limit of price, cap.
	///  Cap is the upper limit of price. It represented eth's cap if isEthPayable is true 
	///  or erc20 token's cap if isEthPayable is false.
	///  Note!!! Using 'wei' for eth's cap units. Using minimum units for erc20 token cap units.
	uint public cap;

	/// @dev 1 equal to 0.001
	/// erc721 token's price increasing. Each purchase the price increases 5%
	uint public increasePermillage = 50;

	/// @dev 1 equal to 0.001
	/// Exchange fee 2.3%
	uint public sysFeePermillage = 23;


	/// @dev Contract operating income address.
	PayerInterface public payerContract = PayerInterface(address(0));

    /// @dev If isEthPayable is true, users can only use eth to buy current erc721 token.
    ///  If isEthPayable is false, that mean's users can only use PayerInterface's token to buy current erc721 token.
    bool public isEthPayable;

    /// @dev Constructor
    /// @param _isEthPayable 
    /// @param _address PayerInterface address, it must be a ERC20 contract.
    function WorldCupAuction(uint _initPrice, uint _cap, bool _isEthPayable, address _address) public WorldCupFactory(_initPrice) {
        require( (_isEthPayable == false && _address != address(0)) || _isEthPayable == true && _address == address(0) );

        cap           = _cap;
        isEthPayable  = _isEthPayable;
        payerContract = PayerInterface(_address);
    }

    function purchaseWithEth(uint _tokenId) external payable whenNotPaused {
    	require(isEthPayable == true);
    	require(msg.sender != tokenToOwner[_tokenId]);

    	/// @dev If `_tokenId` is out of the range of the array,
        /// this will throw automatically and revert all changes.
    	Country storage token = countries[_tokenId];
    	uint nextPrice = _computeNextPrice(token);

    	require(msg.value >= nextPrice);

    	uint fee = nextPrice.mul(sysFeePermillage).div(1000);
    	uint oldOwnerRefund = nextPrice.sub(fee);

    	address oldOwner = ownerOf(_tokenId);

    	// Refund eth to the person who owner this erc721 token.
    	oldOwner.transfer(oldOwnerRefund);

    	// Transfer fee to the cooAddress.
    	cooAddress.transfer(fee);

    	// Transfer eth left go back to the sender.
    	if ( msg.value.sub(oldOwnerRefund).sub(fee) > 0.0001 ether ) {
    		msg.sender.transfer( msg.value.sub(oldOwnerRefund).sub(fee) );
    	}

    	//Update token price
    	token.price = nextPrice;

    	_transfer(oldOwner, msg.sender, _tokenId);

    	PurchaseToken(oldOwner, msg.sender, _tokenId, nextPrice);
    }

    function purchaseWithToken(uint _tokenId) external whenNotPaused {
    	require(isEthPayable == false);
    	require(payerContract != address(0));
    	require(msg.sender != tokenToOwner[_tokenId]);


    }

    function _computeNextPrice(Country storage token) private view returns(uint) {
    	uint price = token.price;
    	uint addPrice = price.mul(increasePermillage).div(1000);

		uint nextPrice = price.add(addPrice);
		if (nextPrice > cap) {
			nextPrice = cap;
		}

    	return nextPrice;
    }

}








