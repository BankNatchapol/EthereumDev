pragma solidity ^0.6.0;
pragma experimental ABIEncoderV2;
// SPDX-License-Identifier: MIT

contract SimpleVoting {
 
    mapping (string => uint256) votesReceived;
    mapping (address => uint) userVoted;
    
    string[] public candidateList;
    
    constructor(string[] memory candidateNames) public {
        candidateList = candidateNames;
    }
    
    function voteForCandidate( string memory candidate) public {
        require(userVoted[msg.sender] != 1, "you're already voted.");
        userVoted[msg.sender] = 1;
        votesReceived[candidate] += userVoted[msg.sender];
        
        
    }
    
    function totalVotesFor(string memory candidate) public view returns (uint256){
        return votesReceived[candidate];
    }
    
    function candidateCount() public view returns (uint256){ // if need to use length of array you need to create count function
        return candidateList.length;
    }
}