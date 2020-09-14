/* 
**created by Agampreet Singh aka artisticGeek
** LinkedIn: https://www.linkedin.com/in/agampreet-singh-arora/
** website: www.agampreetsingh.com
** github: www.github.com/agampreetsingh
*/
const route =require('express').Router();

 route.use('/vendors', require('./vendors'));
 
 route.use('/cart', require('./cart'));
 
 route.use('/products', require('./products'));
 route.use('/user', require('./user'));
route.use('/', (request, response) => {
  response.status(404).send('Inside Index.js')
})

module.exports = route
