var Election = artifacts.require("./Election.sol");
contract("Election", (accounts) => {
  let electionInstance;

  it("initialize with two candidates", () =>
    Election.deployed()
      .then((instance) => instance.candidatesCount())
      .then((count) => assert.equal(count, 2)));

  it("Candidates initialization validating", () =>
    Election.deployed()
      .then((instance) => {
        electionInstance = instance;
        return electionInstance.candidates(1);
      })
      .then((candidate) => {
        assert.equal(candidate[0], 1, "contains the correct id");
        assert.equal(candidate[1], "Candidate 1", "contains the correct name");
        assert.equal(candidate[2], 0, "contains the correct vote count");
        return electionInstance.candidates(2);
      })
      .then((candidate) => {
        assert.equal(candidate[0], 2, "contains the correct id");
        assert.equal(candidate[1], "Candidate 2", "contains the correct name");
        assert.equal(candidate[2], 0, "contains the correct vote count");
      }));
});
