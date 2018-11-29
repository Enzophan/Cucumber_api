Feature: Booking Details report from API
    I want get booking details report by agent

    Scenario: 1. Request get Booking Details report from API
        Given I login with server "http://192.168.2.85:1337/oauth/token", user and password of Account third party based in table
            | grant_type | username  | password   | client_id  | client_secret |
            | password   | auto_test | demo@12345 | hoanglocal | 222999888     |

        When I request data from API "http://192.168.2.85:1337/api/v2/agent/report/list_booking", with the criteria that described below
            | requestBody                                                                                                                                                                                                                  |
            | {"from": 0, "size":10, "timezone":"Asia/Hochiminh", "fromDate":"2018-11-23T00:00:00.000Z", "toDate": "2018-11-23T23:59:59.000Z", "driverPhone":"", "passengerPhone": "", "bookingId":"", "corporateId":"", "currency":"VND"} |
        Then there are total "99" item effected, data array has "10" item
        Then the return data matches with expected result
            | res                                                      |
            | {"from":0,"size":10,"total":99, "summary": {"size": 99}} |




