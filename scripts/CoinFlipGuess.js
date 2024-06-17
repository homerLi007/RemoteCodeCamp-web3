const { buildModule } = require("@nomicfoundation/hardhat-ignition/modules");
module.exports = buildModule("CoinFlipGuessModule", (m) => {
    const coinFlipGuess = m.contract("CoinFlipGuess", []);
    return { coinFlipGuess };
});