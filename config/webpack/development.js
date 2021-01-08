process.env.NODE_ENV = process.env.NODE_ENV || 'development'

const environment = require('./environment')

environment.config.set('devServer.writeToDisk', true)
environment.config.set('devServer.public', process.env.WEBPACKER_PUBLIC || 'localhost')

module.exports = environment.toWebpackConfig()
