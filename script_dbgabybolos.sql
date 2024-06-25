-- apagando banco de dados 
drop database dbgabybolos;

-- criando banco de dados
create database dbgabybolos;

-- acessar o banco de dados 
use dbgabybolos;

--visualizando as tabelas do banco de dados
show tables;

--criando tabelas 

create table tbFuncionarios(
codfunc int,
nome varchar (100),
email varchar (100),
telefone char (9),
);

show tables;

desc tbFuncionarios;  