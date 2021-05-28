const path = require('path')
const BomPlugin = require('webpack-utf8-bom');

module.exports = {
    entry:{
        index: "./src/Index.bs.js"
    },
    output: {
        path: path.resolve(__dirname, './dist'),
        filename: 'bundle.js'
    },
    plugins: [
        new BomPlugin(true)
    ]
}