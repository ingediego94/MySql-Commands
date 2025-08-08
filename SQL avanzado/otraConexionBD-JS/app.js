import {cargarCSV} from './employeeService.js';
import db from './db.js';
import express from 'express';
import { uploadCSVBack } from './helpers.js';
const {uploadCSVBack} = require('./helpers.js');


const app = express();
app.use(express.json());

const archivo = 'empleados.csv';

cargarCSV(archivo);


// Metodo POST
app.post('/employee', (req, res) => {
    const datos = req.body;
    const query = `
        INSERT INTO employees(name,lastname,lastname2,email,charge,city,salary,age)
        VALUES (?,?,?,?,?,?,?,?)
    `;

    const valores = [
        datos.name,
        datos.lastname,
        datos.lastname2,
        datos.email,
        datos.charge,
        datos.city,
        datos.salary,
        datos.age
    ];


    db.query(query, valores, (err, result)=>{
        if(err){
            console.error('Error al insertar', err.message);
            return;
        }
        res.status(201).json({
            idEmployee: result.idEmployee
        });
    });
    
});



// Conexion al puerto
app.listen(3000, ()=>{
    console.log("Puerto corriendo");
});


// -----------------------------------------------
// index.js
//endpoint uploadData
app.post('/uploadCSV', (req, res)=>{
    uploadCSVBack();
    console.log("Funciono");
    res.json({result: "db actualizada"});
})