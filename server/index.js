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

// Get data for rules table
app.get('/rules', (req, res) => {
  query1 = 'SELECT * FROM Rules;'
  
  db.con.query(query1, function(err, results, fields){
    res.send(results)
  });
});

// get data for packs
app.get('/packs', (req, res) => {
  query1 = 'SELECT * FROM Packs;'
  
  db.con.query(query1, function(err, results, fields){
    res.send(results)
  });
});

// update selected packs
app.put('/packOptions', (req, res) => {
  const packsToUpdate = req.body;

  const updateQueries = packsToUpdate.map(pack => {
    const query = `UPDATE Packs SET selected = ${pack.selected} WHERE packID = '${pack.packID}'`;
    return query;
  });

  const executeUpdateQuery = (query) => {
    return new Promise((resolve, reject) => {
      db.con.query(query, function(err, results, fields) {
        if (err) {
          reject(err);
        } else {
          resolve(results);
        }
      });
    });
  };

  const executeAllUpdateQueries = async () => {
    try {
      const results = [];
      for (const query of updateQueries) {
        const result = await executeUpdateQuery(query);
        results.push(result);
      }
      return results;
    } catch (err) {
      throw err;
    }
  };

  executeAllUpdateQueries()
    .then(results => {
      res.send(results);
    })
    .catch(err => {
      console.error(err);
      res.status(500).send(err);
    });
});

app.listen(PORT, function(){
  console.log('Express started on http://localhost:' + PORT + '; press Ctrl-C to terminate.')
});

