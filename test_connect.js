const mysql = require('mysql2/promise');
require('dotenv').config();
(async ()=>{
  try {
    const db = await mysql.createConnection({
      host: process.env.DB_HOST || 'localhost',
      port: Number(process.env.DB_PORT || 3306),
      user: process.env.DB_USER || 'root',
      password: process.env.DB_PASSWORD || '',
      database: process.env.DB_NAME || 'kampus_db',
      connectTimeout: 5000
    });
    const [rows] = await db.query('SELECT 1 AS ok');
    console.log('CONNECT_OK', rows);
    await db.end();
  } catch (err) {
    console.error('CONNECT_ERROR', err && err.code, err && err.fatal, err && err.message);
    process.exit(1);
  }
})();
