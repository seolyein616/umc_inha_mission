import mysql from "mysql2/promise";
import dotenv from "dotenv";

dotenv.config();

export const pool = mysql.createPool({
  host: process.env.DB_HOST || "localhost", // hostname of mysql
  user: process.env.DB_USER || "root",      // user name
  port: process.env.DB_PORT || 3306,        // port number
  database: process.env.DB_NAME || "umc_mission_04_1", // database name
  password: process.env.DB_PASSWORD || "passward", // password
  waitForConnections: true,                 // When there are no connections available in the pool,
                                            // if true, the request is placed in the queue and the request
                                            // is executed when the connection is available. If false,
                                            // an error is immediately issued and the request is made again.
  connectionLimit: 10,                      // How many connections to have
  queueLimit: 0                             // Limit on the number of requests to wait in the Pool before
                                            // an error occurs in getConnection
});
