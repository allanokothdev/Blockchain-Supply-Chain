const ERC20Token = artifacts.require("ERC20Token");
const SupplyChain = artifacts.require("SupplyChain");

module.exports = function (deployer) {
  deployer.deploy(ERC20Token, 10000, "Supply Chain Token", 18, "SCT");
  deployer.deploy(SupplyChain);
};
