// var assert = require('assert');
var assert = require('chai').assert;
var { Given, When, Then } = require('cucumber');
var Promise = require('bluebird');
var _ = require('lodash');
var request = require('request-promise')



function isItFriday(today) {

    return 'Nope';
    // We'll leave the implementation blank for now
}

Given('today is Sunday', function () {
    // Write code here that turns the phrase above into concrete actions
    this.today = 'Sunday';

});


When('I ask whether it\'s Friday yet', function () {
    // Write code here that turns the phrase above into concrete actions
    this.actualAnswer = isItFriday(this.today);
});


Then('I should be told {string}', function (expectedAnswer) {
    // Write code here that turns the phrase above into concrete actions
    assert.equal(this.actualAnswer, expectedAnswer);
});