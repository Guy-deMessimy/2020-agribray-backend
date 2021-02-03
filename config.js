const mysql = require('mysql2/promise');
require('dotenv').config()

const { 
    DB_HOST, 
    DB_PASS, 
    DB_USER, 
    DB_DATABASE, 
    BACKEND_PORT,
    JWT_SALTROUNDS,
    JWT_SECRET, 
} = process.env

const connection = mysql.createPool({
    connectionLimit: 10,
    host: DB_HOST,
    user: DB_USER,
    database: DB_DATABASE,
    password: DB_PASS
});

module.exports = {
    db: connection,
    backPort: BACKEND_PORT,
    jwt_rounds: parseInt(JWT_SALTROUNDS),
    jwt_secret: JWT_SECRET,
}