// var assert = require('assert');
var assert = require('chai').assert;
var { Given, When, Then } = require('cucumber');
var Promise = require('bluebird');
var _ = require('lodash');
var request = require('request-promise')

// setDefaultTimeout(6000000);

function isItFriday(today) {

    return 'Nope';
    // We'll leave the implementation blank for now
}

var options = {
    method: 'POST',
    uri: 'https://dispatch.beta.qup.vn/oauth/token',
    body: {
        "grant_type": "password",
        "username": "hoangdinh90",
        "password": "demo@123",
        "client_id": "migratecard",
        "client_secret": "56665948e248b18b3b95b011"
    },
    json: true // Automatically stringifies the body to JSON
};




Given('today is Sunday', function () {
    // Write code here that turns the phrase above into concrete actions
    this.today = 'Sunday';

});

Given('Get token when login account 3rd', function () {
    var self = this;
    return request(options)
        .then(function (parsedBody) {
            // console.log(parsedBody);
            console.log("parsedBody.access_token:", parsedBody.access_token);
            self.token = _.get(parsedBody, ["access_token"], "");
            return;
        })
        .catch(function (err) {
            console.log (err);
        });

})

// Given('an api token after logined with username and password', function (username, password, done) {
//     var self = this;
//     this.request
//         .post("https://dispatch.beta.qup.vn/oauth/token")
//         .set("content-type", "application/json")
//         .set("accept", "application/json")
//         .send({
//             "grant_type": "password",
//             "username": "hoangdinh90",
//             "password": "demo@123",
//             "client_id": "migratecard",
//             "client_secret": "56665948e248b18b3b95b011"
//         })
//         .expect(200)
//         .then(function (response) {
//             if (response.body.error) {
//                 done(response.body.error)
//             }
//             console.log("response.body.res.user.roles ", response.body.res.user.roles);
//             self.token = _.get(response.body, "res.token");
//             done();
//         }).catch(done)
// });



When('I ask whether it\'s Friday yet', function () {
    // Write code here that turns the phrase above into concrete actions
    this.actualAnswer = isItFriday(this.today);
});

When('I request booking from API', function () {
    var self = this;
    console.log("token:" + self.token);

    var booking = {
        method: 'POST',
        uri: 'https://dispatch.beta.qup.vn/api/v2/agent/booking/create',
        headers: {
            'content-type': 'application/json',
            'authorization': 'Bearer ' + self.token
        },
        body: {

            "psgInfo":
                {
                    "phone": "+12063336666",
                    "firstName": "Hoang",
                    "lastName": "Demo 123",
                    "email": "dinhvanhoang90dn@gmail.com",
                    "creditInfo":
                        {
                            "cardNumber": "5555555555554444",
                            "cardHolder": "hoang",
                            "postalCode": "12345",
                            "expiredDate": "12/2022",
                            "cvv": "123"

                        }
                },
            "request":
                {
                    "pickup":
                        {
                            "address": "22 Quang Trung, H?i Châu District, Da Nang, Vietnam",
                            "geo": [108.222367, 16.075320],
                            "timezone": "Asia/Saigon"
                        },
                    "destination":
                        {
                            "address": "Furama Resort Da Nang, Võ Nguyên Giáp, Khuê M?, Ngu Hành Son, Ðà N?ng",
                            "geo": [108.222583, 16.039517],
                            "timezone": "Asia/Saigon"
                        },
                    "pickUpTime": "Now",
                    "vehicleTypeRequest": "Black Car",
                    "type": 3,
                    "paymentType": 2,
                    "note": "hoang test api",
                    "promo": "",
                    "rideSharing": false,
                    "tip": 50,
                    "packageRateId": "586321dfded2f4d52bb20f52"
                },
            "dispatch3rd": false,
            "corporateInfo":
                {
                    "division": "test",
                    "managerEmail": "test@gmail.com",
                    "corpId": "123",
                    "managerName": "",
                    "costCentre": "",
                    "department": "",
                    "corporateId": "574e5f54e4b03424c3c15045",
                    "clientCaseMatter": "",
                    "chargeCode": ""
                }
        },
        json: true // Automatically parses the JSON string in the response
    };

    return request(booking)
        .then(function (response) {
            console.log(response);
            console.log(response.response.bookId);
            self.code = response.response.code;
            self.bookId = response.response.bookId;
            console.log(self.code)
            return;
        })
        .catch(function (err) {

            console.log(err);
        });

})


Then('Booking create successful', function () {
    // Write code here that turns the phrase above into concrete actions
    var self = this;
    console.log("Code: " + self.code);
    if (self.code == true) {
        console.log("Booking successful: " + self.bookId);
    }else {
        console.log("Booking Failed");

    }
});

Then('I should be told {string}', function (expectedAnswer) {
    // Write code here that turns the phrase above into concrete actions
    assert.equal(this.actualAnswer, expectedAnswer);
});