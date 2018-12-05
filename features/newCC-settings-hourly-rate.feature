Feature: New CC Update Setting/ Regular Rate
    Everybody wants update to Regular Rate

    Scenario: 01. I get data Setting/ Update Hourly Rate
        Given Get token when login Account NewCC from "Lab"
            | user     | password   |
            | tappcar1 | demo@12345 |
        When I send request to api "https://ccliteapis.lab.qup.vn/api/rate/hourly/edit" with request with params based on table below
            | requestBody                                                                                                                                                                                                                                                                                                                                                                                     |
            | {"_id":"58f81460e4b0e611751d03eb","name":"Premium","fleetId":"tappcar","noShow":{"valueByCurrencies":[{"currencyISO":"CAD","value":333}],"isActive":false},"cancellationPolicy":{"isActive":true,"onDemand":{"valueByCurrencies":[{"currencyISO":"CAD","value":"555"}],"isActive":true},"inAdvance":{"valueByCurrencies":[{"currencyISO":"CAD","value":666}],"isActive":true}},"isActive":true} |
        Then I should get the return data matches with
            | res                                                                                      |
            | {"_id":"58f81460e4b0e611751d03eb","fleetId":"tappcar","name":"Premium", "isActive":true} |


    Scenario: 02. I get data Setting/ Update Package Hourly Rate
        Given Get token when login Account NewCC from "Lab"
            | user     | password   |
            | tappcar1 | demo@12345 |
        When I send request to api "https://ccliteapis.lab.qup.vn/api/packagerate/edit" with request with params based on table below
            | requestBody                                                                                                                                                                                                                                                                      |
            | {"_id":"58f81478e4b0e611751d03ef","fleetId":"tappcar","fareHourlyId":"58f81460e4b0e611751d03eb","name":"Premium: 1 Hour","duration":1,"type":"hour","coveredDistance":"9999","feesByCurrencies":[{"currencyISO":"CAD","basedFee":"100","extraDuration":80,"extraDistance":"8"}]} |
        Then I should get the return data matches with
            | res                                                                                                                                                       |
            | {"_id":"58f81478e4b0e611751d03ef","fareHourlyId":"58f81460e4b0e611751d03eb","fleetId":"tappcar","name":"Premium: 1 Hour", "type":"hour", "isActive":true} |
