
--  VISTAS O VIEWS

CREATE VIEW nombre_de_la_vista AS
    SELECT nombre, sexo, seccion, cantidad_hijos 
    FROM vista_empleados 
    WHERE cantidadhijos > 0;


-- Vista
CREATE VIEW vista_promedio_superior_a_promedio_general AS
    SELECT
        s.id_student,
        CONCAT(s.name, ' ', s.lastname_1, ' ', s.lastname_2) AS full_name,
        AVG(i.final_grade) AS Average_grade
    FROM inscriptions AS i
    JOIN students AS s
        ON i.id_student = s.id_student
    WHERE i.final_grade > (
            SELECT AVG(final_grade)
            FROM inscriptions
        )
    GROUP BY s.id_student, s.name, s.lastname_1, s.lastname_2;