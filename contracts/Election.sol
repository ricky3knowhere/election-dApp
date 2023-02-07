// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;

contract Election {
    // Candidate's Model
    struct Candidate {
        uint256 id;
        string name;
        uint256 voteCount;
    }

    // Store Candidate
    // Fetch Candidate
    mapping(uint256 => Candidate) public candidates;

    // Store Candidate count
    uint256 public candidatesCount;

    constructor() public {
        addCandidate("Candidate 1");
        addCandidate("Candidate 2");
    }

    function addCandidate(string memory _name) private {
        candidatesCount++;
        candidates[candidatesCount] = Candidate(candidatesCount, _name, 0);
    }
}
