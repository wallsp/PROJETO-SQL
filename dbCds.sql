drop database dbCds;

create database dbCds;

use dbCds;

create table tbArtistas(
    codArt int not null auto_increment,
    nomeArt varchar(100) not null,
    primary key(codArt)
); 

create table tbGravadoras(
    codGrav int not null auto_increment,
    nomeGrav varchar(50) not null unique,
    primary key (codGrav)
);

create table tbCategorias(
    codCat int not null auto_increment,
    nomeCat varchar(50) not null unique,
    primary key (codCat)
);

create table tbEstados(
    siglaEst char(2) not null,
    nomeEst varchar(50) not null unique,
    primary key (siglaEst)
);

create table tbFuncionarios(
    codFunc int not null auto_increment,
    nomeFunc varchar(50) not null,
    endFunc varchar(100) not null,
    salFunc decimal(9,2) not null default 0 check (salFunc >= 0),
    sexoFunc char(1) not null default 'F' check (sexoFunc in ('F', 'M')),
    primary key (codFunc)
);

create table tbCidades(
    codCid int not null auto_increment,
    siglaEst char(2) not null,
    nomeCid varchar(50) not null,
    primary key (codCid),
    foreign key (siglaEst) references tbEstados (siglaEst)
);

create table tbClientes(
    codCli int not null auto_increment,
    codCid int not null,
    nomeCli varchar(50) not null,
    endCli varchar(100) not null,
    rendaCli decimal(9,2) not null default 0 check (rendaCli >= 0),
    sexoCli char(1) not null default 'F' check (sexoCli in ('F', 'M')),
    primary key (codCli),
    foreign key (codCid) references tbCidades (codCid)
);

create table tbConjuge (
    codConj int not null auto_increment,
    nomeConj varchar(50) not null,
    rendaConj decimal (9,2) not null default 0 check (rendaConj >= 0),
    sexoConj char(1) not null default 'F' check (sexoConj in ('F', 'M')),
    codCli int not null,
    primary key (codConj),
    foreign key (codCli) references tbClientes(codCli)
);

create table tbDependentes(
    codDep int not null auto_increment,
    codFunc int not null,
    nomeDep varchar(100) not null,
    sexoDep char(1) not null default 'F' check (sexoDep in ('F', 'M')),
    primary key (codDep),
    foreign key (codFunc) references tbFuncionarios (codFunc)
);

create table tbTitulos(
    codTit int not null auto_increment,
    codCat int not null,
    codGrav int not null,
    nomeCd varchar(50) not null unique,
    valCd decimal (9,2) not null check (valCd >= 0) ,
    qtdEstq int not null check (qtdEstq >= 0) ,
    primary key (codTit),
    foreign key (codCat) references tbCategorias (codCat),
    foreign key (codGrav) references tbGravadoras (codGrav) 
);

create table tbPedidos(
    numPed int not null auto_increment,
    codCli int not null,
    codFunc int not null,
    dataPed datetime not null,
    valPed decimal (9,2) not null default 0 check (valPed >= 0),
    primary key (numPed),
    foreign key (codCli) references tbClientes (codCli),
    foreign key (codFunc) references tbFuncionarios (codFunc)
);

create table tbTitulosPedidos(
    numPed int not null,
    codTit int not null,
    qtdCd decimal (9,2) not null check (qtdCd >= 1),
    valCd decimal (9,2) not null check (valCd >= 0),
    foreign key (numPed) references tbPedidos (numPed),
    foreign key (codTit) references tbTitulos (codTit)
);

create table tbTitulosArtistas(
    codTit int not null,
    codArt int not null,
    foreign key (codTit) references tbTitulos (codTit),
    foreign key (codArt) references tbArtistas (codArt) 
);

desc tbArtistas;
desc tbGravadoras;
desc tbCategorias;
desc tbEstados;
desc tbFuncionarios;
desc tbCidades;
desc tbClientes;
desc tbConjuge;
desc tbDependentes;
desc tbTitulos;
desc tbPedidos;
desc tbTitulosPedidos;
desc tbTitulosArtistas;

