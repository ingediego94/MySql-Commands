import mysql from 'mysql2';

const db = mysql.createConnection({
    host: 'localhost',
    user: 'root',
    password: 'Qwe.123*',
    database: 'riwi'
});

db.connect(err =>{
    if (err){
        console.log('Error al conectar mysql', err);
        return;
    }
    console.log("Conectado a la BD"); 
});


export default db;