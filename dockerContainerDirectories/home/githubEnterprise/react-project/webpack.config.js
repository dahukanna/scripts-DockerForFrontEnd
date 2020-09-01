var path = require('path');
var ExtractTextPlugin = require('extract-text-webpack-plugin');
var sasslintPlugin = require('sasslint-webpack-plugin');
var ExtractCSS = new ExtractTextPlugin('main.css');
var precss = require('precss');
var autoprefixer = require('autoprefixer');
const webpack = require('webpack')
// gives us a global constant which is configured at compile time.
// allows different behavior between development builds and release builds [plugins]
const __PROD__ = (process.env.NODE_ENV === 'production');
console.log("production: " +__PROD__);

//uglify plugin [plugins]
const uglify = new webpack.optimize.UglifyJsPlugin({
  sourceMap: true,
  compress: {
    warnings: false,
    unused: true,
    dead_code: true,
    drop_console: false,
  },
  output: {
    comments: false,
  }
});

const env = new webpack.DefinePlugin({
  'process.env':{
    'NODE_ENV': JSON.stringify('production')
  }
});

const sasslint = new sasslintPlugin();

var config = {
  context: path.join(__dirname, 'src'),
  entry: [
    './index.js',
  ],
  output: {
    path: path.join(__dirname, 'dist'),
    filename: 'bundle.js',
  },
  devtool: 'source-map',
  module: {
    preLoaders: [
      {
        test: /\.js$/,
        exclude: /node_modules/,
        loader: 'eslint-loader'
      },
    ],
    loaders: [
      {
        test: /\.js$/,
        exclude: /node_modules/,
        loaders: ['babel'],
      },
      {
        test: /\.scss$/,
        loader: ExtractTextPlugin.extract(
          'style', // The backup style loader
          'css?sourceMap!sass?sourceMap'
        )
      },
      {
        test: /\.(eot|svg|ttf|woff|woff2)$/,
        loader: 'file?name=fonts/[name].[ext]',
        exclude: /img/,
      },
      {
        test: /\.(png|jpg|svg)$/,
        loader: 'file?name=[path][name].[ext]'
      }

    ],
  },
  resolveLoader: {
    root: [
      path.join(__dirname, 'node_modules'),
    ],
  },
  resolve: {
    root: [
      path.join(__dirname, 'node_modules'),
    ],
  },
    eslint: {
    configFile: './.eslintrc'
  },
  postcss: function () {
    return {
      defaults: [precss, autoprefixer],
      cleaner:  [autoprefixer({ browsers: [] })]
    };
  },
  plugins: __PROD__ ? [uglify, env, ExtractCSS, sasslint] : [ExtractCSS, sasslint],
};

module.exports = config;
