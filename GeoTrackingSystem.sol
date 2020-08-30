pragma solidity ^0.6.0;

contract geoTraccking {
    struct locationStamp {
        uint256 lat;
        uint256 long;
        uint256 dateTime;
    }
    
    mapping (address => locationStamp[]) public userLocations; //address is special type data that use for store user address (0xE.....)
    
    function track(uint256 lat, uint256 long) public { 
        locationStamp memory currentLoc;
        currentLoc.lat = lat;
        currentLoc.long = long;
        currentLoc.dateTime = block.timestamp; // block.timestamp is consensus timestamp, use this instead of user time stamp === Now()
        userLocations[msg.sender].push(currentLoc); //msg.sender is person who submit this transaction
    }
}