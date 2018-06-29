pragma solidity ^0.4.16;
import "github.com/Arachnid/solidity-stringutils/strings.sol";

contract GetAPieceOfTheCakev2 {
    
using strings for *;
     struct Cake {
        bool WasHappyWithCake; // weight is accumulated by delegation
        uint pieces;  // if true, that person already voted
        address delegate; // person delegated to
    }
    
     // This declares a state variable that
    // stores a `cake` struct for each possible address.
    mapping(address => Cake) private Cakes;
    
    //The person who created the cake
    address  cakeOwner;
    uint  totalPieces;
    
    constructor(uint _totalPieces) public{
        totalPieces = _totalPieces;
    }
    
    function appendString(string s1, string s2) private returns(string concatanatedString){
     concatanatedString = s1.toSlice().concat(s2.toSlice());
    }
  
     /// Create a new cake
    function GetAPieceOfTheCake(uint quantity) public view
            returns(string responseMessage)                
    {
        if(totalPieces >= quantity){
           cakeOwner = msg.sender;
           totalPieces =  (totalPieces - quantity); 
           responseMessage = appendString("You now have a piece of the cake", "!");
        } else {
            responseMessage =  "Not enough pieces of cake left.";
        }

    }
    
    function HowMuchCakeDoIOwn() public view
                                returns(uint cakePieces){
        cakePieces = Cakes[msg.sender].pieces;
    }
    

}