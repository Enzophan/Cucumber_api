// var assert = require('assert');
var assert = require('chai').assert;
var { expect } = require('chai');
var { Given, When, Then, setDefaultTimeout } = require('cucumber');
var Promise = require('bluebird');
var _ = require('lodash');
var request = require('request-promise')


setDefaultTimeout(100000);

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

var optionsLocal = {
    method: 'POST',
    uri: 'http://192.168.2.85:1337/oauth/token',
    body: {
        "grant_type": "password",
        "username": "auto_test",
        "password": "demo@12345",
        "client_id": "hoanglocal",
        "client_secret": "222999888"
    },
    json: true // Automatically stringifies the body to JSON
};


Given('Get token when login Account 3rd from {string}', function (server) {
    var self = this;
    if (server == "local") {
        return request(optionsLocal)
            .then(function (parsedBody) {
                // console.log(parsedBody);
                console.log("parsedBody.access_token:", parsedBody.access_token);
                self.token = _.get(parsedBody, ["access_token"], "");
                return;
            })
            .catch(function (err) {
                console.log(err);
            });
    } else {
        return request(options)
            .then(function (parsedBody) {
                // console.log(parsedBody);
                console.log("parsedBody.access_token:", parsedBody.access_token);
                self.token = _.get(parsedBody, ["access_token"], "");
                return;
            })
            .catch(function (err) {
                console.log(err);
            });

    }

});

Given('I want get token when login account 3rd', function () {
    var self = this;
    return request(optionsLocal)
        .then(function (parsedBody) {
            // console.log(parsedBody);
            console.log("parsedBody.access_token:", parsedBody.access_token);
            self.token = _.get(parsedBody, ["access_token"], "");
            return;
        })
        .catch(function (err) {
            console.log(err);
        });

});

Given('I login with server {string}, user and password of Account third party based in table', function (apiUrl, dataTable) {
    var self = this;
    var account = dataTable.hashes()[0];
    var requestBody = {
        method: 'POST',
        uri: apiUrl,
        body: {
            "grant_type": account.grant_type,
            "username": account.username,
            "password": account.password,
            "client_id": account.client_id,
            "client_secret": account.client_secret
        },
        json: true // Automatically stringifies the body to JSON
    };

    return request(requestBody)
        .then(function (parsedBody) {
            // console.log(parsedBody);
            console.log("parsedBody.access_token:", parsedBody.access_token);
            self.token = _.get(parsedBody, ["access_token"], "");
            return;
        })
        .catch(function (err) {
            console.log(err);
        });
});

// +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++


