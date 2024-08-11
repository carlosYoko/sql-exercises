select NOMBRE, APELLIDOS from empleados e where salario > 1350; 

-- e29
select NOMBRE, APELLIDOS, F_NACIMIENTO from empleados e where salario > 1350;

select NOMBRE, APELLIDOS, F_NACIMIENTO from empleados e where salario >= 1350 and salario <= 1450;
-- equivalente con operador between
select NOMBRE, APELLIDOS, F_NACIMIENTO from empleados e where salario between 1350 and 1450;
