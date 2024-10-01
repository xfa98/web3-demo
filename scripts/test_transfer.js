
const JackToken = artifacts.require("JackToken.sol")

const fromWei = (bn)=>{
    return web3.utils.fromWei(bn, "ether");
}

const toWei = (number)=>{
    return web3.utils.toWei(number.toString(), "ether");
}

module.exports = async function (callback) {
    const jackToken = await JackToken.deployed();
    let res1 = await jackToken.balanceOf("0xEe9F45AB8264E0A65dee00d57BE73389ccb0534b");
    // let res1 = await jackToken.balanceOf();
    console.log("第一个账号的余额是: ", fromWei(res1))

    await jackToken.transfer("0x45ccda7DEd45d7996058aDE57731Ad2C5d1DBCb2", toWei(10000));
    let res2 = await jackToken.balanceOf("0xEe9F45AB8264E0A65dee00d57BE73389ccb0534b");
    // let res1 = await jackToken.balanceOf();
    console.log("第一个账号的余额是: ", fromWei(res2))

    let res3 = await jackToken.balanceOf("0x45ccda7DEd45d7996058aDE57731Ad2C5d1DBCb2");
    console.log("第二个账号的余额是: ", fromWei(res3))


    callback()
}