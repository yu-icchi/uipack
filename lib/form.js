
var _ = require('lodash');

exports.create = function(form, schema) {
  var html = _.map(form.inputs, function(value) {

    var key = value.key;
    var type = value.type;
    var prop = schema.properties[key];

    if (type === 'select') {
      return '<uipack-select key="' + key + '"></uipack-select>';
    } else if (type === 'textarea') {
      return '<uipack-textarea key="' + key + '"></uipack-textarea>';
    } else if (prop.type === 'array' && prop.items) {
      return '<uipack-array key="' + key + '"></uipack-array>';
    } else if ((prop.type === 'string' || prop.type === 'integer') && prop.enum) {
      return '<uipack-radio key="' + key + '"></uipack-radio>';
    } else if (prop.type === 'array' && prop.enum) {
      return '<uipack-checkbox key="' + key + '"></uipack-checkbox>';
    } else if (prop.type === 'string' || prop.type === 'integer' || prop.type === 'number') {
      return '<uipack-input key="' + key + '"></uipack-input>';
    } else {
      return '<uipack-error key="' + key + '"></uipack-error>';
    }
  });
  html.push('<button class="btn btn-default" type="submit">OK</button>');
  return html.join('');
};