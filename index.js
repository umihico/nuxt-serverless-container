// https://stackoverflow.com/questions/38296667/getting-unexpected-token-export
// {
//     "errorType": "Runtime.UserCodeSyntaxError",
//     "errorMessage": "SyntaxError: Unexpected token 'export'",
//     "stack": [
//         "Runtime.UserCodeSyntaxError: SyntaxError: Unexpected token 'export'",
//         "    at _loadUserApp (/var/runtime/UserFunction.js:98:13)",
//     ]
// }
require = require('esm')(module)


const sls = require('serverless-http');
const binaryMimeTypes = require('./binaryMimeTypes');
const nuxt = require('./nuxt');

module.exports.handler = sls(nuxt, {
  binary: binaryMimeTypes,
});
