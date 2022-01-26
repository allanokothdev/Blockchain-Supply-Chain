var SupplyChain = artifacts.require('./SupplyChain.sol');

contract('SupplyChain', async accounts => {
  it("should create a Participants", async () => {
    let instance = await SupplyChain.deployed();
    let participantID = await instance.createParticipants("A", "passA", "0x0D77077FA1922430E835eBA0E474DD3BbFDd93a7", "Manufacturer");
    let participant = await instance.participants(0);
    assert.equal(participant[0], "A");
    assert.equal(participant[2], "Manufacturer");

    participantID = await instance.createParticipants("B", "passB", "0x5E3Cc77c63F2b61cC125C4f4330f349bC98d4E6b", "Supplier");
    participant = await instance.participants(1);
    assert.equal(participant[0], "B");
    assert.equal(participant[2], "Supplier");

    participantID = await instance.createParticipants("C", "passC", "0x2693A584FF273fcDDF24a0b67D3C5676c0c96383", "Consumer");
    participant = await instance.participants(2);
    assert.equal(participant[0], "C");
    assert.equal(participant[2], "Consumer");
  });

  it("should return Participant details", async () => {
    let instance = await SupplyChain.deployed();
    let participantDetails = await instance.getParticipantsDetails(0);
    assert.equal(participantDetails[0], "A");

    instance = await SupplyChain.deployed();
    participantDetails = await instance.getParticipantsDetails(1);
    assert.equal(participantDetails[0], "B");

    instance = await SupplyChain.deployed();
    participantDetails = await instance.getParticipantsDetails(2);
    assert.equal(participantDetails[0], "C");
  })
})
