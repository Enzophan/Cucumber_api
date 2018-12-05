var assert = require('chai').assert;
var { expect } = require('chai');
var { Given, When, Then, setDefaultTimeout } = require('cucumber');
var Promise = require('bluebird');
var _ = require('lodash');
var request = require('request-promise')


setDefaultTimeout(100000);


Given('Get token when login Account NewCC from {string}', function (string, dataTable) {
    var selfToken = this;
    var account = dataTable.hashes()[0];

    var newCCLocal = {
        method: 'POST',
        uri: 'http://ccapis.local.qup.vn/api/user/login',
        body: {
            "username": account.user,
            "password": account.password
        },
        json: true // Automatically stringifies the body to JSON
    };

    var newCCLab = {
        method: 'POST',
        uri: 'https://ccliteapis.lab.qup.vn/api/user/login',
        body: {
            "username": account.user,
            "password": account.password
        },
        json: true // Automatically stringifies the body to JSON
    };

    var newCCBeta = {
        method: 'POST',
        uri: 'http://ccapis.local.qup.vn/api/user/login',
        body: {
            "username": account.user,
            "password": account.password
        },
        json: true // Automatically stringifies the body to JSON
    };


    switch (string) {
        case "Local":
            return request(newCCLocal)
                .then(function (parsedBody) {
                    selfToken.token = parsedBody.res.token;
                    console.log("selfToken.token:", selfToken.token);
                    return;
                })
                .catch(function (err) {
                    console.log(err);
                });

        case "Lab":
            return request(newCCLab)
                .then(function (parsedBody) {
                    selfToken.token = parsedBody.res.token;
                    console.log("selfToken.token:", selfToken.token);
                    return;
                })
                .catch(function (err) {
                    console.log(err);
                });

        case "Beta":
            return request(newCCBeta)
                .then(function (parsedBody) {
                    selfToken.token = parsedBody.res.token;
                    console.log("selfToken.token:", selfToken.token);
                    return;
                })
                .catch(function (err) {
                    console.log(err);
                });
    }

});


When('I send request to api {string} with request with params based on table below', function (string, dataTable) {
    var selfToken = this;
    var self = this;

    console.log("selfToken.token:", selfToken.token);

    var params = dataTable.hashes()[0];

    var body = JSON.parse(params.requestBody);
    console.log("body: " + JSON.stringify(body));

    var requestBody = {
        method: 'POST',
        uri: string,

        headers: {
            'content-type': 'application/json',
            'authorization': selfToken.token,
            'Accept': 'application/json'
        },
        body: body,
        json: true // Automatically parses the JSON string in the response
    };

    return request(requestBody)
        .then(function (response) {
            console.log("Response After request :" + JSON.stringify(response));
            self.result = response.res
            console.log(self.code)
            return;
        })
        .catch(function (err) {
            console.log("Error After request :" + err);
            self.errorResponse = err;

        });

});


Then('I should get the return data matches with', function (dataTable) {
    var self = this;
    var res = JSON.parse(dataTable.hashes()[0].res);
    if (self.errorResponse) {
        result = self.errorResponse
    } else {
        result = self.result
    }
    console.log("============  expectedData :", JSON.stringify(res));
    console.log(">>>>>>>>>>>>  self.result :", JSON.stringify(result));

    assert.isTrue(self.matchData(result, res), "Failed: The data of document which inserted by API is not correctly");
});