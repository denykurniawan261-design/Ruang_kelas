const mysql = require('mysql2/promise');
const fs = require('fs');
require('dotenv').config();
(async ()=>{
  try {
    const sql = fs.readFileSync('db/schema.sql', 'utf8');
    const conn = await mysql.createConnection({
      host: process.env.DB_HOST || 'localhost',
      port: Number(process.env.DB_PORT || 3306),
      user: process.env.DB_USER || 'root',
      password: process.env.DB_PASSWORD || '',
      multipleStatements: true,
      connectTimeout: 10000
    });
    console.log('Connected to MySQL, applying schema...');
    await conn.query(sql);
    console.log('Schema applied (or already exists).');
    await conn.end();
    process.exit(0);
  } catch (err) {
    console.error('SCHEMA_ERROR', err && err.code, err && err.message);
    process.exit(1);
  }
})();
