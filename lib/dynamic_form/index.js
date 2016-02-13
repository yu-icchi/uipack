var _ = require('lodash');
var tv4 = require('tv4');

require('./dynamic_form.tag');

var store = require('../store');

exports.createForm = function() {
  var inputs = [
    {tag: 'uipack-string', id: 'string', name: 'string'},
    {tag: 'uipack-number', id: 'number', name: 'number'},
    {tag: 'uipack-checkbox', id: 'checkbox', name: 'checkbox', items: [{id: 'id', value: 'value', label: 'らべる'}, {id: 'id', value: 'value', label: 'らべる'}]},
    {tag: 'uipack-radio', id: 'radio', name: 'radio', items: [{id: 'id', name: 'radio', value: 'value', label: 'らべる'}, {id: 'id', name: 'radio', value: 'value', label: 'らべる'}]},
    {tag: 'uipack-select', id: 'select', name: 'select', items: [{value: '001'}, {value: '002'}]},
    {tag: 'uipack-textarea', id: 'textarea', name: 'textarea'},
    {tag: 'uipack-file', id: 'file', name: 'file'}
  ];
  return inputs;
};

exports.createDynamicForm = function(key) {
  var data = store.get(key);
  var inputs = _.map(data.form.inputs, function(input) {
    var key = input.key;
    var schema = data.schema.properties[key];
    var type = input.type || schema.type;
    var items = [];
    var tag = 'uipack-error';
    var maxLength = 0;

    if (type === 'select') {
      tag = 'uipack-select';
      items = _.map(schema.enum, function(value) {
        var label = input.label && input.label[value] || value;
        return {value: value, label: label};
      });
    } else if (type === 'textarea') {
      tag = 'uipack-textarea';
      maxLength = schema.maxLength;
    } else if (type === 'file') {
      tag = 'uipack-file';
    } else if (type === 'radio' || (_.isArray(schema.enum) && schema.enum.length > 0)) {
      tag = 'uipack-radio';
      items = _.map(schema.enum, function(value) {
        var label = input.label && input.label[value] || value;
        return {name: key, id: key, value: value, label: label};
      });
    } else if (!schema.enum && (type === 'number' || type === 'integer')) {
      tag = 'uipack-number';
    } else if (!schema.enum && (type === 'string' || type === 'text')) {
      tag = 'uipack-string';
    }

    return {
      tag: tag,
      id: key,
      title: input.title || schema.title || '',
      placeholder: input.placeholder || '',
      help: input.help || schema.description || '',
      items: items,
      maxLength: maxLength
    };
  });
  return inputs;
};

exports.validate = function(value, schema) {
  if (schema.type === 'integer' || schema.type === 'number') {
    value = Number(value);
  }

  return tv4.validate(value, schema);
};
