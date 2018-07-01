pragma solidity ^0.4.16;
import "github.com/Arachnid/solidity-stringutils/strings.sol";


contract RestrictingAccessToTheCake {
  
    using strings for *;

    struct cake {
        bool wasHappyWithCake; 
        uint pieces;  
    }
    
     // This declares a state variable that
    // stores a `cake` struct for each possible address.
    mapping(address => cake) public cakes;
    
    // Addresses is this mapping will be allowed to take a slice of cake
    mapping(address => bool) public AddressedAllowedCake;
    
    
     modifier allowedCake()
    {
        require(
            AddressedAllowedCake[msg.sender] == true ,
            "Sender not authorized."
        );
        // Do not forget the "_;"! It will
        // be replaced by the actual function
        // body when the modifier is used.
        _;
    }
    
    
    //The person who created the cake
    address  cakeOwner;
    uint  totalPieces;
    
    constructor(uint _totalPieces) public{
    totalPieces = _totalPieces;
    cakeOwner = msg.sender;
    }
    
    
    function GiveAccess(address user) returns (string){
      require(
            cakeOwner == msg.sender,
            "Sender not authorized."
        );
        
     AddressedAllowedCake[msg.sender] = true;
     return "permissions granted";
    }
    function appendString(string s1, string s2) private returns(string concatanatedString){
     concatanatedString = s1.toSlice().concat(s2.toSlice());
    }
  
     /// Create a new cake
    function GetAPieceOfTheCake(uint quantity) allowedCake() public
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