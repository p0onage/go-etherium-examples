pragma solidity ^0.4.16;
import "github.com/Arachnid/solidity-stringutils/strings.sol";


contract GetAPieceOfTheCakev2 {
  
    using strings for *;

    struct cake {
        bool wasHappyWithCake; 
        uint pieces;  
    }
    
     // This declares a state variable that
    // stores a `cake` struct for each possible address.
    mapping(address => cake) public cakes;
    
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
    function GetAPieceOfTheCake(uint quantity) public
            returns(string responseMessage, uint piecesofcakeleft, address adrss)                
    {
        if(totalPieces >= quantity){
           address buyer = msg.sender;
           totalPieces =  (totalPieces - quantity);
           uint currentPieces = cakes[buyer].pieces;
           cakes[buyer] = cake({wasHappyWithCake:true,pieces:(quantity + currentPieces) });
           piecesofcakeleft = totalPieces;
           responseMessage = appendString("You now have a piece of the cake", "!");
       adrss = buyer;
        } else {
            responseMessage =  "Not enough pieces of cake left.";
        }

    }
    
    function HowMuchCakeDoIOwn() public view
                                returns(uint cakePieces){
        cakePieces = cakes[msg.sender].pieces;
    }
    
    function getAccount() public view
                            returns (address sender){
                            sender = msg.sender;
                                
                            
  }
  
   function getPiecesLeft() public view
                            returns (uint piecesLeft){
                            piecesLeft = totalPieces;
                                
                            
  }
    
}