-- Registros das tabelas 

insert into tbArtistas (nomeArt) values ('Marisa Monte');
insert into tbArtistas (nomeArt) values ('Gilberto Gil ');
insert into tbArtistas (nomeArt) values ('Caetano Veloso');
insert into tbArtistas (nomeArt) values ('Milton Nascimento');
insert into tbArtistas (nomeArt) values ('Legião Urbana');
insert into tbArtistas (nomeArt) values ('The Beatles');
insert into tbArtistas (nomeArt) values ('Rita Lee'); 

insert into tbGravadoras (nomeGrav) values ('PolyGram');
insert into tbGravadoras (nomeGrav) values ('Emi');
insert into tbGravadoras (nomeGrav) values ('Som Livre');
insert into tbGravadoras (nomeGrav) values ('Som Music');

insert into tbCategorias (nomeCat) values ('MPB');
insert into tbCategorias (nomeCat) values ('Trilha Sonora');     
insert into tbCategorias (nomeCat) values ('Rock Internacional');   
insert into tbCategorias (nomeCat) values ('Rock Nacional');

insert into tbEstados (siglaEst,nomeEst) values ('SP','São Paulo');
insert into tbEstados (siglaEst,nomeEst) values ('MG','Minas Gerais');
insert into tbEstados (siglaEst,nomeEst) values ('RJ','Rio De Janeiro');   

insert into tbCidades (siglaEst, nomeCid) values ('SP', 'São Paulo');
insert into tbCidades (siglaEst, nomeCid) values ('SP', 'Sorocaba');
insert into tbCidades (siglaEst, nomeCid) values ('SP', 'Jundiaí');
insert into tbCidades (siglaEst, nomeCid) values ('SP', 'Americana');
insert into tbCidades (siglaEst, nomeCid) values ('SP', 'Araraquara');
insert into tbCidades (siglaEst, nomeCid) values ('MG', 'Ouro Preto');
insert into tbCidades (siglaEst, nomeCid) values ('RJ', 'Rio de Janeiro');

insert into tbClientes (codCid, nomeCli, endCli, rendaCli, sexoCli) values (1, 'Jose Nogueira', 'Rua A', 1500.00, 'M');
insert into tbClientes (codCid, nomeCli, endCli, rendaCli, sexoCli) values (1, 'Angelo Pereira', 'Rua B', 2000.00, 'M');
insert into tbClientes (codCid, nomeCli, endCli, rendaCli, sexoCli) values (1, 'Catarina Souza', 'Rua D', 892.00, 'F');
insert into tbClientes (codCid, nomeCli, endCli, rendaCli, sexoCli) values (2, 'Antenor da Costa', 'Rua F', 1582.00, 'M');
insert into tbClientes (codCid, nomeCli, endCli, rendaCli, sexoCli) values (2, 'Maria Amelia de Souza', 'Rua G', 1152.00, 'F');
insert into tbClientes (codCid, nomeCli, endCli, rendaCli, sexoCli) values (3, 'Fatima Souza', 'Rua I', 1632.00, 'F');
insert into tbClientes (codCid, nomeCli, endCli, rendaCli, sexoCli) values (3, 'Joel Da Rocha', 'Rua J', 2000.00, 'M');
insert into tbClientes (codCid, nomeCli, endCli, rendaCli, sexoCli) values (2, 'Paulo Roberto Silva', 'Rua H', 3250.00, 'M');

insert into tbConjuge (codCli, nomeConj, rendaConj, sexoConj) values (1, 'Carla Nogueira', 2500.00, 'F');
insert into tbConjuge (codCli, nomeConj, rendaConj, sexoConj) values (2, 'Emilia Pereira', 5500.00, 'F');
insert into tbConjuge (codCli, nomeConj, rendaConj, sexoConj) values (6, 'Altiva Da Costa', 3000.00, 'F');
insert into tbConjuge (codCli, nomeConj, rendaConj, sexoConj) values (7, 'Carlos Souza', 3250.00, 'M');

