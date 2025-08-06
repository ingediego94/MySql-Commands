import {cargarCSV} from './employeeService.js';
import db from './db.js';
import express from 'express';

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


app.listen(3000, ()=>{
    console.log("Puerto corriendo");
});