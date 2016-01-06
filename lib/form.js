
var _ = require('lodash');

exports.create = function(form, schema) {
  var html = _.map(form.inputs, function(value) {

    var key = value.key;
    var type = value.type;
    var prop = schema.properties[key];

    switch (type) {
      case 'select':
        return '<uipack-select key="' + key + '"></uipack-select>';
      case 'textarea':
        return '<uipack-textarea key="' + key + '"></uipack-textarea>';
      default:
        if ((prop.type === 'string' || prop.type === 'integer') && prop.enum) {
          return '<uipack-radio key="' + key + '"></uipack-radio>';
        } else if (prop.type === 'array' && prop.enum) {
          return '<uipack-checkbox key="' + key + '"></uipack-checkbox>';
        } else if (prop.type === 'string' || prop.type === 'integer' || prop.type === 'number') {
          return '<uipack-input key="' + key + '"></uipack-input>';
        } else {
          return '<uipack-error key="' + key + '"></uipack-error>';
        }
    }
  });
  html.push('<button class="btn btn-primary" type="submit">OK</button>');
  return html.join('');
};