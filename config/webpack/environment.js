const { environment } = require('@rails/webpacker')
module.exports = environment

// 星5レビュー機能用
const webpack = require('webpack')

environment.plugins.prepend(
  'Provide',
  new webpack.ProvidePlugin({
    $: 'jquery/src/jquery',
    jQuery: 'jquery/src/jquery',
    Popper: 'popper.js',
    jquery: 'jquery/src/jquery',
  })
  )
