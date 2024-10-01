// SPDX-License-Identifier: GPL-3.0 
// 源码遵循协议， MIT...
pragma solidity >=0.4.16 <0.9.0; //限定solidity编译器版本

contract StudentListStorage {

    struct Student {
        uint id;
        uint age; //状态变量是数据存储在链上的变量，所有合约内函数都可以访问 ，gas消耗高。状态变量在合约内、函数外声明。可以在函数里更改状态变量的值
        string name; //公共状态变量与内部状态变量的不同之处在于，编译器会自动为它们生成 getter 函数，
        address account;
    }

    Student[] public studentList;

    
    function addList(string memory _name,uint _age) public returns (uint) {
        uint count = studentList.length;
        uint index = count + 1;
        studentList.push(Student(index, _age, _name, msg.sender));
        return studentList.length;
    }

    //一类是 view 函数（也称为视图函数），另一类是 pure 函数（也称为纯函数）。他们的区别是 view 函数不修改状态，pure 函数即不修改状态也不读取状态。
    function getList() public view returns (Student[] memory) {
        return studentList;
    }
} 