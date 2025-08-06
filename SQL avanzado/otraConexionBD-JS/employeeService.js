// encargado de leerme el archivo
import fs from 'fs';

// importamos en csv
import csv from 'csv-parser';

// importamos la BD
import db from './db.js';
import { pipeline } from 'stream'; // no usado pero no se, yo no soy nadie para juzgar.

export const cargarCSV = (rutaCSV) => {
    fs.createReadStream(rutaCSV)
    .pipe(csv())    // me recorre una fila y me la parsea
    .on('data', (row) => {          // se activa cada que vamos a procesar una fila)

        const {name, lastname, lastname2, email, charge, city, salary, age} = row;

        const insertQuery = `
            INSERT INTO employees (name, lastname, lastname2, email, charge, city, salary, age) 
            VALUES(?, ?, ?, ?, ?, ?, ?, ?);
        `;

        // Validamos si la información enviada y quedo ok
        db.query(
            insertQuery,
            [name, lastname, lastname2, email, charge, city, salary, age],
            (err, result) => {
                if(err){
                    console.error('error en la inserción', err.message);
                } else{
                    console.log("Inserción de datos correctamente.");
                }
                
            }
        )

    })       

    .on('end', () => {
        console.log("La sesion se ha cerrado exitosamente");
    });
} 