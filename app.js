const express = require('express');
const mysql = require('mysql2');

const app = express();
const port = 4306; // You can use any available port

// Create a connection to your MySQL Docker container
const connection = mysql.createConnection({
    host: 'localhost',
    user: 'root',
    password: '',
    database: 'mysql',
    port: 4306,
});

// Connect to the database
connection.connect((err) => {
    if (err) {
        console.error('Error connecting to MySQL database:', err);
        return;
    }
    console.log('Connected to MySQL database');
});

// Define a route to serve your HTML file
app.get('/', (req, res) => {
    res.sendFile('C:\\xampp\\tomcat\\webapps\\weblogserver\\WebLog\CadastroMotrista\paginaMotorista.html');
});






// Define routes for your API or other functionality
// For example, you can have a route that performs a database query
app.get('/getData', (req, res) => {
    connection.query('SELECT * FROM motoristatb', (err, results, fields) => {
        if (err) {
            console.error('Error executing query:', err);
            return res.status(500).json({ error: 'Internal Server Error' });
        }

        res.json(results);
    });
});

app.get('/create', (req, res) => {
    connection.query('create table t (temp varchar(20)) ', (err, results, fields) => {
        if (err) {
            console.error('Error executing query:', err);
            return res.status(500).json({ error: 'Internal Server Error' });
        }

        res.json(results);
    });

    connection.execute("create table t");
})


app.post('/post', (req, res) => {
    connection.query('INSERT INTO t(temp) values ('123123123')', (err, result, fields) => {
        if (err) {
            console.error('Error executing query:', err);
            return res.status(500).json({ error: 'Internal Server Error' });
        }
    })
})

// Start the server
app.listen(port, () => {
    console.log(Server is listening on port ${ port });
});