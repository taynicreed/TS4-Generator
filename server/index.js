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
        return;
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
  const gensToUpdate = req.body;
  const genValues = gensToUpdate.join(',');

  const familyQuery = `UPDATE Family INNER JOIN PrevRules
    ON Family.familyID = PrevRules.familyID SET Family.used = 0 
    WHERE PrevRules.genID IN (${genValues});`;

  const aspQuery = `UPDATE Aspirations INNER JOIN PrevRules
    ON Aspirations.aspID = PrevRules.aspID SET Aspirations.used = 0
    WHERE PrevRules.genID IN (${genValues});`;

  const careerQuery = `UPDATE Careers INNER JOIN PrevRules
    ON Careers.careerID = PrevRules.careerID SET Careers.used = 0
    WHERE PrevRules.genID IN (${genValues});`;

  const traitQuery = `UPDATE Traits INNER JOIN PrevRules
    ON Traits.traitID = PrevRules.traitID SET Traits.used = 0
    WHERE PrevRules.genID IN (${genValues});`;

  const skillQuery = `UPDATE Skills INNER JOIN PrevRules
    ON Skills.skillID = PrevRules.skillID SET Skills.used = 0
    WHERE PrevRules.genID IN (${genValues});`;

  const miscQuery = `UPDATE Misc INNER JOIN PrevRules
    ON Misc.miscID = PrevRules.miscID SET Misc.used = 0
    WHERE PrevRules.genID IN (${genValues});`;
  
  const queries = [familyQuery, aspQuery, careerQuery, traitQuery, skillQuery, miscQuery];

  const executeAllQueries = () => {
    const promises = queries.map(query => {
      return new Promise((resolve, reject) => {
        db.con.query(query, function(err, results, fields) {
          if (err) {
            reject(err);
          } else {
            resolve(results);
          }
        });
      });
    });
  
    return Promise.all(promises);
  };
  
  executeAllQueries()
    .then(results => {
      res.send(results);
    })
    .catch(err => {
      console.error(err);
      res.status(500).send(err);
    });
});


// overwrite PrevRules with Rules
app.put('/overwritePrevRules', (req, res) => {
  const gensToUpdate = req.body;
  const genValues = gensToUpdate.join(',');

  const query = `UPDATE PrevRules 
    INNER JOIN Rules ON PrevRules.genID = Rules.genID
    SET
      PrevRules.familyID = Rules.familyID,
      PrevRules.aspID = Rules.aspID,
      PrevRules.careerID = Rules.careerID,
      PrevRules.traitID = Rules.traitID,
      PrevRules.skillID = Rules.skillID,
      PrevRules.miscID = Rules.miscID
    WHERE PrevRules.genID IN (${genValues});`;
  
  db.con.query(query, function(err, results, fields){
    if (err) {
      console.log("Error update generations: ", err);
      res.status(500).send("Error updating generations");
    } else {
      console.log("Generations updated: ", results);
      res.send(results);
    }
    return;
  });
});

app.put('/generateRules', (req, res) => {
  const gensToUpdate = req.body;
  const genValues = gensToUpdate.join(',');

  const familyQuery = `UPDATE Rules SET familyID = (SELECT familyID FROM Family WHERE Family.used = 0 
    AND Family.packID IN (SELECT packID FROM Packs WHERE selected = 1) 
    ORDER BY RAND() LIMIT 1)
    WHERE genID IN (${genValues});`

  const familyUsed = `UPDATE Family SET used = 1 WHERE familyID IN (SELECT familyID FROM Rules WHERE genID IN (${genValues}));`
  
  const aspQuery = `UPDATE Rules SET aspID = (SELECT aspID FROM Aspirations WHERE Aspirations.used = 0
    AND Aspirations.packID IN (SELECT packID FROM Packs WHERE selected = 1)
    ORDER BY RAND() LIMIT 1)
    WHERE genID IN (${genValues});`

  const aspUsed = `UPDATE Aspirations SET used = 1 WHERE aspID IN (SELECT aspID FROM Rules WHERE genID IN (${genValues}));`

  const careerQuery = `UPDATE Rules SET careerID = (SELECT careerID FROM Careers WHERE Careers.used = 0
    AND Careers.packID IN (SELECT packID FROM Packs WHERE selected = 1)
    ORDER BY RAND() LIMIT 1)
    WHERE genID IN (${genValues});`

  const careerUsed = `UPDATE Careers SET used = 1 WHERE careerID IN (SELECT careerID FROM Rules WHERE genID IN (${genValues}));`

  const traitQuery = `UPDATE Rules SET traitID = (SELECT traitID FROM Traits WHERE Traits.used = 0
    AND Traits.packID IN (SELECT packID FROM Packs WHERE selected = 1)
    ORDER BY RAND() LIMIT 1)
    WHERE genID IN (${genValues});`

  const traitUsed = `UPDATE Traits SET used = 1 WHERE traitID IN (SELECT traitID FROM Rules WHERE genID IN (${genValues}));`

  const skillQuery = `UPDATE Rules SET skillID = (SELECT skillID FROM Skills WHERE Skills.used = 0
    AND Skills.packID IN (SELECT packID FROM Packs WHERE selected = 1)
    ORDER BY RAND() LIMIT 1)
    WHERE genID IN (${genValues});`

  const skillUsed = `UPDATE Skills SET used = 1 WHERE skillID IN (SELECT skillID FROM Rules WHERE genID IN (${genValues}));`

  const miscQuery = `UPDATE Rules SET miscID = (SELECT miscID FROM Misc WHERE Misc.used = 0
    AND Misc.packID IN (SELECT packID FROM Packs WHERE selected = 1)
    ORDER BY RAND() LIMIT 1)
    WHERE genID IN (${genValues});`

  const miscUsed = `UPDATE Misc SET used = 1 WHERE miscID IN (SELECT miscID FROM Rules WHERE genID IN (${genValues}));`

  const queries = [familyQuery, familyUsed, aspQuery, aspUsed, careerQuery, careerUsed, traitQuery, traitUsed, skillQuery, skillUsed, miscQuery, miscUsed];

  const executeAllQueries = () => {
    const promises = queries.map(query => {
      return new Promise((resolve, reject) => {
        db.con.query(query, function(err, results, fields) {
          if (err) {
            reject(err);
          } else {
            resolve(results);
          }
        });
      });
    });
  
    return Promise.all(promises);
  };
  
  executeAllQueries()
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

