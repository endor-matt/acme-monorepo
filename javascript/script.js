// script.js

// Using CommonJS syntax (require)
require('minimist'); //require
const cryptiles = require('cryptiles'); //reqiore alias
// const axios = require('./module2/node_modules/axios'); //cross module

// Example: Making a GET request
// axios.get('https://jsonplaceholder.typicode.com/posts/1')
//   .then(response => {
//     // Handle the successful response
//     console.log('Data:', response.data);
//   })
//   .catch(error => {
//     // Handle errors
//     console.error('Error:', error);
//   });

  // Example: Creating a cryptographic hash
  const password = 'mySecretPassword';
  const hashedPassword = cryptiles.hashPassword(password);
  
  console.log('Original Password:', password);
  console.log('Hashed Password:', hashedPassword);
  
  // Example: Verifying a cryptographic hash
  const inputPassword = 'mySecretPassword';
  
  if (cryptiles.verifyHash(inputPassword, hashedPassword)) {
    console.log('Password is correct!');
  } else {
    console.log('Password is incorrect!');
  }
