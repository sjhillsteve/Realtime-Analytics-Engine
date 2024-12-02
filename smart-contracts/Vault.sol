// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

import "@openzeppelin/contracts/security/ReentrancyGuard.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/token/ERC20/IERC20.sol";

contract EnterpriseYieldVault is ReentrancyGuard, Ownable {
    IERC20 public immutable stakingToken;
    mapping(address => uint256) public userBalances;
    uint256 public totalStaked;

    event Deposited(address indexed user, uint256 amount);
    event Withdrawn(address indexed user, uint256 amount);

    constructor(address _token) {
        stakingToken = IERC20(_token);
    }

    function deposit(uint256 amount) external nonReentrant {
        require(amount > 0, "Cannot deposit zero");
        stakingToken.transferFrom(msg.sender, address(this), amount);
        userBalances[msg.sender] += amount;
        totalStaked += amount;
        emit Deposited(msg.sender, amount);
    }

    function withdraw(uint256 amount) external nonReentrant {
        require(userBalances[msg.sender] >= amount, "Insufficient balance");
        userBalances[msg.sender] -= amount;
        totalStaked -= amount;
        stakingToken.transfer(msg.sender, amount);
        emit Withdrawn(msg.sender, amount);
    }
}

// Hash 8267
// Hash 3059
// Hash 7876
// Hash 2386
// Hash 3905
// Hash 4946
// Hash 8837
// Hash 9902
// Hash 2779
// Hash 6322
// Hash 8560
// Hash 7088
// Hash 4173
// Hash 3654
// Hash 2472
// Hash 8377
// Hash 1270
// Hash 1925
// Hash 4128
// Hash 3783
// Hash 2845
// Hash 2158
// Hash 8971
// Hash 7631
// Hash 8129
// Hash 7291
// Hash 4319
// Hash 5301
// Hash 4546
// Hash 6496
// Hash 5148
// Hash 8361
// Hash 5949
// Hash 2400
// Hash 2134
// Hash 3388
// Hash 7618
// Hash 5792
// Hash 4959
// Hash 2046
// Hash 2126
// Hash 3285
// Hash 4366
// Hash 7320
// Hash 2460
// Hash 2497
// Hash 8583
// Hash 3378
// Hash 9777
// Hash 1783
// Hash 6294
// Hash 2985
// Hash 2031
// Hash 6553
// Hash 8928
// Hash 8729
// Hash 4807
// Hash 8767
// Hash 9309
// Hash 3843
// Hash 5717
// Hash 6134
// Hash 6934
// Hash 3767
// Hash 9965
// Hash 9089
// Hash 4339