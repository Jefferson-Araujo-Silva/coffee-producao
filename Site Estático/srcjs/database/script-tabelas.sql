
create database HEALT_TECH;

use HEALT_TECH;

-- CRIANDO A TABELA DE CADASTRO
create table CLIENTE(
idCliente int primary key auto_increment,
nome varchar(45),
email varchar(45),
senha varchar(45),
constraint chkemail check (email like '%@%')
)auto_increment=100;

select * from CLIENTE;
select * from PLANTAÇAO;
select * from SENSOR;
select * from dados;
;

-- INSERINDO DADOS
insert into CLIENTE (nome, email, senha) values
('Isaias Lopes','Isaias.resende@sptech.school','isaias34'),
('Lucas Bonfim','lucas.bsilva@sptech.school','lucas123'),
('Yago Maragno','yago.maragno@sptech.school','magma1'),
('Jefferson Araujo','jefferson.araujo@sptech.school','jeff13');

-- CRIANDO TABELA PLANTAÇÃO
create table PLANTACAO(
idPlantacao int auto_increment,
especie varchar(45),
estado char(2),
cidade varchar(45),
medida varchar(45),
tamanho int,
fkCliente int,
foreign key (fkCliente) references CLIENTE (idCliente),
primary key (idPlantacao,fkCliente),
constraint chkmedida check (medida = 'm²')
)auto_increment=10;

-- INSERINDO DADOS 
insert into PLANTACAO values
(null,'Arábica','MG','Carmo de Minas','m²',2, 100),
(null,'Robusta','MT','Juína','m²',3, 101),
(null,'Eugenioides','SP','Joanópolis','m²',10, 102),
(null,'Arábica','MS','Eldorado','m²',1, 103),
(null,'Robusta','SP','Campinas','m²',5, 101),
(null,'Eugenioides','SP','Ribeirão Preto','m²',4, 102);

-- CRIANDO TABELA SENSOR
create table SENSOR(
idSensor int primary key auto_increment,
Tipo varchar (10),
fkPlantacao int,
foreign key (fkPlantacao) references PLANTACAO (idPlantacao)
)auto_increment=500;

-- INSERINDO DADOS
insert into SENSOR values
(null, 'DHT-11',10),
(null,'DHT-11',11),
(null, 'DHT-11', 12),
(null,'DHT-11' , 13),
(null,'DHT-11' , 14),
(null,'DHT-11' , 15);

-- CRIANDO TABELA DADOS
create table DADOS(
idDados int auto_increment,
Temperatura decimal (4,2),
Umidade char (6),
DatasHoras datetime default CURRENT_TIMESTAMP,
fkSensor int,
foreign key (fkSensor) references SENSOR (idSensor),
primary key (idDados,fkSensor)
);

insert into DADOS (Temperatura, Umidade, fkSensor) values
	(21.5, '10%', 500),
	(20.0, '50%', 501),
	(22.0, '80%', 500),
	(19.5, '20%', 500);
    
select * from CLIENTE join PLANTAÇAO
on idCliente = fkCliente;

select * from CLIENTE join PLANTACAO
on idCliente = fkCliente
join SENSOR on idPlantacao = fkPlantacao
join DADOS on idSensor = fkSensor;

