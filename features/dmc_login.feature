Feature: DMC Login
    Everybody wants to know when customer is personal

    Scenario: 1. Login DMC
        Given Get token when login Account DMC from "local"
        Then I should get the return data matches with
            | res                                                                                                      |
            | {"user":{"_id": "5b87726fe4b0d3a1345f4781", "userName": "dmcl","roles":{"fleetId":{"fleetId": "dmcl"}}}} |
