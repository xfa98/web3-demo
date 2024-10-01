
//"artifacts.require()"方法告诉truffle我们将要与那个合约交互，导入某个合约
const Contacts = artifacts.require("JackToken.sol");  
const Exchange = artifacts.require("Exchange.sol"); 

module.exports = async function (deployer) {

    const accounts = await web3.eth.getAccounts()

    await deployer.deploy(Contacts);  //部署这个合约  
    // 如果还有其他合约的话后面可以继续编写
    // deployer.deploy(合约文件)
    await deployer.deploy(Exchange, accounts[2], 10);
};