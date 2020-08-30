pragma solidity ^0.6.0; //0.6.x

contract helloWorld {
    string public name = "Boy"; //if not public, it will be private automatically
                                 //if private, its hard to see (but can)
    uint256 age = 21;
    
    function updateName(string memory newName) public { //memory is use just for some datatypes ex: string, array   
        name = newName;
    }
    
    function addAge() public { //function that create or change data it will use gas (its not change data its create new data and replace) 
        age += 1;
    }
    
    function readAge() public view returns (uint256) { //view is not use gas (just read)
        return age;
    }
}