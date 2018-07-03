var { setWorldConstructor } = require('cucumber');
var mongojs = require('mongojs');
// var config_data = require('./config-data.json');

var connectionString = "mongodb://192.168.2.85:27017/test-hydra";

function CustomWorld() {
    this.db = mongojs(connectionString)
}

setWorldConstructor(CustomWorld)