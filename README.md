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

- coreなモジュールはTypeScriptで記述する(これは努力目標かも)
- webpack
- riot.js
- tv4
- jquery
- stylus
- eslint

viewのレイアウトcomponentにriot.jsを用いてカスタムタグを作る。
そして、handlebarsで繰り返しなどの制御系を行う

プラグイン的な機能を作って拡張しやすくする

カスタムタグは外部からも読み込みできるように設計すること

CSSのデザインは`stylus`で行う

ファイル名の命名規則はスネークケースで記述する

## Layout Schema Specification

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
  form: {
    title: '',
    action: 'POST:/collection/user',
    inputs: [
      {
        key: '_id',
        type: 'text', // フォームのタイプ(textの場合は省略可能にする)
        label: '', // なければスキーマのタイトルが使用される
        helper: '', // ヘルプを記述する。この設定が無いっていると自動的に入力フォームの下に入る
        onXXX: function(e) { // JSで発火するイベントを設定するとその内容を取得できる
        },
        validate: function(data) { // カスタムバリデーションを作成できる
          return true; // booleanを返す用にする(判定側はbooleanで判定してしまう)
        },
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
        type: 'select'
      },
      'list',
      'multiple'
    ]
  },
  view: {
    layout: '',
    search: {
      title: 'ユーザ検索をする',
      action: 'GET:/search/user/:_id',
      input: {
        _id: {
          type: 'text'
        }
      }
    },
    // テープル表示させるときに配列で表示順番を決める
    table: {
      title: 'ユーザのテーブル情報', // キャプションの設定
      // ボタングループ
      btnGroup: [
        {
          type: 'add', // 入力タイプ
          layout: 'left' // テーブルの配置場所
        },
        {
          type: 'delete', // 削除タイプ
          layout: 'rigth' // テーブルの配置場所
        }
      ],
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
