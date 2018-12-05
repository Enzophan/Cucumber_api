Feature: New CC Update Setting/ Regular Rate
    Everybody wants update to Regular Rate

    Scenario: 01. I get data Setting/ Update Regular Rate
        Given Get token when login Account NewCC from "Lab"
            | user     | password   |
            | tappcar1 | demo@12345 |
        When I send request to api "https://ccliteapis.lab.qup.vn/api/setting/surcharge/create" with request with params based on table below
            | requestBody                                                                                                                                                                                                                                                     |
            | {"fleetId":"tappcar","name":"Auto Test","surchargeByCurrencies":[{"value":"9.99","currencyISO":"CAD"}],"date":["Mon","Tue","Wed","Thu","Fri","Sat","Sun"],"start":"00:00","end":"23:59","timeCal":"1","surcharge":0,"surchargeType":"amount","repeat":"weekly"} |
        Then I should get the return data matches with
            | res                                                                                                                                                                                                                         |
            | [{"date":["Mon","Tue","Wed","Thu","Fri","Sat","Sun"],"surchargeType":"amount","repeat":"weekly","name":"Auto Test","start":"00:00","end":"23:59","timeCal":1,"surchargeByCurrencies":[{"value":9.99,"currencyISO":"CAD"}]}] |


