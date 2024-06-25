drop database  dbDetran;

create database dbDetran;

use dbDetran;

create table tbRegiao(
    idRegiao int not null auto_increment,
    cep char(9),
    cidade varchar(20),
    bairro varchar(20),
    rua varchar(20),
    estado char(2),
    primary key (idRegiao)
);

create table tbFuncionarios(
    idFunc int not null auto_increment,
    nome varchar(40),
    email varchar(40),
    cpf char(11) not null unique,
    telefoneCelular char(11),
    idRegiao int, 
    primary key (idFunc),
    foreign key (idRegiao) references tbRegiao(idRegiao)
);

desc tbRegiao;
desc tbFuncionarios;

insert into tbRegiao (cep, cidade, bairro, rua, estado)
    values(10398098, 'Sao Paulo', 'Campo Grande', 'Rua das Gracas', 'SP');

insert into tbRegiao (cep, cidade, bairro, rua, estado)
    values(028487017, 'Sao Paulo', 'Cidade Dutra', 'Rua Rei do Valle', 'SP');

insert into tbRegiao (cep, cidade, bairro, rua, estado)
    values(03848749, 'Itapecerica Da Serra', 'Valo Velho', 'Estrada Flamingo', 'SP');      

insert into tbRegiao (cep, cidade, bairro, rua, estado)
    values(03873217, 'Taboao Da Serra', 'Vila Aisi', 'Avenida Campinas', 'SP');

insert into tbRegiao (cep, cidade, bairro, rua, estado)
    values(02747026, 'Embu Das Artes', 'Centro', 'Rua Guacuri', 'SP');    

insert into tbFuncionarios (nome, email, cpf, telefoneCelular, idRegiao) 
    values('franthesco', 'franthesco@gmail.com', 12345727587, 11954350392, 1);

insert into tbFuncionarios (nome, email, cpf, telefoneCelular, idRegiao) 
    values('rodrigo', 'rodlsa@gmail.com', 94239201685, 11965422617, 2);

insert into tbFuncionarios (nome, email, cpf, telefoneCelular, idRegiao) 
    values('nilson', 'noslin@gmail.com', 63202810712, 11933730424, 3);

insert into tbFuncionarios (nome, email, cpf, telefoneCelular, idRegiao) 
    values('fernanda', 'ferdinandi@hotmail.com', 54792501282, 11922780134, 4);

insert into tbFuncionarios (nome, email, cpf, telefoneCelular, idRegiao) 
    values('mauricio', 'mauralbuquerqui@yahoo.com', 93801771901, 11915270140, 5);    


select * from tbRegiao;
select * from tbFuncionarios;
    

update tbFuncionarios
 set nome = 'tonhao', email = 'tonhaodopeixe@yahoo.com', cpf = '92703801691', telefoneCelular = '11973670165' 
where idRegiao = 4;



select * from tbFuncionarios;

