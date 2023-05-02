// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

contract MyToken2 {
    string public name = "My Token 2";
    string public symbol = "MT2";
    uint256 public totalSupply = 2000;

    mapping(address => uint256) balances;

    constructor() {
        balances[msg.sender] = totalSupply;
    }

    function transfer(address to, uint256 amount) external returns (bool) {
        require(balances[msg.sender] >= amount, "Not enough tokens");
        balances[msg.sender] -= amount;
        balances[to] += amount;
        return true;
    }

    function balanceOf(address account) external view returns (uint256) {
        return balances[account];
    }
}