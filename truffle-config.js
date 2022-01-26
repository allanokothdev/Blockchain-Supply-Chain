let secrets = require('./secrets');

const WalletProvider = require("truffle-hdwallet-provider");
const Wallet = require('ethereumjs-wallet');

let mainNetPrivateKey = new Buffer(secrets.mainnetPK, "hex");
let mainNetWallet = Wallet.fromPrivateKey(mainNetPrivateKey);
let mainNetProvider = new WalletProvider(mainNetWallet, "https://mainnet.infura.io/");

let ropstenPrivateKey = new Buffer(secrets.ropstenPK, "hex");
let ropstenWallet = Wallet.fromPrivateKey(ropstenPrivateKey);
let ropstenProvider = new WalletProvider(ropstenWallet, "https://ropsten.infura.io/");

module.exports = {
  networks: {
     development: {
      host: "127.0.0.1",
      port: 7545,
      network_id: "*",
      gas: 4465030
     },

     ropsten: {
      host: ropstenProvider,
      network_id: "3",
      gas: 4465030
     },

     live: {
      host: mainNetProvider,
      network_id: "1",
      gas: 7500000
     }
   }
 }
