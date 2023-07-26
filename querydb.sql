create database empleados_go; 
use empleados_go;



CREATE TABLE IF NOT EXISTS pais (
  codPais varchar(3) PRIMARY KEY,
  nombrePais varchar(50) NOT NULL
);


CREATE TABLE IF NOT EXISTS ciudad (
  codCiudad varchar(5) PRIMARY KEY,
  nombreCiudad varchar(50) NOT NULL,
  codPais varchar(3),
  FOREIGN KEY (codPais) REFERENCES pais (codPais)
);


CREATE TABLE IF NOT EXISTS departamentos (
  codDepto varchar(4) PRIMARY KEY,
  nombreDpto varchar(20) NOT NULL,
  codCiudad varchar(5),
  codDirector varchar(12),
  FOREIGN KEY (codCiudad) REFERENCES ciudad (codCiudad),
  FOREIGN KEY (codDirector) REFERENCES empleados (nDIEmp)
);


CREATE TABLE IF NOT EXISTS empleados (
  nDIEmp varchar(12) PRIMARY KEY,
  nomEmp varchar(30) NOT NULL,
  sexEmp char(1) NOT NULL,
  fecNac date NOT NULL,
  fecIncorporacion date NOT NULL,
  salEmp float NOT NULL,
  comisionE float NOT NULL,
  cargoE varchar(15) NOT NULL,
  jefeID varchar(12),
  codDepto varchar(4),
  FOREIGN KEY (jefeID) REFERENCES empleados (nDIEmp),
  FOREIGN KEY (codDepto) REFERENCES departamentos (codDepto)
);


CREATE TABLE IF NOT EXISTS directores (
  codDepto varchar(4),
  codDirector varchar(12),
  FOREIGN KEY (codDepto) REFERENCES departamentos (codDepto),
  FOREIGN KEY (codDirector) REFERENCES empleados (nDIEmp),
  PRIMARY KEY (codDepto, codDirector)
);


INSERT INTO pais (codPais, nombrePais) VALUES
('ES', 'España'),
('CO', 'Colombia'),
('AR', 'Argentina'),

;


INSERT INTO ciudad (codCiudad, nombreCiudad, codPais) VALUES
('CR001', 'CIUDAD REAL', 'ES'),
('BCN01', 'BARCELONA', 'ES'),
('VLC01', 'VALENCIA', 'ES'),
('MAD01', 'MADRID', 'ES'),

;


INSERT INTO departamentos (codDepto, nombreDpto, codCiudad, codDirector) VALUES
('1000', 'GERENCIA', 'CR001', '31.840.269'),
('1500', 'PRODUCCIÓN', 'CR001', '16.211.383'),
('2000', 'VENTAS', 'CR001', '31.178.144'),
('2100', 'VENTAS', 'BCN01', '16.211.383'),
('2200', 'VENTAS', 'VLC01', '16.211.383'),
('2300', 'VENTAS', 'MAD01', '16.759.060'),
('3000', 'INVESTIGACIÓN', 'CR001', '16.759.060'),
('3500', 'MERCADEO', 'CR001', '22.222.222'),
('4000', 'MANTENIMIENTO', 'CR001', '333.333.333'),
('4100', 'MANTENIMIENTO', 'BCN01', '16.759.060'),
('4200', 'MANTENIMIENTO', 'VLC01', '16.759.060'),
('4300', 'MANTENIMIENTO', 'MAD01', '16.759.060'),

;


INSERT INTO empleados (nDIEmp, nomEmp, sexEmp, fecNac, fecIncorporacion, salEmp, comisionE, cargoE, jefeID, codDepto) VALUES
('1.130.222', 'José Giraldo', 'M', '1985-01-20', '2000-11-01', 1200000, 400000, 'Asesor', '22.222.222', '3500'),
('1.130.333', 'Pedro Blanco', 'M', '1987-10-28', '2000-10-01', 800000, 3000000, 'Vendedor', '31.178.144', '2000'),

('333.333.337', 'Edith Muñoz', 'F', '1992-03-31', '2000-10-01', 800000, 3600000, 'Vendedor', '31.178.144', '2100'),
('444.444', 'Abel Gómez', 'M', '1939-12-24', '2000-10-01', 1050000, 200000, 'Mecánico', '333.333.333', '4300'),
('737.689', 'Mario Llano', 'M', '1945-08-30', '1990-05-16', 2250000, 2500000, 'Vendedor', '31.178.144', '2300'),
('768.782', 'Joaquín Rosas', 'M', '1947-07-07', '1990-05-16', 2250000, 2500000, 'Vendedor', '31.178.144', '2200'),
('888.888', 'Iván Duarte', 'M', '1955-08-12', '1998-05-16', 1050000, 200000, 'Mecánico', '333.333.333', '4100');


INSERT INTO directores (codDepto, codDirector) VALUES
('1000', '31.840.269'),
('1500', '16.211.383'),
('2000', '31.178.144'),
('2100', '16.211.383'),
('2200', '16.211.383'),
('2300', '16.759.060'),
('3000', '16.759.060'),
('3500', '22.222.222'),
('4000', '333.333.333');

