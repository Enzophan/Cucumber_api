Feature: Cancel Booking from API
    Everybody wants to know when it's Friday

    Scenario: 1. Request cancel Booking from API
        Given Get token when login Account 3rd from "local"
        When Find booking from "Booking" have phone number and request cancel that booking
            | req                                                                                        |
            | {"fleetId":"hoanglocal" ,"psgInfo.phone": "+12063336666", "request.note": "Auto test api"} |
        And I request cancel books from API
        Then Booking cancelled successful
        # And I should not have "Booking" document in database with below info



# Scenario: 1. Request Booking by API
#     Given Get token when login account 3rd
#     When I request booking from API
#     Then Booking create successful
#     And I should have "Booking" document in database with "1" Booking ID