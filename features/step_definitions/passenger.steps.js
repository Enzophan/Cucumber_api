var assert = require('chai').assert;
var { expect } = require('chai');
var { Given, When, Then, setDefaultTimeout } = require('cucumber');
var Promise = require('bluebird');
var _ = require('lodash');
var request = require('request-promise')
var io = require('socket.io-client');

setDefaultTimeout(100000);

Given('I request connect socket to {string}', function (string) {
    var self = this;
    var connectSocket = io(string, {
        'force new connection': true,
        reconnect: true
    });
    self.connectSocket = connectSocket;
    return connectSocket;
});

Given('I want register socket with data', function (dataTable) {
    var self = this;
    var socket = self.connectSocket;
    var account = dataTable.hashes()[0];

    return new Promise(function (onResolved, onRejected) {
        socket.on('connect', function () {
            socket.emit('register', {
                "platform": account.platform,
                "phone": JSON.parse(account.phone),
                "fleetId": account.fleetId,
                "appType": account.appType,
                "verifyCode": account.verifyCode,
                "ime": account.ime,
                "appName": account.appName,
                "rv": account.rv,
                "password": account.password
            });
            onResolved();
        });
    })
});

Given('Get token when login Account Pegasus on Server API {string}', function (string, dataTable) {
    var selfToken = this;
    var account = dataTable.hashes()[0];

    var bodyLogin = {
        method: 'POST',
        uri: string,
        body: {
            "grant_type": account.grant_type,
            "phone": JSON.parse(account.phone),
            "device_token": account.device_token,
            "client_id": account.client_id,
            "client_secret": account.client_secret
        },
        json: true // Automatically stringifies the body to JSON
    };

    return request(bodyLogin)
        .then(function (parsedBody) {
            console.log(parsedBody);
            selfToken.token = parsedBody.access_token;
            console.log("selfToken.token:", selfToken.token);
            return;
        })
        .catch(function (err) {
            console.log(err);
        });
});


When('I get my account info {string}', function (string) {
    var self = this;
    var socket = self.connectSocket;

    return new Promise(function (onResolved, onRejected) {
        socket.on(string, function (data) {
            self.storage = self.storage || {};
            self.storage.returnData = data;
            onResolved();
        })
    })
});

When('I send a request to edit account profile with {string}', function (string, dataTable) {
    var self = this;
    var socket = self.connectSocket;
    var params = dataTable.hashes()[0];

    return new Promise(function (onResolved, onRejected) {
        socket.on(string, function (data) {
            self.storage = self.storage || {};
            self.storage.returnData = data;
            onResolved();
        });
        socket.on("register", function (data) {
            console.log("register: " + JSON.stringify(data));
            socket.emit(string, {
                "firstName": params.firstName,
                "lastName": params.lastName,
                "email": params.email,
                "tips": params.tips,
                "profile": {
                    "gender": parseInt(params.gender),
                    "dob": params.dob,
                    "address": {
                        "street": params.street,
                        "city": params.city,
                        "state": params.state,
                        "zipcode": params.zipcode,
                        "country": params.country
                    }
                }
            });
        })
    })
});

When('I request API of Pegasus {string} with request with params based on table below', function (string, dataTable) {
    var selfToken = this;
    var self = this
    var params = dataTable.hashes()[0];

    var requestBody = {
        method: 'POST',
        uri: string,
        headers: {
            'content-type': 'application/json',
            'authorization': 'Bearer ' + selfToken.token
        },
        body: JSON.parse(params.requestBody),
        json: true // Automatically stringifies the body to JSON
    };

    return request(requestBody)
        .then(function (response) {
            console.log("Response After request :" + JSON.stringify(response));
            console.log("response.code: " + response.code);
            self.result = response;
            return;
        })
        .catch(function (err) {
            console.log("Error After request :" + err);
            self.errorResponse = err;

        });
  });

Then('I get return info with passenger info', function (dataTable) {
    var self = this;
    var res = JSON.parse(dataTable.hashes()[0].res);
    console.log("============ expectedData :", JSON.stringify(res));
    console.log(">>>>>>>>>>>> self.returnData :", JSON.stringify(self.storage.returnData));
    assert.isTrue(self.matchData(self.storage.returnData, res), "Failed: The data of document which inserted by API is not correctly");
    var socket = self.connectSocket;
    socket.close();
});

Then('I get return result after Login Pegasus app', function (dataTable) {
    var selfToken = this;
    var res = JSON.parse(dataTable.hashes()[0].res);
    console.log("============  expectedData :", JSON.stringify(res));
    console.log(">>>>>>>>>>>>  self.result :", JSON.stringify(selfToken.token));
});

Then('I get return result after request API of Pegasus app', function (dataTable) {
    var self = this;
    if (self.errorResponse) {
        result = self.errorResponse.error;
    } else {
        result = self.result;
    }
    var res = JSON.parse(dataTable.hashes()[0].res);
    console.log("============  expectedData :", JSON.stringify(res));
    console.log(">>>>>>>>>>>>  self.result :", JSON.stringify(result));

    assert.isTrue(self.matchData(result, res), "Failed: The data of document which inserted by API is not correctly");
  });