insert into tbFuncionarios (codFunc, nomeFunc, endFunc, salFunc, sexoFunc) values (1, 'Vânia Gabriela Pereira', 'Rua A', 2500.00, 'F');
insert into tbFuncionarios (codFunc, nomeFunc, endFunc, salFunc, sexoFunc) values (2, 'Norberto Pereira Da Silva', 'Rua B', 300.00, 'M');
insert into tbFuncionarios (codFunc, nomeFunc, endFunc, salFunc, sexoFunc) values (3, 'Olavo Linhares', 'Rua C', 580.00, 'M');
insert into tbFuncionarios (codFunc, nomeFunc, endFunc, salFunc, sexoFunc) values (4, 'Paula Da Silva', 'Rua D', 3000.00, 'F');
insert into tbFuncionarios (codFunc, nomeFunc, endFunc, salFunc, sexoFunc) values (5, 'Rolando Rocha', 'Rua E', 2000.00, 'M');

insert into tbDependentes (codDep, codFunc, nomeDep, sexoDep) values (1, 1, 'Ana Pereira', 'F');
insert into tbDependentes (codDep, codFunc, nomeDep, sexoDep) values (2, 1, 'Roberto Pereira', 'M');
insert into tbDependentes (codDep, codFunc, nomeDep, sexoDep) values (3, 1, 'Celso Pereira', 'M');
insert into tbDependentes (codDep, codFunc, nomeDep, sexoDep) values (4, 3, 'Brisa Linhares', 'F');
insert into tbDependentes (codDep, codFunc, nomeDep, sexoDep) values (5, 3, 'Mari Sol Linhares', 'F');
insert into tbDependentes (codDep, codFunc, nomeDep, sexoDep) values (6, 4, 'Sonia Da Silva', 'F');

insert into tbTitulos (codTit, codCat, codGrav, nomeCd, valCd, qtdEstq) values (1,1,1,'Trabalhistas',30.00,1500);
insert into tbTitulos (codTit, codCat, codGrav, nomeCd, valCd, qtdEstq) values (2,1,2,'Tropicalia',50.00,500);
insert into tbTitulos (codTit, codCat, codGrav, nomeCd, valCd, qtdEstq) values (3,1,1,'Aquele Abraço',50.00,600);
insert into tbTitulos (codTit, codCat, codGrav, nomeCd, valCd, qtdEstq) values (4,1,2,'Refazenda',60.00,1000);
insert into tbTitulos (codTit, codCat, codGrav, nomeCd, valCd, qtdEstq) values (5,1,3,'Totalmente Demais',50.00,2000);
insert into tbTitulos (codTit, codCat, codGrav, nomeCd, valCd, qtdEstq) values (6,1,3,'Travessia',55.00,500);
insert into tbTitulos (codTit, codCat, codGrav, nomeCd, valCd, qtdEstq) values (7,1,2,'Courage',30.00,200);
insert into tbTitulos (codTit, codCat, codGrav, nomeCd, valCd, qtdEstq) values (8,4,3,'Legião Urbana',20.00,100);
insert into tbTitulos (codTit, codCat, codGrav, nomeCd, valCd, qtdEstq) values (9,3,2,'The Beatles',30.00,300);
insert into tbTitulos (codTit, codCat, codGrav, nomeCd, valCd, qtdEstq) values (10,4,1,'Rita Lee',30.00,500);

