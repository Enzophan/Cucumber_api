var assert = require('chai').assert;
var { expect } = require('chai');
var { Given, When, Then, setDefaultTimeout } = require('cucumber');
var Promise = require('bluebird');
var _ = require('lodash');
var request = require('request-promise')
var io = require('socket.io-client');

setDefaultTimeout(100000);


Then('I get return info with mDispatcher info', function (dataTable) {
    var self = this;
    var res = JSON.parse(dataTable.hashes()[0].res);
    console.log("============ expectedData :", JSON.stringify(res));
    console.log(">>>>>>>>>>>> self.returnData :", JSON.stringify(self.storage.returnData));
    assert.isTrue(self.matchData(self.storage.returnData, res), "Failed: The data of document which inserted by API is not correctly");
    var socket = self.connectSocket;
    socket.close();
});

