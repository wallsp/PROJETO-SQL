drop database dbProdutos;
 
create database dbProdutos;
 
use dbProdutos;
 
CREATE TABLE PRODUTOS 
( 
CODIGO INT, 
NOME VARCHAR(50), 
TIPO VARCHAR(25), 
QUANTIDADE INT, 
VALOR DECIMAL(10,2) 
);

INSERT INTO PRODUTOS ( CODIGO, NOME, TIPO, QUANTIDADE, VALOR ) VALUES ( 1,
'IMPRESSORA', 'INFORMATICA', 200, 600.00); 
INSERT INTO PRODUTOS ( CODIGO, NOME, TIPO, QUANTIDADE, VALOR ) VALUES ( 2,
'CAMERA DIGITAL', 'DIGITAIS', 300, 400.00); 
INSERT INTO PRODUTOS ( CODIGO, NOME, TIPO, QUANTIDADE, VALOR ) VALUES ( 3, 
'DVD PLAYER', 'ELETRONICOS', 250, 500.00); 
INSERT INTO PRODUTOS ( CODIGO, NOME, TIPO, QUANTIDADE, VALOR ) VALUES ( 4,
'MONITOR', 'INFORMATICA', 400, 900.00); 
INSERT INTO PRODUTOS ( CODIGO, NOME, TIPO, QUANTIDADE, VALOR ) VALUES ( 5,
'TELEVISOR', 'ELETRONICOS', 350, 650.00); 
INSERT INTO PRODUTOS ( CODIGO, NOME, TIPO, QUANTIDADE, VALOR ) VALUES ( 6,
'FILMADORA DIGITAL', 'DIGITAIS', 500, 700.00); 
INSERT INTO PRODUTOS ( CODIGO, NOME, TIPO, QUANTIDADE, VALOR ) VALUES ( 7,
'CELULAR', 'TELEFONE', 450, 850.00); 
INSERT INTO PRODUTOS ( CODIGO, NOME, TIPO, QUANTIDADE, VALOR ) VALUES ( 8,
'TECLADO', 'INFORMATICA', 300, 450.00); 
INSERT INTO PRODUTOS ( CODIGO, NOME, TIPO, QUANTIDADE, VALOR ) VALUES ( 9,
'VIDEOCASSETE', 'ELETRONICOS', 200, 300.00);
INSERT INTO PRODUTOS ( CODIGO, NOME, TIPO, QUANTIDADE, VALOR ) VALUES ( 10,
'MOUSE', 'INFORMATICA', 400, 60.00);

DESC PRODUTOS;

SELECT * FROM PRODUTOS;

select distinct tipo from produtos order by tipo;

SELECT * FROM PRODUTOS where valor >= 600;

select valor as 'Valor' from produtos where valor >= 600;

-- Buscar por código

select * from produtos where codigo = 1;

select * from produtos where tipo like 'i%';

select * from produtos where tipo like '%o%' and valor <= 600;

select * from produtos where tipo = 'INFORMATICA' or tipo = 'TELEFONE';

select * from produtos where tipo in('INFORMATICA', 'TELEFONE');

select * from produtos where not tipo in('INFORMATICA', 'TELEFONE');

select * from produtos where valor >= 100 and valor <=300;

select * from produtos where valor not between 100 and 300;

select * from produtos;

--Exercicios

--1. Aumente em 12% o valor dos produtos cujos nomes iniciem com a letra 'F';
update produtos set valor = valor * 1.12 where valor LIKE 'F%';

select * from produtos where valor like 'F%';

--2. Aumentar em 50 unidades todos os produtos cujo valor seja maior que 400 e inferior a 600;

update produtos set QUANTIDADE = QUANTIDADE + 50 where valor between 400 and 600;

select * from produtos;	

--3. Aplicar um desconto de 50% (*0.5) em todos os produtos que as unidades de estoque sejam maiores que 300;
update produtos set valor = valor * 0.5 where QUANTIDADE > 300;
                                                                                                                                                                     
select * from produtos where QUANTIDADE = 300;	
--4. Exiba o produto de CODIGO = 4;

select * from produtos where codigo = 4; 

--5. Exibir todos os produtos que não tenham a letra 'Y'; 

select * from produtos where tipo not like '%Y%';

--6. Exibir todos os produtos que se iniciem com nome 'MO' e tenham como tipo as letras'MA';

select * from produtos where tipo like 'MO%' and tipo like '%MA%';

--Laboratorio pagina 53

--Utilize a tabela PRODUTOS para realizar os exercícios do laboratório.

--1. Escreva uma consulta que exiba os dados da tabela PRODUTOS na forma crescente pelo campo NOME.
select * from produtos order by nome asc;

--2. Escreva uma consulta que exiba o NOME dos produtos ordenado de forma decrescente e o VALOR de forma crescente.
SELECT nome, valor FROM Produtos ORDER BY nome DESC, valor ASC;


--3. Escreva uma consulta que exiba os três produtos mais caros.
select * from produtos order by valor desc limit 3;

--4. Escreva uma consulta que exiba o VALOR do produto mais barato.
select * from produtos order by valor asc limit 21;

