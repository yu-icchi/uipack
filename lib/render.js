var _ = require('lodash');
var $ = require('jquery');
var riot = require('riot');

require('./tag');

function createSearchView(element) {
  element.append('<uipack-search></uipack-search>');
  riot.mount('uipack-search', {});
}

function createTableView(element, scene, data) {
  var schema = scene.schema;
  var view = scene.view;
  if (_.isEmpty(view.table)) {
    throw new Error('failed to view table.');
  }

  var title = view.table.title;
  var rows = _.map(view.table.rows, function(row) {

    var key = row.key;
    var schemaTitle = schema.properties && schema.properties[row.key] && schema.properties[row.key].title;
    return {
      title: row.title || schemaTitle || '-',
      key: key
    };
  });

  element.append('<uipack-table></uipack-table>');
  riot.mount('uipack-table', {title: title, rows: rows, data: data});
}

function createFormSpecs(element, scene) {
  var formMap = {};
  _.forEach(scene.form, function(form) {
    formMap[form.key] = form;
  });
  element.append('<uipack-formspecs></uipack-formspecs>');
  riot.mount('uipack-formspecs', {form: scene.form, schema: scene.schema});
}

/**
 * view render
 * @param {Object} scene
 * @param {Object} data
 */
module.exports = function(scene, data) {
  if (_.isEmpty(scene.view) || _.isEmpty(scene.view.el)) {
    throw new Error('view element is not found.');
  }

  var element = $(scene.view.el);
  element.empty(); // リフレッシュ

  _.forEach(scene.view, function(view, key) {
    switch(key) {
      case 'search':
        return createSearchView(element);
      case 'table':
        return createTableView(element, scene, data);
    }
  });

  // デバッグテスト
  if (scene.schema) {
    createFormSpecs(element, scene);
  }
};
