pragma solidity ^0.4.19;

import "./WorldCupAuction.sol";

contract CryptoWCRC is WorldCupAuction {

	string public constant name = "CryptoWCRC";
    
    string public constant symbol = "WCRC";

    function CryptoWCRC(uint _initPrice, uint _cap, bool _isEthPayable, address _address) public WorldCupAuction(_initPrice, _cap, _isEthPayable, _address) {

    }

    function totalSupply() public view returns (uint256) {
    	return countries.length;
    }

}