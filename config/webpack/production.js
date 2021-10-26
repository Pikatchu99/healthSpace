process.env.NODE_ENV = process.env.NODE_ENV || 'production'

const environment = require('./environment')
performance: {
    hints: false
};
module.exports = environment.toWebpackConfig()