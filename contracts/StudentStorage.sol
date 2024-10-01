// SPDX-License-Identifier: GPL-3.0 
// 源码遵循协议， MIT...
pragma solidity >=0.4.16 <0.9.0; //限定solidity编译器版本

contract StudentStorage {
    uint public age; //状态变量是数据存储在链上的变量，所有合约内函数都可以访问 ，gas消耗高。状态变量在合约内、函数外声明。可以在函数里更改状态变量的值
    string public name; //公共状态变量与内部状态变量的不同之处在于，编译器会自动为它们生成 getter 函数，

    function setData(string memory _name,uint _age) public {
        name = _name;
        age= _age;
    }

    //一类是 view 函数（也称为视图函数），另一类是 pure 函数（也称为纯函数）。他们的区别是 view 函数不修改状态，pure 函数即不修改状态也不读取状态。
    function getData() public view returns (string memory,uint) {
        return (name,age);
    }//在Solidity中一个函数方法是可以返回多个结果的
} 