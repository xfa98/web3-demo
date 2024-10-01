
const StudentListStorage = artifacts.require('StudentListStorage')

module.exports = async function(callabck){
    const studentListStorage = await StudentListStorage.deployed()

    await studentListStorage.addList("kerwin",1000)
    console.log(await studentListStorage.getList())
    console.log(await studentListStorage.studentList(2))

    callabck() //必须写，否则不结束
 }
 