// var assert = require('assert');
var assert = require('chai').assert;
var { expect } = require('chai');
var { Given, When, Then, setDefaultTimeout } = require('cucumber');
var Promise = require('bluebird');
var _ = require('lodash');
var request = require('request-promise')


setDefaultTimeout(100000);


When('I request data from API {string}, with the criteria that described below', function (apiUrl, dataTable) {
    var self = this;
    var body = dataTable.hashes()[0].requestBody;
    console.log("Body Request :" + body);
    var requestBody = {
        method: 'POST',
        uri: apiUrl,
        headers: {
            'Content-Type': 'application/json',
            'Authorization': 'Bearer ' + self.token
        },
        body: JSON.parse(body),
        json: true // Automatically stringifies the body to JSON
    };

    return request(requestBody)
        .then(function (response) {
            console.log("response data :" + JSON.stringify(response));
            self.result = response;
            return;
        })
        .catch(function (err) {
            console.log(err);
            self.errorResponse = err;
        });
});


Then('the return data matches with expected result', function (dataTable) {
    var self = this;

    if (self.errorResponse) {
        result = self.errorResponse.error;
    } else {
        result = self.result.response;
    }
    var res = JSON.parse(dataTable.hashes()[0].res);
    console.log("============  expectedData :", JSON.stringify(res));
    console.log(">>>>>>>>>>>>  self.result :", JSON.stringify(result));

    assert.isTrue(self.matchData(result, res), "Failed: The data of document which inserted by API is not correctly");
});


Then('there are total {string} item effected, data array has {string} item', function (arg1, arg2) {
    var self = this;
    console.log("self.result.response.total :", JSON.stringify(self.result.response.total));
    console.log("self.result.response.list :", JSON.stringify(self.result.response.list.length));
    assert.equal(self.result.response.total, arg1);
    assert.equal(self.result.response.list.length, arg2);
});