const express = require('express');
const cors = require('cors');
const connection = require('./db');

const app = express();
const port = 3000;

app.use(cors());
app.use(express.json());

app.get('/clientes', (req, res) => {
    connection.query('SELECT * FROM clientes;', (err, results) => {
        if (err) {
            res.status(500).send('Error database');
            return;
        }
        res.json(results);
    });
})

app.listen(port, () => {
    console.log(`Servidor escuchando en el puerto ${port}`);
})


app.post('/login', (req, res) => {

}) 