const { buildModule } = require("@nomicfoundation/hardhat-ignition/modules");
module.exports = buildModule("TelephoneCall1Module", (m) => {
    const TelephoneCall1 = m.contract("TelephoneCall1", []);
    return { TelephoneCall1 };
});