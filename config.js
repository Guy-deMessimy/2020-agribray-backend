const mysql = require('mysql2');
require('dotenv').config()
const { DB_HOST, DB_PASS, DB_USER, DB_DATABASE } = process.env

const connection = mysql.createPool({
    host: DB_HOST,
    user: DB_USER,
    database: DB_DATABASE,
    password: DB_PASS
});

module.exports = {
    db: connection
}