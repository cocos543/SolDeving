pragma solidity ^0.4.21;

import "./WorldCupHelper.sol";
import "./SafeMath.sol";

/// @dev PayerInterface must implement ERC20 standard token.
contract PayerInterface {
	function totalSupply() public view returns (uint256);
	function balanceOf(address who) public view returns (uint256);
	function transfer(address to, uint256 value) public returns (bool);

	function allowance(address owner, address spender) public view returns (uint256);
  	function transferFrom(address from, address to, uint256 value) public returns (bool);
  	function approve(address spender, uint256 value) public returns (bool);
}



/**
 * @title AuctionPaused
 * @dev Base contract which allows children to implement an emergency stop mechanism.
 */
contract AuctionPaused is Ownable {
  event AuctionPause();
  event AuctionUnpause();

  bool public auctionPaused = false;


  /**
   * @dev Modifier to make a function callable only when the contract is not auctionPaused.
   */
  modifier whenNotAuctionPaused() {
    require(!auctionPaused);
    _;
  }

  /**
   * @dev Modifier to make a function callable only when the contract is auctionPaused.
   */
  modifier whenAuctionPaused() {
    require(auctionPaused);
    _;
  }

  /**
   * @dev called by the owner to pause, triggers stopped state
   */
  function auctionPause() onlyOwner whenNotAuctionPaused public {
    auctionPaused = true;
    emit AuctionPause();
  }

  /**
   * @dev called by the owner to unpause, returns to normal state
   */
  function auctionUnpause() onlyOwner whenAuctionPaused public {
    auctionPaused = false;
    emit AuctionUnpause();
  }
}

contract WorldCupAuction is WorldCupHelper, AuctionPaused {

	using SafeMath for uint256;

	event PurchaseToken(address indexed _from, address indexed _to, uint256 _tokenId, uint256 _tokenPrice, uint256 _timestamp, uint256 _purchaseCounter);

	/// @dev ERC721 Token upper limit of price, cap.
	///  Cap is the upper limit of price. It represented eth's cap if isEthPayable is true 
	///  or erc20 token's cap if isEthPayable is false.
	///  Note!!! Using 'wei' for eth's cap units. Using minimum units for erc20 token cap units.
	uint public cap;

    uint public finalCap;

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

    uint public purchaseCounter = 0;

    /// @dev Constructor
    /// @param _initPrice erc721 token initialized price.
    /// @param _cap Upper limit of increase price.
    /// @param _isEthPayable 
    /// @param _address PayerInterface address, it must be a ERC20 contract.
    function WorldCupAuction(uint _initPrice, uint _cap, bool _isEthPayable, address _address) public WorldCupFactory(_initPrice) {
        require( (_isEthPayable == false && _address != address(0)) || _isEthPayable == true && _address == address(0) );

        cap           = _cap;
        finalCap      = _cap.add(_cap.mul(25).div(1000));
        isEthPayable  = _isEthPayable;
        payerContract = PayerInterface(_address);
    }

    function purchaseWithEth(uint _tokenId) external payable whenNotAuctionPaused {
    	require(isEthPayable == true);
    	require(msg.sender != tokenOwner[_tokenId]);

    	/// @dev If `_tokenId` is out of the range of the array,
        /// this will throw automatically and revert all changes.
    	Country storage token = countries[_tokenId];
    	uint nextPrice = _computeNextPrice(token);

    	require(msg.value >= nextPrice);

    	uint fee = nextPrice.mul(sysFeePermillage).div(1000);
    	uint oldOwnerRefund = nextPrice.sub(fee);

    	address oldOwner = ownerOf(_tokenId);

    	// Refund eth to the person who owned this erc721 token.
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

    	emit PurchaseToken(oldOwner, msg.sender, _tokenId, nextPrice, now, purchaseCounter);
        purchaseCounter = purchaseCounter.add(1);
    }

    function purchaseWithToken(uint _tokenId) external whenNotAuctionPaused {
    	require(isEthPayable == false);
    	require(payerContract != address(0));
    	require(msg.sender != tokenOwner[_tokenId]);

        Country storage token = countries[_tokenId];
        uint nextPrice = _computeNextPrice(token);

        // We need to know how much erc20 token allows our contract to transfer.
        uint256 aValue = payerContract.allowance(msg.sender, address(this));
        require(aValue >= nextPrice);

        uint fee = nextPrice.mul(sysFeePermillage).div(1000);
        uint oldOwnerRefund = nextPrice.sub(fee);

        address oldOwner = ownerOf(_tokenId);

        // Refund erc20 token to the person who owned this erc721 token.
        require(payerContract.transferFrom(msg.sender, oldOwner, oldOwnerRefund));

        // Transfer fee to the cooAddress.
        require(payerContract.transferFrom(msg.sender, cooAddress, fee));

        // Update token price
        token.price = nextPrice;

        _transfer(oldOwner, msg.sender, _tokenId);

        emit PurchaseToken(oldOwner, msg.sender, _tokenId, nextPrice, now, purchaseCounter);
        purchaseCounter = purchaseCounter.add(1);

    }

    function getTokenNextPrice(uint _tokenId) public view returns(uint) {
        Country storage token = countries[_tokenId];
        uint nextPrice = _computeNextPrice(token);
        return nextPrice;
    }

    function _computeNextPrice(Country storage token) private view returns(uint) {
        if (token.price >= cap) {
            return finalCap;
        }

    	uint price = token.price;
    	uint addPrice = price.mul(increasePermillage).div(1000);

		uint nextPrice = price.add(addPrice);
		if (nextPrice > cap) {
			nextPrice = cap;
		}

    	return nextPrice;
    }

    function _transfer(address _from, address _to, uint256 _tokenId) internal {
        // Clear approval.
        if (tokenApprovals[_tokenId] != address(0)) {
            tokenApprovals[_tokenId] = address(0);
            emit Approval(_from, address(0), _tokenId);
        }

        ownedTokensCount[_to] = ownedTokensCount[_to].add(1);
        ownedTokensCount[_from] = ownedTokensCount[_from].sub(1);
        tokenOwner[_tokenId] = _to;
        emit Transfer(_from, _to, _tokenId);
    }

}








