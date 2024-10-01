
const StudentStorage = artifacts.require('StudentStorage')

module.exports = async function(callabck){
    const studentStorage = await StudentStorage.deployed()

    await studentStorage.setData("kerwin",100)
    console.log(await studentStorage.getData())
    console.log(await studentStorage.name())
    console.log(await studentStorage.age())
    callabck() //必须写，否则不结束
 }
 