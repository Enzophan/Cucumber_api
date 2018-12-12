Feature: New CC Update Setting/ Regular Rate
    Everybody wants update to Regular Rate

    Scenario: 01. I get data Setting/ Update Regular Rate
        Given Get token when login Account NewCC from "Lab"
            | user     | password   |
            | tappcar1 | demo@12345 |
        When I send request to api "https://ccliteapis.lab.qup.vn/api/rate/regular/edit" with request with params based on table below
            | requestBody                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                       |
            | { "_id": "580ee47ce4b0da4da78e02ed", "fleetId": "tappcar", "name": "Regular Rate", "firstDistanceFrom": 1, "firstDistanceTo": 5, "secondDistanceFrom": 5, "secondDistanceTo": 10, "feesByCurrencies": [ { "currencyISO": "CAD", "feeAfterSecondDistance": 8, "feeFirstDistance": 15, "feePerMinute": 0.3, "feeSecondDistance": 10, "minNow": 20, "minReservation": 25, "startingNow": 15, "startingReservation": 20 } ], "noShow": { "valueByCurrencies": [ { "value": 40, "currencyISO": "CAD" } ], "isActive": false }, "cancellationPolicy": { "isActive": true, "onDemand": { "valueByCurrencies": [ { "value": 20, "currencyISO": "CAD" } ], "isActive": true }, "inAdvance": { "valueByCurrencies": [ { "value": 30, "currencyISO": "CAD" } ], "isActive": true } }, "isDefault": false, "isActive": true } |
        Then I should get the return data matches with
            | res                                                                                            |
            | {"_id":"580ee47ce4b0da4da78e02ed","fleetId":"tappcar", "name":"Regular Rate", "isActive":true} |


    Scenario: 02. I get data Setting/ Add New Regular Rate
        Given Get token when login Account NewCC from "Lab"
            | user     | password   |
            | tappcar1 | demo@12345 |
        When I send request to api "https://ccliteapis.lab.qup.vn/api/rate/regular/add" with request with params based on table below
            | requestBody                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                       |
            | {"fleetId":"tappcar","name":"Auto Rate for SUV","firstDistanceFrom":"1","firstDistanceTo":5,"secondDistanceFrom":5,"secondDistanceTo":11,"feeTimeOver":0.5,"isDefault":false,"timeOver":0,"feesByCurrencies":[{"currencyISO":"CAD","feeAfterSecondDistance":9.9,"feeFirstDistance":15,"feePerMinute":0.5,"feeSecondDistance":12,"minNow":30,"minReservation":100,"startingNow":19,"startingReservation":25}],"isActive":true,"noShow":{"isActive":false,"valueByCurrencies":[{"value":"70","currencyISO":"CAD"}]},"cancellationPolicy":{"inAdvance":{"isActive":true,"valueByCurrencies":[{"value":"60","currencyISO":"CAD"}]},"onDemand":{"isActive":true,"valueByCurrencies":[{"value":"50","currencyISO":"CAD"}]}},"vehicleTypeId":"59c479b1e4b0518be685704e"} |
        Then I should get the return data matches with
            | res                                                                |
            | {"fleetId":"tappcar", "name":"Auto Rate for SUV", "isActive":true} |

