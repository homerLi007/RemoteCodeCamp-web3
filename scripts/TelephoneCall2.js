const { buildModule } = require("@nomicfoundation/hardhat-ignition/modules");
module.exports = buildModule("TelephoneCall2Module", (m) => {
    const TelephoneCall2 = m.contract("TelephoneCall2", []);
    return { TelephoneCall2 };
});