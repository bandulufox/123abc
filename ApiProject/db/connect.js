const mysql = require('mysql2');

const connection = mysql.createConnection(
    {
        host: 'localhost',
        user: 'user001', // change this to match the user you are using to test on your machine
        password: 'test', // change this to match the user password you are using to test on your machine
        database: 'mappingtool'
    }
);

connection.connect((err) => 
    {
        if (err) 
        {
            console.error('Error connecting to the database:', err.stack);
            return;
        }
        console.log('Connected to the database with threadId:', connection.threadId);
    }
);

  // Perform a query
  connection.query('SELECT * FROM projects', (err, results, fields) => {
    if (err) {
      console.error('Error executing query:', err);
      return;
    }

    // Log the results
    console.log('Query results:', results);
});
  

connection.end((err) => {
    if (err) {
      return console.log('Error ending the connection:', err.stack);
    }
    console.log('Disconnected from the database.');
  });


module.exports = connection;