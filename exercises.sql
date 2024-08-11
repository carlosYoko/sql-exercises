select NOMBRE, APELLIDOS from empleados e where salario > 1350; 

-- e29
select NOMBRE, APELLIDOS, F_NACIMIENTO from empleados e where salario > 1350;

select NOMBRE, APELLIDOS, F_NACIMIENTO from empleados e where salario >= 1350 and salario <= 1450;
-- equivalente con operador between
select NOMBRE, APELLIDOS, F_NACIMIENTO from empleados e where salario between 1350 and 1450;

-- e34
select nombre, apellidos from empleados e  where salario < 1350;

select nombre from personas p  where rubia = 'S' and alta = 's';

select * from empleados e where ID_EMPLEADO = 1 or ID_EMPLEADO  = 2 or ID_EMPLEADO = 4;
-- equivalente con el operador IN
select * from empleados e where ID_EMPLEADO in (1,2,4);

-- e1.57
select * from personas p where ALTA = 'S' or (RUBIA = 'S' and GAFAS = 'S');

-- e.2.57
select * from empleados e where SEXO = 'M' and SALARIO > 1300;

-- e.3.58
select  * from personas p where GAFAS = 'S' and RUBIA = 'N' and ALTA = 'N'

