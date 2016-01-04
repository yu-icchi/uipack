var webpack = require('webpack');
var ProvidePlugin = webpack.ProvidePlugin;

module.exports = {
  entry: './lib/uipack.js',
  output: {
    path: __dirname + '/public',
    filename: 'uipack.js'
  },
  plugins: [
    new ProvidePlugin({
      riot: 'riot'
    })
  ],
  module: {
    preLoaders: [
      {test: /\.tag$/, exclude: /node_modules/, loader: 'riotjs-loader', query: {type: 'none'}}
    ]
  },
  devServer: {
    contentBase: './public'
  }
};
