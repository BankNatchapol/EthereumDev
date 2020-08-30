pragma solidity ^0.6.0;

contract Bank {
    mapping (address => uint256) private balances;
    
    address[] accounts;
    function deposit() public payable returns (uint256) { // payable is you can add ether 
        if (0 == balances[msg.sender]) {
            accounts.push(msg.sender);
        }
        balances[msg.sender] += msg.value;
        
        return balances[msg.sender];
    }
    
    function withdraw(uint256 withdrawAmount) public returns (uint256 remainingBal) { 
        require(balances[msg.sender] >= withdrawAmount, "Balance is not enough.");
        balances[msg.sender] -= withdrawAmount;
        
        msg.sender.transfer(withdrawAmount); // .transfer() can use after address, it will transfer money to that account
        
        return balances[msg.sender];
    }
    
    function balanceOf(address user) public view returns (uint256) {
        return balances[user];
    }
    
    address public owner;
    constructor () public {
        owner = msg.sender;
    }
    
    function systemDeposit() public payable {
        require(owner == msg.sender, "You're not authorized");
    }
    
    function systemWithdraw(uint256 amount) public {
        require(owner == msg.sender, "You're not authorized.");
        msg.sender.transfer(amount);
    }
    
    function systemBalance() public view returns (uint256) {
        return address(this).balance; // return balance of bank
    }
}