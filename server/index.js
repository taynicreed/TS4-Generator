// server/index.js

// dependencies
var express = require('express');
var bodyParser = require('body-parser');
var app = express();
PORT = 7777;

var db = require('../database/db_connection')

app.use(express.json());
app.use(bodyParser.urlencoded({ extended: true }));

/* 
  Routes
*/

app.get('/rules', (req, res) => {
  // Define our queries
  query1 = 'SELECT * FROM Rules;'
  
  db.con.query(query1, function(err, results, fields){
    res.send(results)
  });
});

app.get('/rules', (req, res) => {
  // Define our queries
  query1 = 'SELECT * FROM Packs;'
  
  db.con.query(query1, function(err, results, fields){
    res.send(results)
  });
});
  

  app.listen(PORT, function(){
    console.log('Express started on http://localhost:' + PORT + '; press Ctrl-C to terminate.')
});

