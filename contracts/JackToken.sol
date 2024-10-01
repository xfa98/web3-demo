// SPDX-License-Identifier: GPL-3.0 
// 源码遵循协议， MIT...
pragma solidity >=0.4.16 <0.9.0; //限定solidity编译器版本
// import "@openzeppelin/contracts/utils/math/Math.sol";
import "openzeppelin-solidity/contracts/math/SafeMath.sol";
contract JackToken {
    using SafeMath for uint256; //为了uint256后面使用 sub ,add方法，，，

    // 自动生成getter方法
    string public name = "FToken";
    string public symbol = "FTH";
    
    uint256 public decimals = 18; // 1FToken = 10**decimals
    uint256 public totalSupply;

    mapping (address => uint256) public balanceOf;
    mapping (address => mapping(address => uint256)) public allowance;

    constructor(){
        totalSupply = 1000000 * (10 ** decimals);
        balanceOf[msg.sender] = totalSupply;
    }

    event Transfer(address indexed _from, address indexed _to, uint256 _value);

    event Approval(address indexed _owner, address indexed _spender, uint256 _value);

    function transfer(address _to, uint256 _value) public returns (bool success) {
        require(_to != address(0));
        _transfer(msg.sender, _to, _value);
        return true; 
    }

    function _transfer(address _from, address _to, uint256 _value) internal {
        require(balanceOf[_from] >= _value);
        balanceOf[_from] = balanceOf[_from].sub(_value);
        balanceOf[_to] = balanceOf[_to].add(_value);
        // 触发事件
        emit Transfer(_from, _to, _value);
    }

    function approve(address _spender, uint256 _value) public returns (bool success) {
        require(_spender != address(0));
        // mgs.sender 当前网页登录的账号
        // _spender 第三方交易所的账号地址
        // _value授权的钱数
        allowance[msg.sender][_spender] = _value;
        emit Approval(msg.sender, _spender, _value);
        return true;
    }

    // 被授权的交易所调用
    function transferFrom(address _from, address _to, uint256 _value) public returns (bool success) {
        //_from 放款账号
        //_to  收款账号
        // mgs.sender 交易所的账户地址

        require(balanceOf[_from] >= _value);
        require(allowance[_from][msg.sender] >= _value);

        allowance[_from][msg.sender] = allowance[_from][msg.sender].sub(_value);
        _transfer(_from, _to, _value);

        return true;
    }


}
