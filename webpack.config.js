const path = require('path')

module.exports = {
    entry:{
        index: "./src/Index.bs.js"
    },
    output: {
        path: path.resolve(__dirname, './dist'),
        filename: 'bundle.js'
    }
}