Feature: New CC Update Setting/ Regular Rate
    Everybody wants update to Regular Rate

    Scenario: 01. I get data Setting/ Update Flat Rate
        Given Get token when login Account NewCC from "Lab"
            | user     | password   |
            | tappcar1 | demo@12345 |
        When I send request to api "https://ccliteapis.lab.qup.vn/api/rate/flat/edit" with request with params based on table below
            | requestBody                                                                                                                                                                                                                                                                                                                                                                                                           |
            | {"_id":"58b62ff6e4b06399f6ff7d6f","name":"Đà Nẵng","fleetId":"tappcar","noShow":{"valueByCurrencies":[{"value":"456","currencyISO":"CAD"}],"isActive":false},"cancellationPolicy":{"isActive":true,"onDemand":{"valueByCurrencies":[{"value":"123","currencyISO":"CAD"}],"isActive":true},"inAdvance":{"valueByCurrencies":[{"value":"234","currencyISO":"CAD"}],"isActive":true}},"isActive":true,"isDefault":false} |
        Then I should get the return data matches with
            | res                                                                                       |
            | {"_id":"58b62ff6e4b06399f6ff7d6f","fleetId":"tappcar", "name":"Đà Nẵng", "isActive":true} |


    Scenario: 02. I get data Setting/ Update Routes
        Given Get token when login Account NewCC from "Lab"
            | user     | password   |
            | tappcar1 | demo@12345 |
        When I send request to api "https://ccliteapis.lab.qup.vn/api/rate/flat/edit" with request with params based on table below
            | requestBody                                                                                                                                                                                                                                                                                                                                                                                                           |
            | {"_id":"58b62ff6e4b06399f6ff7d6f","name":"Đà Nẵng","fleetId":"tappcar","noShow":{"valueByCurrencies":[{"value":"456","currencyISO":"CAD"}],"isActive":false},"cancellationPolicy":{"isActive":true,"onDemand":{"valueByCurrencies":[{"value":"123","currencyISO":"CAD"}],"isActive":true},"inAdvance":{"valueByCurrencies":[{"value":"234","currencyISO":"CAD"}],"isActive":true}},"isActive":true,"isDefault":false} |
        Then I should get the return data matches with
            | res                                                                                       |
            | {"_id":"58b62ff6e4b06399f6ff7d6f","fleetId":"tappcar", "name":"Đà Nẵng", "isActive":true} |
