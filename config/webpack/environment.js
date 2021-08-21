const { environment } = require('@rails/webpacker')
const path = require('path')
const erb = require('./loaders/erb')

environment.config.merge({
  resolve: {
    alias: {
      '@': path.resolve(__dirname, '..', '..', 'app/assets/javascripts'),
      '~': path.resolve(__dirname, '..', '..', 'app'),
    }
  }
})

environment.loaders.prepend('erb', erb)

module.exports = environment
