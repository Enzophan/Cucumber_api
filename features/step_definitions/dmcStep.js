// var assert = require('assert');
var assert = require('chai').assert;
var { expect } = require('chai');
var { Given, When, Then, setDefaultTimeout } = require('cucumber');
var Promise = require('bluebird');
var _ = require('lodash');
var request = require('request-promise')


setDefaultTimeout(100000);


var optionsLocalDMC = {
    method: 'POST',
    uri: 'http://192.168.2.52:8000/api/user/login',
    body: {
        "username": "dmcl",
        "password": "3Fg2Iw2B",
        "remember": true
    },
    json: true // Automatically stringifies the body to JSON
};

Given('Get token when login Account DMC from {string}', function (server) {
    var self = this;
    if (server == "local") {
        return request(optionsLocalDMC)
            .then(function (parsedBody) {
                // console.log(parsedBody);
                console.log("parsedBody.res.token:", parsedBody.res.token);
                console.log("parsedBody.res.user:", parsedBody.res.user);
                self.token = _.get(parsedBody, ["token"], "");
                self.result = _.get(parsedBody, ["user"], "");
                return;
            })
            .catch(function (err) {
                console.log(err);
            });
    }
})


Then('I should get the return data matches with', function (dataTable) {
    var self = this;
    var expectedData = JSON.parse(dataTable.hashes()[0].res);
    console.log("expectedData :", JSON.stringify(expectedData));
    console.log("self.result : ", JSON.stringify(self.result));
    assert.equal(JSON.stringify(self.result), JSON.stringify(expectedData), "Result object is not matched with the expected one");
    return;

});

