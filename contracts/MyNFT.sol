// SPDX-License-Identifier: MIT
pragma solidity >=0.5.0 <0.9.0;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/utils/Counters.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";

contract CustomNFT is ERC721URIStorage, Ownable {
    using Counters for Counters.Counter;
    Counters.Counter private _tokenIdCounter;

    constructor() ERC721("WonderfulCollectible", "WCLT") {
        // Constructor to set the token name and symbol during deployment
    }

    function createCollectible(address collector, string memory tokenMetadataURI)
        public
        onlyOwner
        returns (uint256)
    {
        _tokenIdCounter.increment();

        uint256 newTokenId = _tokenIdCounter.current();
        _mint(collector, newTokenId);  // Mint a new NFT with a unique ID
        _setTokenURI(newTokenId, tokenMetadataURI);  // Set metadata URI for the NFT
        return newTokenId;
    }
}

