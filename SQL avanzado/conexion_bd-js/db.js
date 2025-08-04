const mysql = require('mysql2');

const connection = mysql.createConnection({
    host: 'localhost',
    user: 'root',
    password: 'KiraAmarilla33%',
    database: 'clientes_login'
});

connection.connect((err)=>{
    if(err){
        console.error('Error database', err);
        return;
    }
    console.log('Conexion extiosa a MYSQL.');
});

module.exports = connection;