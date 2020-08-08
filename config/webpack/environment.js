const { environment } = require('@rails/webpacker')

const webpack = require("webpack")

// to enable javascript - jquery and popper extensions
environment.plugins.append("Provide", new webpack.ProvidePlugin({
    $: 'jquery',
    jQuery: 'jquery',
    Popper: ['popper.js', 'default']
}))

module.exports = environment
