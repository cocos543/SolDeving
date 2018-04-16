pragma solidity ^0.4.19;

import "./ERC721Basic.sol";
import "./SafaMath.sol";
import "./WorldCupHelper.sol";

/**
 * @title WorldCupOwnership
 * @author Cocos
 * @dev Implement ERC721 Non-Fungible Token Standard basic interface
 * 
 */
contract WorldCupOwnership is WorldCupHelper, ERC721Basic {

	using SafeMath for uint256;

	mapping (uint => address) tokenApprovals;

	modifier onlyOwnerOf(uint _tokenId) {
		require(msg.sender == tokenToOwner[_tokenId]);
		_;
	}

	function balanceOf(address _owner) public view returns (uint256 _balance) {
		return ownerTokenCount[_owner];
	}

	function ownerOf(uint256 _tokenId) public view returns (address _owner) {
		return tokenToOwner[_tokenId];
	}

	function _transfer(address _from, address _to, uint256 _tokenId) internal {
		ownerTokenCount[_to] = ownerTokenCount[_to].add(1);
		ownerTokenCount[msg.sender] = ownerTokenCount[msg.sender].sub(1);
		tokenToOwner[_tokenId] = _to;
		Transfer(_from, _to, _tokenId);
	}

	function transfer(address _to, uint256 _tokenId) public onlyOwnerOf(_tokenId) {
		_transfer(msg.sender, _to, _tokenId);
	}

	function approve(address _to, uint256 _tokenId) public onlyOwnerOf(_tokenId) {
		tokenApprovals[_tokenId] = _to;
		Approval(msg.sender, _to, _tokenId);
	}

	function takeOwnership(uint256 _tokenId) public {
		require(tokenApprovals[_tokenId] == msg.sender);
		address owner = ownerOf(_tokenId);
		_transfer(owner, msg.sender, _tokenId);
	}
}



