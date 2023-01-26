// SPDX-License-Identifier: MIT
pragma solidity ^0.8.12;

contract lottery{

    //배열
    mapping (address => uint256[]) user;
    uint256[] winning_number;

    function lottery_in(uint256 number1, uint256 number2, uint256 number3) public {
        user[msg.sender] = [number1, number2, number3];
    }
    //user[msg.sender] = [2, 3, 4]

    function lottery_set(uint256 number1, uint256 number2, uint256 number3) public {
        winning_number[number1] = 1;
        winning_number[number2] = 1;
        winning_number[number3] = 1;
    }

    //winning_number = [0, 1, 1, 1, 0, 0, 0, ...]
    function claim() public view returns(uint256){
        uint256 total_point = 3;

        if(winning_number[user[msg.sender][0]] == 1){
            total_point = total_point - 1;
        }
        if(winning_number[user[msg.sender][1]] == 1){
            total_point = total_point - 1;
        }
        if(winning_number[user[msg.sender][2]] == 1){
            total_point = total_point - 1;
        }
        return total_point;
    }
}
