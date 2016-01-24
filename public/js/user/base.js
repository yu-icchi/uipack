SCENES_TEMPLATE = {
  group: 'user',
  path: 'user/base/:_id', // インナーパス
  schema: { // 双方向のデータ形式
    type: 'object',
    properties: {
      _id: {
        title: 'ID',
        type: 'string'
      },
      name: {
        title: 'NAME',
        type: 'string',
        maxLength: 120
      },
      gender: {
        title: 'GENDER',
        type: 'string',
        enum: ['male', 'female']
      },
      type: {
        title: 'USER TYPE',
        type: 'integer',
        enum: [0, 1, 2, 3],
        description: 'ユーザのタイプ、0:通常、1:NPC、2:スタッフ、3:芸能人'
      },
      age: {
        title: 'AGE',
        type: 'number'
      },
      list: {
        type: 'array',
        items: {
          title: 'ITEMS',
          type: 'string'
        }
      },
      multiple: {
        type: 'array',
        items: {
          type: 'object',
          properties: {
            test01: {
              title: 'TEST01',
              type: 'string'
            },
            test02: {
              title: 'TEST02',
              type: 'string'
            }
          }
        }
      }
    },
    required: [
      '_id',
      'name',
      'gender'
    ]
  },
  forms: {
    base: {
      title: 'ユーザデータ入力',
      action: 'POST:/collection/user',
      inputs: []
    },
    remove: {
      title: '削除',
      action: 'DELETE:/collection/user',
      inputs: []
    }
  },
  form: {
    title: 'ユーザデータ入力',
    action: 'POST:/collection/user',
    inputs: [
      {
        key: '_id',
        type: 'text', // フォームのタイプ(textの場合は省略可能にする)
        title: 'らべる', // なければスキーマのタイトルが使用される
        placeholder: 'プレースホルダ',
        help: 'help message' // ヘルプを記述する。この設定が無いっていると自動的に入力フォームの下に入る
      },
      {
        key: 'name',
        type: 'textarea',
        placeholder: '120文字', // プレースホルダ(Form内にサンプルを記述しておく)
        help: 'おーなーまーえー' // ヘルプ
      },
      {
        key: 'gender',
        help: '性別指定してね',
        label: {
          male: '男性',
          female: '女性'
        }
      },
      {
        key: 'type',
        type: 'select',
        label: {
          0: '一般人',
          1: 'NPC',
          2: 'スタッフ',
          3: '芸能人'
        }
      },
      {
        key: 'age',
        value: 100
      }
    ]
  },
  view: {
    el: '#main', // jQueryの指定方法
    search: {
      title: 'ユーザ検索をする',
      action: 'GET:/search/user/:_id',
      inputs: []
    },
    // テープル表示させるときに配列で表示順番を決める
    table: {
      title: 'ユーザのテーブル情報', // キャプションの設定
      // テーブルの列を定義する
      rows: [
        {
          title: 'IMAGE',
          key: '_id', // データから取得するキーを指定する
          template: '<miami-image data={this}></miami-image>' // riot.jsでカスタムコンポーネントを作成し使用する
        },
        {
          key: '_id'
        },
        {
          key: 'name'
        },
        {
          key: 'gender',
          template: '<miami-gender data={this}></miami-gender>'
        },
        {
          title: 'MIXIN',
          keys: ['_id', 'name'], // keysに指定した場合はオブジェクト型になり
          template: 'ID: {{_id}} NAME: {{name}}'
        },
        {
          title: 'BUTTON',
          template: '<miami-btn-group></miami-btn-group>'
        }
      ]
    }
  },
  // mock用のサンプルデータ
  data: [
    {_id: 'test001', name: 'name001', gender: 'male'},
    {_id: 'test002', name: 'name002', gender: 'female'},
    {_id: 'test003', name: 'name003', gender: 'male'},
    {_id: 'test004', name: 'name004', gender: 'female'}
  ]
};
