/*

log in to MySQL: /usr/local/mysql/bin/mysql -u root -p
select database: \u simsdb

import sql files (locally, not while logged in to db): 
/usr/local/mysql/bin/mysql -u root -p simsdb < FILENAME.sql         

*/
require('dotenv').config()
const mysql = require('mysql2');

var con = mysql.createConnection({
  host: "localhost",
  user: process.env.DB_USER,
  password: process.env.DB_PASSWORD,
  database: process.env.DB
});

con.connect(function(err) {
  if (err) throw err;
  console.log("Connected!");
});

module.exports.con = con;