pragma solidity ^0.7.0; //writing the version of solidity to get identified by the remix ide

contract user {
    
    string nothing; //assigning a string to no value to compare it.
    
    string error = "Username or password is incorrect or does not exist."; //assgning a string to output a error 
    
    mapping(string => mapping(string => string)) _mymap; //creating a nested mapping to give a username and password as value to give a key
    
    
    function register(string memory username, string memory password, string memory secret) public { //creating a function to register a user
        _mymap[username][password] = secret; //assigning the user with his secret string
        
        require(bytes(username).length >= 8, "username has less than 8 letters");  //break the function if username has less than 8 letters
        
        require(bytes(password).length >= 8, "password has less than 8 letters");   //break the function if password has less than 8 letters
        
    }
    
    function get_secret(string memory username, string memory password) public view returns(string memory) { //function to the secret with the credentials
    
        require(bytes(username).length >= 8, "username is incorrect or does not exist"); //break the function if username has less than 8 letters
        
        require(bytes(password).length >= 8, "password is incorrect or does not exist"); //break the function if password has less than 8 letters
        
        require(keccak256(bytes(_mymap[username][password])) != keccak256(bytes(nothing)), error); // break the function if username or password is incorrect or does not exist
        
        return _mymap[username][password]; //returning the secret string if all requirement is passed
    }
}
