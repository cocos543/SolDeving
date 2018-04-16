pragma solidity ^0.4.19;


/**
 * @title ERC721 Non-Fungible Token Standard basic interface
 * @dev see https://github.com/ethereum/EIPs/blob/master/EIPS/eip-721.md
 */
contract ERC721Basic {
	event Transfer(address indexed _from, address indexed _to, uint256 _tokenId);
	event Approval(address indexed _owner, address indexed _approved, uint256 _tokenId);

	function balanceOf(address _owner) public view returns (uint256 _balance);
	function ownerOf(uint256 _tokenId) public view returns (address _owner);
	function transfer(address _to, uint256 _tokenId) public;

	function approve(address _to, uint256 _tokenId) public;
	function takeOwnership(uint256 _tokenId) public;
}
