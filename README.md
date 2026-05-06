# ERC20 Token Implementation

A production-oriented ERC20 token implementation built from scratch in Solidity, designed to provide deep insight into the ERC20 standard internals. This project serves as an educational reference for blockchain engineers seeking to understand the low-level mechanics of token contracts.

## Project Overview

This repository contains a complete, standards-compliant ERC20 token implementation written in Solidity. The focus is on clarity, security, and educational value, implementing the ERC20 interface without relying on external libraries beyond Foundry's testing framework. The implementation emphasizes understanding of token state management, transfer logic, and approval mechanisms at the bytecode level.

## Architecture Overview

The token contract follows a modular architecture centered around the ERC20 standard:

- **State Variables**: Tracks total supply, balances, and allowances
- **Core Functions**: Implements transfer, approve, and transferFrom operations
- **Events**: Emits Transfer and Approval events for transparency
- **Security Guards**: Includes reentrancy protection and overflow checks

The design prioritizes gas efficiency while maintaining full compliance with ERC20 specifications.

## Features

- Full ERC20 standard compliance
- Optimized gas usage for common operations
- Comprehensive test coverage
- Foundry-based testing and deployment
- Educational code comments explaining ERC20 mechanics

## ERC20 Functions Implemented

### Core Functions
- `totalSupply()`: Returns the total token supply
- `balanceOf(address account)`: Returns the balance of a specific account
- `transfer(address recipient, uint256 amount)`: Transfers tokens to a recipient
- `allowance(address owner, address spender)`: Returns the remaining allowance for a spender
- `approve(address spender, uint256 amount)`: Approves a spender to transfer tokens
- `transferFrom(address sender, address recipient, uint256 amount)`: Transfers tokens on behalf of another address

### Events
- `Transfer(address indexed from, address indexed to, uint256 value)`
- `Approval(address indexed owner, address indexed spender, uint256 value)`

## Testing Strategy with Foundry

The project employs a comprehensive testing approach using Foundry's Forge testing framework:

- **Unit Tests**: Individual function testing with edge cases
- **Integration Tests**: Multi-step operations and state transitions
- **Fuzz Tests**: Property-based testing for mathematical correctness
- **Invariant Tests**: State consistency checks across operations
- **Gas Optimization**: Snapshot testing for performance monitoring

Tests cover:
- Normal transfer scenarios
- Approval and transferFrom flows
- Edge cases (zero transfers, self-transfers)
- Overflow protection
- Reentrancy resistance

## Security Considerations

- **Overflow Protection**: Uses Solidity 0.8+ built-in overflow checks
- **Reentrancy Guards**: Implements checks-effects-interactions pattern
- **Access Control**: Proper validation of inputs and permissions
- **Event Logging**: Comprehensive event emission for transparency
- **Gas Limits**: Optimized operations to prevent out-of-gas errors

## Project Structure

```
├── src/
│   └── ERC20Token.sol          # Main token contract
├── test/
│   └── ERC20Token.t.sol        # Comprehensive test suite
├── script/
│   └── Deploy.s.sol            # Deployment script
├── lib/
│   └── forge-std/              # Foundry standard library
├── foundry.toml                # Foundry configuration
└── README.md                   # This file
```

## Installation and Usage

### Prerequisites
- Foundry toolkit installed
- Solidity ^0.8.0

### Setup
```bash
# Clone the repository
git clone <repository-url>
cd erc20-tkn

# Install dependencies
forge install
```

### Build
```bash
forge build
```

### Test
```bash
forge test
```

### Deploy
```bash
# Set your private key
export PRIVATE_KEY=your_private_key

# Deploy to a network
forge script script/Deploy.s.sol --rpc-url <rpc-url> --broadcast
```

### Interact
```bash
# Check total supply
cast call <contract-address> "totalSupply()" --rpc-url <rpc-url>

# Transfer tokens
cast send <contract-address> "transfer(address,uint256)" <recipient> <amount> --rpc-url <rpc-url> --private-key $PRIVATE_KEY
```

## Future Improvements

- **Upgradeability**: Implement proxy patterns for contract upgrades
- **Batch Operations**: Add multi-transfer functionality for gas efficiency
- **Permit Extension**: Support for gasless approvals via EIP-2612
- **Flash Minting**: Implement flash loan capabilities
- **Governance Integration**: Add voting mechanisms for token holders
- **Cross-Chain**: Explore bridge compatibility

## Contributing

Contributions are welcome. Please ensure all tests pass and follow the established code style. For significant changes, open an issue first to discuss the proposed modifications.

## License

This project is licensed under the MIT License.
$ forge script script/Counter.s.sol:CounterScript --rpc-url <your_rpc_url> --private-key <your_private_key>
```

### Cast

```shell
$ cast <subcommand>
```

### Help

```shell
$ forge --help
$ anvil --help
$ cast --help
```
