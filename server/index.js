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
  query = `SELECT Rules.genID, Family.familyDescription, Aspirations.aspName, 
          Careers.careerName, Traits.traitName, Skills.skillName, 
          Misc.miscDescription FROM Rules 
          INNER JOIN Family ON Rules.familyID = Family.familyID 
          INNER JOIN Aspirations ON Rules.aspID = Aspirations.aspID 
          INNER JOIN Careers ON Rules.careerID = Careers.careerID 
          INNER JOIN Traits ON Rules.traitID = Traits.traitID 
          INNER JOIN Skills ON Rules.skillID = Skills.skillID
          INNER JOIN Misc ON Rules.miscID = Misc.miscID;`;
  
  db.con.query(query, function(err, results, fields){
    console.log("rules: ", results);
    res.send(results);
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

// mark rules as unused
app.put('/unusedRules', (req, res) => {
  const rulesToUpdate = req.body;
  //figure out how to map through rulesToUpdate and update each rule
  // Family
  // Aspirations
  // Careers
  // Traits
  // Skills
  // Misc
  
});

// overwrite PrevRules with Rules
app.put('/overwritePrevRules', (req, res) => {
  const query = `UPDATE PrevRules 
    INNER JOIN Rules ON PrevRules.genID = Rules.genID
    SET
      PrevRules.familyID = Rules.familyID,
      PrevRules.aspID = Rules.aspID,
      PrevRules.careerID = Rules.careerID,
      PrevRules.traitID = Rules.traitID,
      PrevRules.skillID = Rules.skillID,
      PrevRules.miscID = Rules.miscID;`;
  
  db.con.query(query, function(err, results, fields){
    console.log("update: ", results);
    res.send(results);
  });
});


app.listen(PORT, function(){
  console.log('Express started on http://localhost:' + PORT + '; press Ctrl-C to terminate.')
});