insert into tbPedidos (numPed, codCli, codFunc, dataPed, valPed) values (1,1,2,'2002-05-02',1500.00);
insert into tbPedidos (numPed, codCli, codFunc, dataPed, valPed) values (2,3,4,'2002-05-02',50.00);
insert into tbPedidos (numPed, codCli, codFunc, dataPed, valPed) values (3,4,4,'2002-06-02',100.00);
insert into tbPedidos (numPed, codCli, codFunc, dataPed, valPed) values (4,1,4,'2003-02-02',200.00);
insert into tbPedidos (numPed, codCli, codFunc, dataPed, valPed) values (5,7,5,'2003-03-03',300.00);   
insert into tbPedidos (numPed, codCli, codFunc, dataPed, valPed) values (6,4,4,'2003-03-03',100.00);
insert into tbPedidos (numPed, codCli, codFunc, dataPed, valPed) values (7,5,5,'2003-03-03',50.00);
insert into tbPedidos (numPed, codCli, codFunc, dataPed, valPed) values (8,7,2,'2003-03-03',50.00);
insert into tbPedidos (numPed, codCli, codFunc, dataPed, valPed) values (9,2,2,'2003-03-03',2000.00);
insert into tbPedidos (numPed, codCli, codFunc, dataPed, valPed) values (10,7,1,'2003-03-03',3000.00);

insert into tbTitulosArtistas (codTit, codArt) values (1,1);
insert into tbTitulosArtistas (codTit, codArt) values (2,2);
insert into tbTitulosArtistas (codTit, codArt) values (3,2);
insert into tbTitulosArtistas (codTit, codArt) values (4,2);
insert into tbTitulosArtistas (codTit, codArt) values (5,3);
insert into tbTitulosArtistas (codTit, codArt) values (6,4);
insert into tbTitulosArtistas (codTit, codArt) values (7,4);
insert into tbTitulosArtistas (codTit, codArt) values (8,5);
insert into tbTitulosArtistas (codTit, codArt) values (9,6);
insert into tbTitulosArtistas (codTit, codArt) values (10,7);

insert into tbTitulosPedidos (numPed, codTit, qtdCd, valCd) values (1,1,2,30.00);
insert into tbTitulosPedidos (numPed, codTit, qtdCd, valCd) values (1,2,3,20.00); 
insert into tbTitulosPedidos (numPed, codTit, qtdCd, valCd) values (2,1,1,50.00); 
insert into tbTitulosPedidos (numPed, codTit, qtdCd, valCd) values (2,2,3,30.00); 
insert into tbTitulosPedidos (numPed, codTit, qtdCd, valCd) values (3,1,2,40.00); 
insert into tbTitulosPedidos (numPed, codTit, qtdCd, valCd) values (4,2,3,20.00); 
insert into tbTitulosPedidos (numPed, codTit, qtdCd, valCd) values (5,1,2,25.00); 
insert into tbTitulosPedidos (numPed, codTit, qtdCd, valCd) values (6,2,3,30.00); 
insert into tbTitulosPedidos (numPed, codTit, qtdCd, valCd) values (6,3,1,35.00); 
insert into tbTitulosPedidos (numPed, codTit, qtdCd, valCd) values (7,4,2,55.00);
insert into tbTitulosPedidos (numPed, codTit, qtdCd, valCd) values (8,1,4,60.00); 
insert into tbTitulosPedidos (numPed, codTit, qtdCd, valCd) values (9,2,3,15.00); 
insert into tbTitulosPedidos (numPed, codTit, qtdCd, valCd) values (10,7,2,15.00);

select * from tbArtistas;
select * from tbGravadoras;
select * from tbCategorias;
select * from tbEstados;
select * from tbCidades;
select * from tbClientes;
select * from tbConjuge;
select * from tbFuncionarios;
select * from tbDependentes;
select * from tbTitulos;
select * from tbPedidos;
select * from tbTitulosArtistas;
select * from tbTitulosPedidos;

--Utilizando o banco de dados DB_CDS:
--1. Selecione o nome dos CDs e o nome da gravadora de cada CD.
--Resposta:

select tit.nomeCd, gra.nomeGrav
from tbTitulos tit inner join tbGravadoras gra on tit.codGrav = gra.codGrav;

