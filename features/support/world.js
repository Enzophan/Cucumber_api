var { setWorldConstructor } = require('cucumber');
var mongojs = require('mongojs');
var _ = require('lodash');
// var config_data = require('./config-data.json');

var connectionString = "mongodb://192.168.2.85:27017/qupworldCopy";

function CustomWorld() {
    this.db = mongojs(connectionString)
}

setWorldConstructor(CustomWorld)