/**
 * Configure your Gatsby site with this file.
 *
 * See: https://www.gatsbyjs.org/docs/gatsby-config/
 */
const path = require('path');
let ghostConfig;
try {
  ghostConfig = require('./ghost.env');
} catch (e) {
  throw new Error("Couldn't find the ghost config file")
}
module.exports = {
  plugins: [{
    resolve: 'gatsby-source-ghost',
    options: ghostConfig.dev
  }],
}
