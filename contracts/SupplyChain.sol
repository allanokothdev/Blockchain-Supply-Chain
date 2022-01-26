pragma solidity ^0.5.0;

contract SupplyChain {

  uint32 public p_id = 0;   // Product ID
  uint32 public u_id = 0;   // Participant ID
  uint32 public r_id = 0;   // Registration ID

  struct Product {
    string modelNumber;
    string partNumber;
    string serialNumber;
    address productOnwer;
    uint32 cost;
    uint32 mfgTimeStamp;
  }

    mapping (uint32 => Product) public products;

    struct Participant {
      string userName;
      string password;
      string participantType;
      address participantAddress;
    }

    mapping (uint32 => Participant) public participants;

    struct Registration {
      uint32 productId;
      uint32 ownerId;
      uint32 trxTimeStamp;
      address productOwner;
    }

    mapping (uint32 => Registration) public registrations;

    event Transfer(uint32 productId);

    mapping (uint32 => uint32[]) public productTrack;

    modifier onlyOwner(uint32 _productId) {
      require(msg.sender == products[_productId].productOnwer );
      _;
    }

    //function getRegistrationDetails returns the attributes of the specified registration
    function getRegistrationDetails(uint32 _regId) public view returns (uint32, uint32, address, uint32) {
      Registration memory registration = registrations[_regId];
      return (registration.productId, registration.ownerId, registration.productOwner, registration.trxTimeStamp);
    }

    //Function getProductTrack returns the registration history for a specified product
    function getProductTrack(uint32 _prodId) external view returns (uint32[] memory) {
      return productTrack[_prodId];
    }

    //Transfer to Owner function records movement along the Supply Chain. This function transfers ownership of a specified product from one supply chain participant to naother
    function transferToOwner(uint32 _user2Id, uint32 _prodId) onlyOwner(_prodId)public returns (bool) {
      //Participant memory part1 = participants[_user1Id];
      Participant memory part2 = participants[_user2Id];
      uint32 registration_id = r_id++;
      registrations[registration_id] = Registration(_prodId, _user2Id, uint32(now),part2.participantAddress);

      products[_prodId].productOnwer = part2.participantAddress;
      productTrack[_prodId].push(registration_id);
      emit Transfer(_prodId);

      return (true);
    }


    //createParticipant Function increments participantID, creates a new participant and sets its attributes to the passed in parameters
    function createParticipants(string memory _name, string memory _pass, address _pAdd, string memory _pType) public returns (uint32) {
      uint32 userId = u_id++;
      participants[userId] = Participant(_name, _pass, _pType, _pAdd);
      return userId;
    }

    //Function getParticipantsDetails function returns the attributes of the specified participant
    function getParticipantsDetails(uint32 _p_id) public view returns (string memory, address, string memory) {
      return (participants[_p_id].userName, participants[_p_id].participantAddress, participants[_p_id].participantType);
    }


    //Function createProduct increments the Product ID, creates a new product and sets its attributes to the passed in _value
    function createProduct(uint32 _ownerId, string memory _modelNumber, string memory _partNumber, string memory _serialNumber, uint32 _productCost) public returns (uint32) {
      //In Solidity, you Cannot directly comare strings || you have to 1st calculate a hash value of the string and them compare that number ot the hash value of another strong & keccak256 function to calculate hashes
      if(keccak256(abi.encodePacked(participants[_ownerId].participantType)) == keccak256("Manufacturer")) {
        uint32 productId = p_id++;
        products[productId] = Product(_modelNumber, _partNumber, _serialNumber, participants[_ownerId].participantAddress, _productCost, uint32(now));
        return productId;
      }
      return 0;
    }

    //Function getProductDetails returns the attributes of the specified product
    function getProductDetails(uint32 _productId) public view returns (string memory , string memory, string memory, uint32, address , uint32) {
      return (products[_productId].modelNumber, products[_productId].partNumber, products[_productId].serialNumber, products[_productId].cost, products[_productId].productOnwer, products[_productId].mfgTimeStamp);
    }





}
