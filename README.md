# UI pack

Web Admin View UI フレームワーク

HTMLは自動生成させるので、HTML5の構造に準拠させることにする。

管理画面用フレームワーク(そのため、画面のデザインは決まっている。)

WebViewのレイアウトをテンプレートの`JavaScript`で定義するだけで画面を作成できる。

エンドポイントのAPIを設定する

CSSにはBootstrap4を使用する

core機能はTypeScriptを使用して開発する

### 作成順序
- [ ] URIルーティングを入れる
- [ ] メニューバーを作成する
- [ ] 自動フォーム

### dependency

- webpack
- riot.js
- tv4
- jquery
- stylus
- eslint
- ES6(ES2015)

viewのレイアウトcomponentにriot.jsを用いてカスタムタグを作る。
そして、handlebarsで繰り返しなどの制御系を行う

プラグイン的な機能を作って拡張しやすくする

カスタムタグは外部からも読み込みできるように設計すること

CSSのデザインは`stylus`で行う

ファイル名の命名規則はスネークケースで記述する

node.jsのExpress風(connect風)のuseなどでのlayer構成にする

コーディングはES6で記述して勉強にする

## Library

webpackのUMD(Universal Module Definition)でライブラリを公開する

Endpoint: UIPack

### API

##### UIPack.addPack([path:string,] schema:Object [,type:string])

`type:string`の設定方法に`JSON`or`YAML`と記述する

1画面の構成を加える

##### UIPack.addValidate(key:string, callback:Function)

##### UIPack.set(options)

`hashbang:string`ハッシュ値の設定

##### UIPack.use([path:string,] function)

urlのhashchangeイベントを受けてから順番に`use`していく

##### UIPack.Router([options])

`router.on`で記述してパスのルーティング処理を行うことができる

##### UIPack.start

### EXAMPLE

```javascript
<script src="uipack.js"></script>
<script type="text/javascript">
// 1画面の内容を追加する
UIPack.addPack({
  "Layout Schema JSON"
});
UIPack.addPack({
  "Layout Schema JSON"
});

// カスタムバリデーションを追加する
UIPack.addValidate('custom-validate', function(data) {
  return !/-/.test(data);
})

// ハッシュURLの記号設定
UIPack.set({hashbang: '#!'});

// 個別のURLルーティングを設定する
var router = UIPack.Router([options]);
router.on('/user/:_id', function(params, next) {
  // params._id
  // params.query.key
  next();
});
router.on('/area/:_id', function(params, next) {
  next();
});

// レイヤー構造で調べる
UIPack.use(function(next) {
  // riot.jsでいうupdateの処理部分を行う
  next();
});
UIPack.use(router);
UIPack.use(function(next) {
  // riot.jsでいうupdatedの処理部分を行う
  next();
});

// 開始
UIPack.start();
</script>
```

## Pack Layout Schema Specification

レイアウト用のスキーマ設定

enumの場合はselectになる

1画面を構成するための決まったテンプレートのレイアウト定義ファイルを構築する。

schema部分は`JSONSchema`定義で記述する

form部分は入力フォームの定義を記述する

view部分はHTMLでの表示レイアウト部分を記述する

テンプレート部分にはカスタムタグでの記述方法で書くことにするかな。。。

```javascript
{
  group: 'user', // 左のグループ表示でまとめるときの指定
  path: 'GET:/user/:_id', // インナーパス
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
    save: {
      title: '',
      action: 'POST:/collection/user',
      inputs: [
        {
          key: '_id',
          type: 'text', // フォームのタイプ(textの場合は省略可能にする)
          title: '', // なければスキーマのタイトルが使用される
          helper: '', // ヘルプを記述する。この設定が無いっていると自動的に入力フォームの下に入る
          validate: 'custom-validate', // カスタムバリデーションの名前
          value: '' // デフォルトの値
        },
        {
          key: 'name',
          type: 'text',
          placeholder: '', // プレースホルダ(Form内にサンプルを記述しておく)
          helper: '' // ヘルプ
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
          key: 'list'
        },
        {
          key: 'multiple'
        }
      ]
    },
    delete: {
      title: '',
      action: 'DELETE:/collection/user',
      inputs: [
        {
          key: '_id',
          title: '',
          readonly: true
        }
      ]
    }
  },
  view: {
    el: '#main', // jquery的なelementの指定の仕方
    layout: '',
    search: {
      title: 'ユーザ検索をする',
      action: 'GET:/search/user/:_id',
      inputs: [
        {
          key: '_id'
        }
      ]
    },
    create: {
      title: '新規作成',
      btn: 'save'
    },
    // テープル表示させるときに配列で表示順番を決める
    table: {
      title: 'ユーザのテーブル情報', // キャプションの設定
      // ボタングループ
      btn_group: {
        left: [
          'save'
        ],
        right: [
          'delete'
        ]
      },
      // テーブルの列を定義する
      rows: [
        {
          key: '_id', // データから取得するキーを指定する
          template: '{{image this}}'
        },
        {
          key: '_id'
        },
        {
          key: 'name'
        },
        {
          key: 'gender',
          template: '{{gener this}}'
        },
        {
          keys: ['_id', 'name'], // keysに指定した場合はオブジェクト型になり
          template: 'ID: {{_id}} NAME: {{name}}'
        }
      ]
    }
  }
}
```

## ROADMAP

- riot.jsによるCustomTagのサポートを入れる
- JSON対応
- YAML対応

## LICENSE

The MIT License (MIT)

Copyright (c) 2016 Yuta Ichikawa

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
