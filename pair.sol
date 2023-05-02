// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

import './IUniswapV2Router02.sol';
import './IUniswapV2Pair.sol';
import './IUniswapV2Factory.sol';
import "./IERC20.sol";



contract MyPool {
    address public token1;
    address public token2;
    address public uniswapV2Router;
    address public uniswapV2Pair;
    
    constructor(address _token1, address _token2, address _uniswapV2Router) {
        token1 = _token1;
        token2 = _token2;
        uniswapV2Router = _uniswapV2Router;
        
        IUniswapV2Factory uniswapV2Factory = IUniswapV2Factory(IUniswapV2Router02(uniswapV2Router).factory());
        uniswapV2Pair = uniswapV2Factory.createPair(token1, token2);
        
    }
    
    function addLiquidity(uint256 amount1, uint256 amount2) external {
        IERC20(token1).transferFrom(msg.sender, address(this),amount1);
        IERC20(token2).transferFrom(msg.sender, address(this),amount2);
        IERC20(token1).approve(uniswapV2Router,amount1);
        IERC20(token2).approve(uniswapV2Router,amount2);

        IUniswapV2Router02(uniswapV2Router).addLiquidity(
            token1,
            token2,
            amount1,
            amount2,
            0,
            0,
            msg.sender,
            block.timestamp
        );
    }
}