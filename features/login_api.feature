Feature: Is it Friday yet?
Everybody wants to know when it's Friday

# Scenario: Sunday isn't Friday
#     Given today is Sunday
#     When I ask whether it's Friday yet
    #     Then I should be told "Nope"

    Scenario: Login api
        Given Get token when login account 3rd
        When I request booking from API
        Then I should be told "Nope"