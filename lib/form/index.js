
var _ = require('lodash');

exports.create = function(data) {
  var html = '';
  _.forEach(data.inputs, function(value) {
    html += '<uipack-input key="' + value.key + '"></uipack-input>';
  });
  return html;
};