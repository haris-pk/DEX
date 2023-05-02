// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

contract MyToken1 {
    string public name = "My Token 1";
    string public symbol = "MT1";
    uint256 public totalSupply = 1000;

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