// var assert = require('assert');
var assert = require('chai').assert;
var { expect } = require('chai');
var { Given, When, Then, setDefaultTimeout } = require('cucumber');
var Promise = require('bluebird');
var _ = require('lodash');
var request = require('request-promise')


setDefaultTimeout(100000);

var optionsLocal = {
    method: 'POST',
    uri: 'http://192.168.2.52:8000/api/user/login',
    body: {
        "username": "dmcl",
        "password": "3Fg2Iw2B",
        "remember": true
    },
    json: true // Automatically stringifies the body to JSON
};
