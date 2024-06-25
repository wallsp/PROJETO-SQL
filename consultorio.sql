drop database dbConsultorio;

create database dbConsultorio;

use dbConsultorio;

create table tbMedicos (
idMedico int not null auto_increment,
nome varchar(100),
telefone char(9) unique,
primary key(idMedico)
);

create table tbPacientes(
idPaciente int not null auto_increment,
nome varchar (100),
telefone varchar (9) unique,
convenio varchar (100),
primary key (idPaciente)
);

create table tbReceitaMedica(
idReceitaMedica int not null auto_increment,
descricao varchar(500),
primary key (idReceitaMedica)
);

create table tbConsultas(
idConsulta int not null auto_increment,
data datetime,
idMedicos int not null,
idPacientes int not null,
idReceitaMedica int not null,
primary key (idConsulta),
foreign key (idMedicos) references tbMedicos(idMedicos),
foreign key (idPacientes) references tbPacientes(idPacientes),
foreign key (idReceitaMedica) references tbReceitaMedica(idReceitaMedica)
);

desc tbMedicos;
desc tbPacientes;
desc tbReceitaMedica;
desc tbConsultas;