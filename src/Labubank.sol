// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

import {ERC721Enumerable, ERC721} from "@openzeppelin/contracts/token/ERC721/extensions/ERC721Enumerable.sol";

contract Labubank is ERC721Enumerable{
  
  uint public count;

  mapping(uint256 => string) public myLabubuName; 
  address public manufacturer;

  error Labubank__MustBeOwner(); 
  error Labubank__Unauthorized();

  constructor(address _manufacturer) ERC721("LabuBANK", "LABUBANK"){
    manufacturer = _manufacturer;
  }

  modifier onlyManufacturer() {
    if(msg.sender == manufacturer){
      _;
    }else{
      revert Labubank__Unauthorized();
    }
  }

  function newLabubu(address _walletAddress) external onlyManufacturer{
    unchecked {
      _mint(_walletAddress, ++count);
    }
  }

  function setMyLabubuName(uint256 _tokenId, string memory _newName) external {
    if(ownerOf(_tokenId) != msg.sender){
      revert Labubank__MustBeOwner();
    }

    myLabubuName[_tokenId] = _newName;
  }

}
