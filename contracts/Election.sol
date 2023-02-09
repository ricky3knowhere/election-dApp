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
    // Store accounts that have voted
    mapping(address => bool) public voters;
    // Store Candidate count
    uint256 public candidatesCount;

    // voted event
    event votedEvent(uint256 indexed_candidateId);

    constructor() public {
        addCandidate("Candidate 1");
        addCandidate("Candidate 2");
    }

    function addCandidate(string memory _name) private {
        candidatesCount++;
        candidates[candidatesCount] = Candidate(candidatesCount, _name, 0);
    }

    // User voting
    function vote(uint256 _candidateId) public {
        // require that voter hasn't voted before
        require(!voters[msg.sender]);

        // require a valid candidate id
        require(_candidateId > 0 && _candidateId <= candidatesCount);

        // record that voter has voted
        voters[msg.sender] = true;

        //  upadate candidate vote count
        candidates[_candidateId].voteCount++;

        // trigger voted event
        emit votedEvent(_candidateId);
    }
}
