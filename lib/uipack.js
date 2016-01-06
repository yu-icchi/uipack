/**
 * @fileOverview main script
 */

var _ = require('lodash');

// ルーティング
var director = require('director');
var Router = director.Router;

require('bootstrap-webpack');

var scenes = require('./scenes');
var render = require('./render');

var routes = {};

_.forEach(scenes, function(scene) {
  routes[scene.path] = function(id) {
    var data = scene.data || [];
    console.log('[scene]', scene, data);
    render(scene, data);
  };
});

var router = Router(routes);
router.init();