--2. Selecione o nome dos CDs e o nome da categoria de cada CD.
--Resposta:

select tit.nomeCd, cat.nomeCat
from tbTitulos tit inner join tbCategorias cat on tit.codCat = cat.codCat;

--3. Selecione o nome dos CDs, o nome das gravadoras de cada CD e o nome da categoria de cada CD.
--Resposta:

select tit.nomeCd, gra.nomeGrav, cat.nomeCat
from tbTitulos tit inner join tbGravadoras gra on tit.codGrav = gra.codGrav inner join tbCategorias cat ON tit.codCat = cat.codCat;

--4. Selecione o nome dos clientes e os títulos dos CDs vendidos em cada pedido que o cliente fez.
--Resposta:

select cli.nomeCli, tit.nomeCd
from tbClientes cli join tbPedidos ped on cli.codCli = ped.codCli join tbTitulosPedidos tp on ped.numPed = tp.numPed join tbTitulos tit on tp.codTit = tit.codTit;

--5. Selecione o nome do funcionário, número, data e valor dos pedidos que este funcionário registrou, além do nome do cliente que está fazendo o pedido.
--Resposta:

select func.nomeFunc, ped.numPed, ped.dataPed, ped.valPed, cli.nomeCli
from tbFuncionarios func join tbPedidos ped ON func.codFunc = ped.codFunc join tbClientes cli ON ped.codCli = cli.codCli;
 
--6. Selecione o nome dos funcionários e o nome de todos os dependentes de cadafuncionário.
--Resposta:

select func.nomeFunc, dep.nomeDep
from tbFuncionarios func join tbDependentes dep on func.codFunc = dep.codFunc;

--7. Selecione o nome dos clientes e o nome dos cônjuges de cada cliente.
--Resposta:

select cli.nomeCli, conj.nomeConj
from tbClientes cli join tbConjuge conj on cli.codCli = conj.codCli;	


--8. Selecione o nome de todos os clientes. Se estes possuem cônjuges, mostrar os nomesde seus cônjuges também.
--Resposta:

select cli.nomeCli, conj.nomeConj
from tbClientes cli right join tbConjuge conj on cli.codCli = conj.codCli;

--9. Selecione nome do cliente, nome do cônjuge, número do pedido que cada cliente fez,valor de cada pedido que cada cliente fez e código do funcionário que atendeu a cadapedido.
--Resposta:

select cli.nomeCli, conj.nomeConj, ped.numPed, ped.valPed, ped.codFunc
from tbClientes cli right join tbConjuge conj on cli.codCli = conj.codCli join tbPedidos ped on cli.codCli = ped.codCli;


--Laboratório

--Para realizar esse laboratório, utilize o banco de dados DB_CDS. 

--1. Exiba quantos pedidos cada cliente fez. 
--Resposta: 
select cli.nomecli, sum(ped.numPed) as 'quantidade de pedidos' 
from tbpedidos ped join tbClientes cli on cli.codCli = ped.codCli;

--2. Exiba quantos CDs possui cada categoria. 
--Resposta: 
select sum(codCat) from tbCategorias;

--3. Exiba quantos CDs possui cada gravadora. 
--Resposta: 
select sum(codGrav) from tbGravadoras;

--4. Exiba quantos pedidos cada funcionário atendeu. 
--Resposta: 


--5. Exiba quantos dependentes tem cada funcionário. 
--Resposta: 


--6. Exiba quantos pedidos cada cliente fez, mostrando o nome dos clientes. 
--Resposta: 


--7. Exiba quantos CDs possui cada categoria, mostrando o nome das mesmas. 
--Resposta: 


--8. Exiba quantos CDs possui cada gravadora, mostrando o nome das mesmas. 
--Resposta: 


--9. Exiba quantos pedidos cada funcionário atendeu, mostrando o nome dos funcionários. 
--Resposta: 


--10. Exiba quantos dependentes cada funcionário possui, mostrando seus nomes. 
--Resposta: 