When('I request booking from API', function () {
    var self = this;
    console.log("token:" + self.token);

    var booking = {
        method: 'POST',
        // uri: 'https://dispatch.beta.qup.vn/api/v2/agent/booking/create',

        uri: 'http://192.168.2.85:1337/api/v2/agent/booking/create',

        headers: {
            'content-type': 'application/json',
            'authorization': 'Bearer ' + self.token
        },
        body: {

            "psgInfo":
            {
                "phone": "+12063336666",
                "firstName": "Auto Test",
                "lastName": "Demo 123",
                "email": "tester.qup@gmail.com",
                "creditInfo":
                {
                    "cardNumber": "5555555555554444",
                    "cardHolder": "Auto",
                    "postalCode": "98789",
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
                "vehicleTypeRequest": "Bike",
                "type": 0,
                "paymentType": 2,
                "note": "Auto test api",
                "promo": "",
                "rideSharing": false,
                "tip": 10.99,
                "packageRateId": "5b3d8590e4b0edd700de78cf"
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
                "corporateId": "5b3d86a2e4b0edd700de78d5",
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

});


When('I request booking from API when custom data', function (table) {
    var self = this;
    console.log("token:" + self.token);
    var body = JSON.parse(table.hashes()[0].requestBody);

    var booking = {
        method: 'POST',
        // uri: 'https://dispatch.beta.qup.vn/api/v2/agent/booking/create',
        uri: 'http://192.168.2.85:1337/api/v2/agent/booking/create',

        headers: {
            'content-type': 'application/json',
            'authorization': 'Bearer ' + self.token
        },
        body: body,
        json: true // Automatically parses the JSON string in the response
    };

    return request(booking)
        .then(function (response) {
            console.log("Response After request :" + response);
            console.log("Booking ID After request :" + response.response.bookId);
            self.code = response.response.code;
            self.bookId = response.response.bookId;
            console.log(self.code)
            return;
        })
        .catch(function (err) {

            console.log("Error After request :" + err);

            self.errorResponse = err;


        });

});


When('I request cancel booking from API', function () {
    var self = this;
    var bookId = self.bookId;
    console.log("Cancel fo Boooking ID: " + bookId);

    var cancelBooking = {
        method: "POST",
        uri: "http://192.168.2.85:1337/api/v2/agent/booking/cancel",
        headers: {
            'content-type': 'application/json',
            'authorization': 'Bearer ' + self.token
        },
        body: {
            "bookId": bookId
        },
        json: true

    };

    return request(cancelBooking)
        .then(function (response) {
            self.response = response.response;
            return;
        })
        .catch(function (err) {
            console.log(err);
        });

});

When('I request cancel books from API', function () {
    // Write code here that turns the phrase above into concrete actions
    var self = this;
    var bookIds = self.bookIds;
    console.log("Cancel fo Boooking ID: " + bookIds);

    function buildRequestBody(bookId) {
        var cancelBooking = {
            method: "POST",
            uri: "http://192.168.2.85:1337/api/v2/agent/booking/cancel",
            headers: {
                'content-type': 'application/json',
                'authorization': 'Bearer ' + self.token
            },
            body: {
                "bookId": bookId
            },
            json: true

        };
        return cancelBooking;
    }

    return Promise.each(bookIds, function (bookId) {
        return request(buildRequestBody(bookId))
            .then(function (response) {
                // console.log(response);
                self.response = response.response;
                return;
            })
            .catch(function (err) {
                console.log(err);
            });
    }).catch(function (err) {
        console.log(err);
    });
});


When('Find booking from {string} have phone number and request cancel that booking', function (collection, table) {
    var self = this;
    // [{total: 1, specifiedInfo: '{"request.note":"Auto test api"}'}]
    var query = JSON.parse(table.hashes()[0].req);;
    console.log("query :", JSON.stringify(query, null, 3));
    return Promise.promisify(self.db.collection(collection).find, {
        context: self.db.collection(collection)
    })(query)
        .then(function (foundDocs) {
            // Array 
            var newFoundDocs = foundDocs.map(function (doc) { return doc.bookId });
            // console.log(newFoundDocs);
            self.bookIds = newFoundDocs;
            console.log(self.bookIds);
            // console.log("Find Booking :" + foundDocs.bookId)
            return;
        }).catch(function (err) {
            console.log(err);
        });
    return 'pending';
});



// ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

Then('Booking create successful', function () {
    // Write code here that turns the phrase above into concrete actions
    var self = this;
    console.log("Code: " + self.code);
    if (self.code == true) {
        console.log("Booking successful: " + self.bookId);
    } else {
        console.log("Booking Failed");
    };
    return;
});

Then('Booking cancelled successful', function () {
    // Write code here that turns the phrase above into concrete actions
    var self = this;
    if (self.response == 200) {
        console.log("Status cancelled :" + self.response)
    }
    else {
        console.log("Status cancel booking failed :" + self.response)
    };

    return;
});


Then('I should get an error object in returned data with errorCode {string}', function (statusCode, table) {
    // Write code here that turns the phrase above into concrete actions
    var self = this;
    console.log("Self.errorResponse :" + JSON.stringify(self.errorResponse));
    assert.equal(self.errorResponse.statusCode, statusCode);
    var expectedData = JSON.parse(table.hashes()[0].res);
    console.log("expectedData :", JSON.stringify(expectedData));
    console.log("Self.errorResponse.error : ", JSON.stringify(self.errorResponse.error));
    assert.equal(JSON.stringify(self.errorResponse.error), JSON.stringify(expectedData), "Result object is not matched with the expected one");
    return;
});

Then('I should have {string} document in database with below info', function (collection, table) {
    var self = this;
    var query = JSON.parse(table.hashes()[0].specifiedInfo);
    console.log("query :", JSON.stringify(query, null, 3));
    return Promise.promisify(self.db.collection(collection).find, {
        context: self.db.collection(collection)
    })(query)
        .then(function (foundDocs) {
            assert.equal(foundDocs.length, table.hashes()[0].total, 'The number of documents which inserted by API is not correctly');
            return;
        }).catch(function (err) {
            console.log(err);
            throw err;
        });
})

Then('I should have {string} document in database with below expected data', function (collection, table) {
    var self = this;
    // [{total: 1, specifiedInfo: '{"request.note":"Auto test api"}'}]
    var specifiedInfo = JSON.parse(table.hashes()[0].specifiedInfo);
    var query = { "bookId": self.bookId };
    console.log("query ", JSON.stringify(query, null, 3));
    return Promise.promisify(self.db.collection(collection).find, {
        context: self.db.collection(collection)
    })(query)
        .then(function (foundDocs) {
            console.log(">>>>>>>>>>>>Expected Data : " + JSON.stringify(specifiedInfo));
            console.log(">>>>>>>>>>>>Query Data : " + JSON.stringify(foundDocs));
            assert.isTrue(self.matchData(foundDocs, specifiedInfo), "Failed: The data of document which inserted by API is not correctly");
            return;
        }).catch(function (err) {
            // console.log(err);
            throw err;
        });
});


Then('I should have {string} document in database with {string} Booking ID', function (collection, total) {
    var self = this;
    // [{total: 1, specifiedInfo: '{"request.note":"Auto test api"}'}]
    // var query = JSON.parse(table.hashes()[0].specifiedInfo);
    var query = { "bookId": self.bookId };
    console.log("query ", JSON.stringify(query, null, 3));
    return Promise.promisify(self.db.collection(collection).find, {
        context: self.db.collection(collection)
    })(query)
        .then(function (foundDocs) {
            assert.equal(foundDocs.length, total, "The number of documents which inserted by API is not correctly")
            var myJSON = JSON.stringify(foundDocs);
            console.log(myJSON);
            return;
        }).catch(function (err) {
            console.log(err);
        });
});

Then('I should not have {string} document in database with below info', function (collection) {
    var self = this;
    // [{total: 1, specifiedInfo: '{"request.note":"Auto test api"}'}]
    var query = { "bookId": self.bookId };
    console.log("query ", JSON.stringify(query, null, 3));
    return Promise.promisify(self.db.collection(collection).find, {
        context: self.db.collection(collection)
    })(query)
        .then(function (foundDocs) {
            assert.isEmpty(foundDocs, "The document is not removed");
            return;
        })
        .catch(function (err) {
            console.log(err);
        })
});

