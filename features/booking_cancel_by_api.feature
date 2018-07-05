Feature: Cancel Booking from API
Everybody wants to know when it's Friday

    Scenario: 1. Request cancel Booking from API
        Given Get token when login Account 3rd from "local"
        When I request booking from API when custom data
            | requestBody                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 |
            | { "psgInfo": { "phone": "+12063336666", "firstName": "Auto Test", "lastName": "Demo 123", "email": "tester.qup@gmail.com", "creditInfo": { "cardNumber": "5555555555554444", "cardHolder": "Auto", "postalCode": "98789", "expiredDate": "12/2022", "cvv": "123" } }, "request": { "pickup": { "address": "Da Nang Software Park, Thạch Thang, Hải Châu, Đà Nẵng", "geo": [108.222198, 16.075792], "timezone": "Asia/Saigon" }, "destination": { "address": "Vinpearl Luxury Da Nang, Hòa Hải, Ngũ Hành Sơn, Đà Nẵng", "geo": [108.266139, 16.007381], "timezone": "Asia/Saigon" }, "pickUpTime": "Now", "vehicleTypeRequest": "Bike", "type": 0, "paymentType": 2, "note": "Auto test api", "promo": "", "rideSharing": false, "tip": 10.99, "packageRateId": "5b3d8590e4b0edd700de78cf" }, "dispatch3rd": false, "corporateInfo": { "division": "test", "managerEmail": "test@gmail.com", "corpId": "123", "managerName": "", "costCentre": "", "department": "", "corporateId": "5b3d86a2e4b0edd700de78d5", "clientCaseMatter": "", "chargeCode": "" } } |
        And I request cancel booking from API
        Then Booking cancelled successful
        And I should not have "Booking" document in database with below info



