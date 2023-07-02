// why: An open way to distribute coins for a particular NFT DAO
// what: Act as an access control mechanism to allow only the holders to mint coins
// how: Holders of this contract can interact with controller to mint X amount of tokens.


import {ERC721} from "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import {Ownable} from "@openzeppelin/contracts/access/Ownable.sol";

contract NFT is ERC721, Ownable {

    error NON_ZERO_BALANCE();
    uint256 public tokenCounter; // to track number of NFTs minted and show the next NFT token ID

    // 2. follow ERC721 standard.
    // inherit ERC721 contract from OpenZeppelin
    // create a constructor where the ERC721 startd is initialised with name and symbol

    // 3. Have a concept of ownership
    // inherit Ownable contract from OpenZeppelin
    // create a constructor where the contract is initialised with ownership state
    constructor () ERC721("ACCESS", "ACC") {}

    // 1. a owner can mint nft to a particular address condition that the address donot hold any NFT
    // Owner gives an input: receiver address
    // check if the sender is only owner
    // check if the receiver address holds an NFT or not
    // if they hold, revert the execution
    // else, go ahead
    // mint NFT to receiver address
    // emit an event that NFT is minted
    function mint(address _receiver) onlyOwner external {
        // if
        if( balanceOf(_receiver) != 0) {
            revert NON_ZERO_BALANCE();
        }
        unchecked {
            tokenCounter++;
        }
        _safeMint(_receiver, tokenCounter);
    }


}