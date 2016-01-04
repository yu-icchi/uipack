
module.exports = {
  group: 'area',
  path: 'area/detail/:id',
  schema: {
    type: 'object',
    properties: {
      _id: {
        title: 'エリア詳細のID',
        type: 'string'
      }
    }
  },
  form: {
    title: 'エリア詳細',
    action: 'POST:/collection/area',
    input: [
      '_id'
    ]
  },
  // bootstrap v4のcomponentに合わせた入力形式にする
  view: {
    el: 'main',
    'btn-group': {
      type: 'add'
    },
    table: {
      title: 'エリア詳細',
      rows: [
        {
          key: '_id'
        }
      ]
    }
  }
};
