pragma solidity ^0.4.11;

contract LLTokenInterface {
    function balanceOf(address who) constant returns (uint256);
    function allowance(address owner, address spender) constant returns (uint256);
    function transferFrom(address from, address to, uint256 value) returns (bool);
    function approve(address spender, uint256 value) returns (bool);
}

contract SolDeving {
    event PayableCalled(uint gwei, address sender);
    event PayLLT(address from, address to, uint amount);
    
    address public bossAddress = 0x14723a09acff6d2a60dcdf7aa4aff308fddc160c;
    LLTokenInterface public lltContract;
    
    function () public payable {
        uint v = msg.value;
        PayableCalled(v, msg.sender);
    }

    function setLLTokenInterface(address _address) {
        lltContract = LLTokenInterface(_address);
    }
    
    function payLLT() public {
        uint256 value = lltContract.allowance(msg.sender, address(this));
        require(value > 0);
        require(bossAddress != address(0));

        lltContract.transferFrom(msg.sender, bossAddress, value);
        PayLLT(msg.sender, bossAddress, value);
    }
}