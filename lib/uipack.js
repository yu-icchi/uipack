/**
 * @fileOverview main script
 */

var riot = require('riot');

var pkg = require('../package.json');

require('./view');
require('./dynamic_form');
require('./components');

var store = require('./store');

var routeParser = function(path) {
  var raw = path.split('?'),
    uri = raw[0].split('/'),
    qs = raw[1],
    params = {};

  if (qs) {
    qs.split('&').forEach(function(v) {
      var c = v.split('=');
      params[c[0]] = c[1];
    });
  }

  uri.push(params);
  return uri;
};

// @exports

exports.version = function () {
  return pkg.version;
};

exports.addPack = function(template) {
  store.set(template.group, template);
};

exports.start = function(el) {

  riot.route.parser(routeParser);

  riot.mount(el, 'main', {});
};
