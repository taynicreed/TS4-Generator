// server/index.js

var express = require('express');
var app = express();
PORT = 7777;

var db = require('../database/db_connection')

/* 
  Routes
*/

app.post('/game_packs', function(req, res)
    {
        // Define our queries
        query1 = 'SELECT packName FROM Packs WHERE packType="Game";'
        
        db.con.query(query1, function(err, results, fields){
          let base = "<h1>Results:</h1>"
          res.send(base + JSON.stringify(results));
        });
      })
  
  app.listen(PORT, function(){
    console.log('Express started on http://localhost:' + PORT + '; press Ctrl-C to terminate.')
});

