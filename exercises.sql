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

select sum(salario) from empleados;

select count(*) from empleados e;

-- Funciones de agregado
select sum(salario) / count(*) as SALARIO_MEDIO from empleados e;
-- equivalente para calcular el svg
select avg(salario) as SALARIO_MEDIO from empleados e;

select max(salario) from empleados e;

-- e1.63
select avg(salario) as SALARIO_MEDIO_HOMBRES from empleados e where SEXO = 'H';

-- e2.63
select max(salario) as SALARIO_MAXIMO, min(salario ) as SALARIO_MINIMO from empleados e;

-- e3.63
select sum(salario) as TOTAL_A_PAGAR from empleados e where SEXO = 'M'; 

select sexo, count(*)as TOTAL_EMPLEADOS from empleados e
group by sexo;

select distinct sexo from empleados e;

-- e1.79
select sexo, max(SALARIO) as Minimo, min(SALARIO) as Maximo, avg(SALARIO) as Promedio
from empleados e
group by sexo;

-- e2.79
select ESPECIE, count(*)
from mascotas m
where ESTADO  = 'B'
group by ESPECIE;

-- e3.79
select UBICACION, especie, count(*) as Total_Ejemplares
from mascotas m 
where ESTADO = 'A'
group by UBICACION, especie;

select Ubicacion, count(*) as total
from mascotas 
where estado = 'A' 
group by UBICACION
having total = 2

-- e.86
select UBICACION, count(*) as Ejemplares 
from mascotas 
where ESTADO = 'A' 
group by UBICACION
having Ejemplares between 2 and 3;

-- e1.101
select * from empleados e
where APELLIDOS like '%calvo%';

-- e2.101
select * from vehiculos v
where ULTI_ITV is null and PROX_ITV between '20110101' and '20111231'

select camisa, pantalon, c.PESO_GR + p.PESO_GR as peso
from camisas c, pantalones p 

select concat('Camisa de ', c.CAMISA, ' con pantalon de ', p.PANTALON, ' y ', c2.CALZADO )
as Muda, c.PESO_GR + p.PESO_GR + c2.PESO_GR  as Peso_Total
from camisas c , pantalones p , calzados c2 

-- e1.120
select p.PANTALON, c.CALZADO from pantalones p , calzados c 

select c.ID_CAMISA , c.CAMISA , c.PESO_GR as Peso_Camisa,
		p.ID_PANTALON , p.PANTALON , p.PESO_GR as Peso_Pantalon
from camisas c , pantalones p 

select count(*) as Combinaciones
from camisas c , pantalones p 

-- e1.129
select avg(c.PESO_GR + p.PESO_GR + c2.PESO_GR) as peso_total
from camisas c , pantalones p , calzados c2 

-- e2.129
select c.CAMISA, avg(c.PESO_GR  + p.PESO_GR) as peso_medio
from camisas c , pantalones p
group by c.CAMISA
having peso_medio > 850

select c.CAMISA , p.PANTALON 
from camisas c , pantalones p
where  c.ID_CAMISA  != p.ID_PANTALON

select concat('Camisa ', c.CAMISA) as prenda
from camisas c 
union all
select concat('Pantalon ', p.PANTALON) 
from  pantalones p
union all
select concat (c2.calzado)
from calzados c2 

-- e1.144
select C.TITULO 
from cursos c , alumnos a , alumnos_cursos ac
where (c.ID_CURSO = ac.ID_CURSO 
and a.ID_ALUMNO  = ac.ID_ALUMNO)
and a.ID_ALUMNO  = 1;

-- e1,2.144
select  a.NOMBRE , a.APELLIDOS, c.TITULO as Curso 
from cursos c , alumnos a , alumnos_cursos ac
where (c.ID_CURSO = ac.ID_CURSO 
and a.ID_ALUMNO  = ac.ID_ALUMNO)
and a.NOMBRE like '%E%';

-- e2.144
select  concat(p.NOMBRE ,' ', p.APELLIDOS) AS NOMBRE_COMPLETO , count(p.NOMBRE) as TOTAL_CURSOS
from profesores p , cursos c 
where p.ID_PROFE = c.ID_PROFE
group by p.NOMBRE , p.APELLIDOS; 

-- e3.144
select c.TITULO, count(ac.ID_ALUMNO) as TOTAL_ALUMNOS
from cursos c , alumnos_cursos ac
where ac.ID_CURSO = c.ID_CURSO
group by C.TITULO

-- e3,2.144
select c.TITULO, count(ac.ID_ALUMNO) as TOTAL_ALUMNOS
from cursos c , alumnos_cursos ac
where  ac.ID_CURSO = c.ID_CURSO
group by C.TITULO
having TOTAL_ALUMNOS = 2;

select c.TITULO as CURSO, count(ac.ID_ALUMNO) as ALUMNOS, COUNT(C.TITULO) as REGISTROS
from alumnos_cursos ac right join cursos c
on ac.ID_CURSO = c.ID_CURSO 
group by c.TITULO 

select A.NOMBRE, a.ID_ALUMNO, count(a.ID_ALUMNO) Total_Cursos
from alumnos a
right join alumnos_cursos ac 
on A.ID_ALUMNO  = AC.ID_ALUMNO 
group by a.NOMBRE , a.ID_ALUMNO 

-- e1.155
select p.NOMBRE, count(c.ID_PROFE) as TOTAL_CURSOS
from  profesores p 
left join cursos c ON p.ID_PROFE = c.ID_PROFE
group by p.NOMBRE

-- e2.155
select c.TITULO, count(a.ID_ALUMNO) as ALMUNOS_MATRICULADOS
from alumnos a join alumnos_cursos ac ON a.ID_ALUMNO = ac.ID_ALUMNO right join cursos c on ac.ID_CURSO = c.ID_CURSO 
group by c.TITULO 

-- e2.155 (variante)
select c.TITULO, a.NOMBRE , a.APELLIDOS 
from cursos c join alumnos_cursos ac on c.ID_CURSO = ac.ID_CURSO join alumnos a on a.ID_ALUMNO = ac.ID_ALUMNO 
group by c.TITULO , a.NOMBRE , a.APELLIDOS 
order by c.TITULO 

