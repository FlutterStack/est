var mysql = require('mysql');
const dbConfig = require('./dbconfig');
dbInfo = {
    host: dbConfig.HOST,
    user: dbConfig.USER,
    password: dbConfig.PASSWORD,
    database: dbConfig.DB,
    port: dbConfig.PORT
}

var dbcon = mysql.createPool(
    dbInfo
);
module.exports = dbcon;