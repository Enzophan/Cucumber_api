var { setWorldConstructor } = require('cucumber');
var mongojs = require('mongojs');
var _ = require('lodash');
// var config_data = require('./config-data.json');

var connectionString = "mongodb://192.168.2.85:27017/qupworldCopy";

function CustomWorld() {
    this.db = mongojs(connectionString)
    this.matchData = function (data, expect) {
        var self = this;
        if (_.isArray(expect) && _.isArray(data)) {
            return expect.every(function (item) {
                return data.some(function (datum) {
                    return self.matchData(datum, item);
                })
            })
        } else {
            return _.isMatchWith(data, expect, matchFn)
        }
    }
    
    function matchFn(obj, src) {
        if (!_.isObject(obj)) {
            return obj === src
        }
        if (_.isArray(src) && _.isArray(obj)) {
            return src.every(function (item) {
                return obj.some(function (datum) {
                    return matchFn(datum, item);
                })
            })
        } else {
            if (_.matches(src)(obj)) return true;
            return Object.keys(src).every(function (key) {
                return matchFn(obj[key], src[key]);
            })
        }
        return false;
    }
}


setWorldConstructor(CustomWorld)