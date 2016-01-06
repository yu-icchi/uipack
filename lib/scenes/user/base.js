
module.exports = {
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
        type: 'string'
      },
      gender: {
        title: 'GENDER',
        type: 'string',
        enum: ['male', 'female']
      },
      age: {
        title: 'AGE',
        type: 'integer'
      }
    },
    required: [
      '_id',
      'name',
      'gender'
    ]
  },
  form: {
    title: '',
    action: 'POST:/collection/user',
    inputs: [
      {
        key: '_id',
        type: 'text', // フォームのタイプ(textの場合は省略可能にする)
        label: 'らべる', // なければスキーマのタイトルが使用される
        placeholder: 'プレースホルダ',
        help: 'help message', // ヘルプを記述する。この設定が無いっていると自動的に入力フォームの下に入る
        validate: function(data) { // カスタムバリデーションを作成できる
          console.log('カスタムバリデーション関数', data);
          return !/-/.test(data); // booleanを返す用にする(判定側はbooleanで判定してしまう)
        }
      },
      {
        key: 'name',
        placeholder: '', // プレースホルダ(Form内にサンプルを記述しておく)
        help: '' // ヘルプ
      },
      {
        key: 'gender',
        type: 'select'
      },
      {
        key: 'age'
      }
    ]
  },
  view: {
    el: '#main',
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
          template: '<miami-image id={{this}}></miami-image>' // riot.jsでカスタムコンポーネントを作成し使用する
        },
        {
          key: '_id'
        },
        {
          key: 'name'
        },
        {
          key: 'gender',
          template: '<miami-gender>{{this}}</miami-gender>'
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
