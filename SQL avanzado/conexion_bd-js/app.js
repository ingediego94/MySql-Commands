import mysql from 'mysql2';
import express from 'express';
import cors from 'cors';

const app = express();

app.use(cors());

const connection = mysql.createConnection({
    host: 'localhost',
    user: 'root',
    password: '',   // Contrasena de la BD (si tiene)
    database:'clientes_login'   // nombre de la BD
});

connection.connect(
    (error) => {
        if (error) throw error;
        console.log('Conectado correctamente');
    }
)

app.get('/clientes', (request, response) => {
    
    connection.query('SELECT * FROM clientes', (error, result) => {

        response.json(result);

    });

})





app.post('clientes/:id', (request, response)=>{
    const id = request.params.id;
    // request.body ????
    // bcrypt
    connection.query('SELECT * FROM clientes WHERE id= ?', [id], (error, result) => {
        if(error) throw error;

        response.json(result);
    });
})

app.post('/login', (req, res) => {

}) 


app.listen(3001, (error) => {
    if (error) throw error;

    console.log('Api corriendo en el puerto 3001');
})