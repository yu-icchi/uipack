var webpack = require('webpack');
var ProvidePlugin = webpack.ProvidePlugin;

module.exports = {
  entry: './lib/uipack.js',
  output: {
    path: __dirname + '/public',
    filename: 'uipack.js',
    library: 'UIPack',
    libraryTarget: 'umd'
  },
  plugins: [
    new ProvidePlugin({
      $: 'jquery',
      jQuery: 'jquery',
      'window.jQuery': 'jquery',
      riot: 'riot'
      // Handlebars: 'handlebars'
    })
  ],
  module: {
    preLoaders: [
      { test: /\.tag$/, exclude: /node_modules/, loader: 'riotjs-loader', query: { type: 'none' } }
    ],
    loaders: [
      { test: /\.js$|\.tag$/, exclude: /node_modules/, loader: 'babel-loader' },
      { test: /\.json$/, exclude: /node_modules/, loader: 'json-loader' },
      { test: /\.html$/, exclude: /node_modules/, loader: 'html-loader' },
      { test: /\.hbs/, exclude: /node_modules/, loader: 'handlebars-template-loader' }
    ]
  },
  devServer: {
    contentBase: './public'
  },
  node: {
    fs: 'empty'
  }
};
