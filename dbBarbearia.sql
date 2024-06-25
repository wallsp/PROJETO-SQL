drop database dbBarbearia;

create database dbBarbearia;

use dbBarbearia;

create table tbProdutos(
codProd int not null auto_increment,
descricao varchar(100),
marca varchar(50),
preco decimal (9,2),
primary key (codProd)
);

insert into tbProdutos(descricao,marca,preco)
	values('Shampo', 'nivea', 30.0);
insert into tbProdutos(descricao,marca,preco)
	values('Shampo', 'phebo', 50.0);
insert into tbProdutos(descricao,marca,preco)
	values('Creme de barbear', 'Barbers', 70.0);
insert into tbProdutos(descricao,marca,preco)
	values('Gel para cabelos', 'Salome', 25.0);	

select * from tbProdutos;

-- delete from tbProdutos where codProd = 2;

select * from tbProdutos;

select
codProd as 'Código',
descricao as 'descrição',
marca as 'marca',
preco as 'preço'
from tbProdutos;
--colunas virtuais

select codProd as 'código', descricao as 'descrição','promocao' as 'promo',marca as 'marca', 'sim' as 'vendido', preco as 'preço'
    from tbProdutos;	

update tbProdutos set preco = preco * 1.10; where codProd = 3;   

select * from tbProdutos;

select codProd * 3.141692   as 'calculando o PI', preco * 0.90 as 'Desconto'
    from  tbprodutos;

update tbProdutos set preco = preco * 0.20; where codProd = 1;   	 

select * from tbProdutos;
