pragma solidity ^0.4.21;

contract LLTokenInterface {
    function balanceOf(address who) constant returns (uint256);
    function allowance(address owner, address spender) constant returns (uint256);
    function transferFrom(address from, address to, uint256 value) returns (bool);
    function approve(address spender, uint256 value) returns (bool);
}

contract SolDeving {
    
    event PayableCalled(uint gwei, address sender);
    event PayLLT(address from, address to, uint amount);
    
    string[] public initTokenData = ["a", "b", "c"];

    // @dev Declare token struct    
    struct Country {
        // token name
        string name;
        
        // token current price
        uint price;
    }
    
    
    struct LockOne {
        uint amount;
        uint untilTime;
    }

    Country[] public countries;
    
    mapping (uint => address) public tokenToOwner;

    mapping (address => uint) public ownerTokenCount;
    
    mapping(address => LockOne[]) public locks;
    
    mapping(address => uint) public ownedLockAmount;
    
    address public bossAddress = 0x14723a09acff6d2a60dcdf7aa4aff308fddc160c;
    LLTokenInterface public lltContract = LLTokenInterface(0x14723a09acff6d2a60dcdf7aa4aff308fddc160c);
    
    function () public payable {
        uint v = msg.value;
        PayableCalled(v, msg.sender);
    }

    function addLocks(uint _amount, uint _timestamp) public {
        locks[msg.sender].push(LockOne(_amount, _timestamp));
        ownedLockAmount[msg.sender] = ownedLockAmount[msg.sender] + _amount;
    }

    function getLockByIndex(uint index) public returns(uint, uint) {
        LockOne lOne = locks[msg.sender][index];
        return (lOne.amount, lOne.untilTime);
    }
    
    function getLockAmountByOwner(address _owner) public returns(uint) {
        return ownedLockAmount[_owner];
    }
    
    
}