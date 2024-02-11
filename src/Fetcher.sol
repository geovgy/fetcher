// SPDX-License-Identifier: MIT
pragma solidity ^0.8.23;

import "@openzeppelin/contracts/token/ERC20/IERC20.sol";

contract Fetcher {
    struct Token {
        address token;
        uint256 balance;
    }

    struct Balances {
        address account;
        Token[] tokens;
    }

    // Returns an array of the native balance of each address
    function balancesOf(address[] calldata _addresses) external view returns (uint256[] memory) {
        uint256[] memory balances = new uint256[](_addresses.length);
        for (uint256 i = 0; i < _addresses.length; i++) {
            balances[i] = _addresses[i].balance;
        }
        return balances;
    }

    // Returns an array of the balance of each ERC20 token for each address
    // function tokenBalancesOf(address[] calldata _addresses, address[] calldata _tokens) external view returns (Balances[] memory) {
    //     Balances[] memory result = new Balances[](_addresses.length);
    //     Token[] memory tokens = new Token[](_tokens.length);
    //     for (uint256 i; i < _addresses.length; i++) {
    //         for (uint256 j; j < _tokens.length; j++) {
    //             tokens[j] = Token(
    //                 _tokens[j], 
    //                 IERC20(_tokens[j]).balanceOf(_addresses[i])
    //             );
    //         }
    //         result[i] = Balances(_addresses[i], tokens);
    //     }
    //     return result;
    // }
}
