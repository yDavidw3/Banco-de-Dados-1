CREATE DATABASE dbLojaGuaia;

USE dbLojaGuaia;

CREATE TABLE tbPrudutu(
	id INT IDENTITY (1,1)
	,nome VARCHAR (40)
	,valor VARCHAR (40)
	,qtddd INT
	,--descicao
);

-- alterar o nome do banco de dados --
USE master
ALTER DATABASE dbLojaGuaia MODIFY NAME = bdLoja;

-- renomear uma tabela existente --
USE bdLoja;
EXEC sp_rename 'tbPrudutu', 'tbProduto';

-- Apagar uma tabela --
DROP TABLE tbProduto;

-- alterar uma coluna para NOT NULL --
ALTER TABLE tbProduto ALTER COLUMN id INT NOT NULL;

-- adicionar uma primary key em uma coluna --
ALTER TABLE tbProduto ADD CONSTRAINT pk_tbProduto PRIMARY KEY (id);

-- alterar o nome de uma coluna --
EXEC sp_rename 'tbProduto.id', 'idProduto', 'COLUMN';

-- adicionar uma coluna --
ALTER TABLE tbProduto ADD descricao VARCHAR (40);

-- remover uma coluna --
ALTER TABLE tbProduto DROP COLUMN qtddd;

-- alterar um tipo de dado de uma coluna -- 
ALTER TABLE tbProduto ALTER COLUMN valor FLOAT;

-- criar uma nova tabela​ --
CREATE TABLE tbCategoria(
	idCategoria INT PRIMARY KEY IDENTITY(1,1)
	,nomeCategoria VARCHAR (40)​
​);

-- adicionar uma coluna​ --
ALTER TABLE tbProduto ADD idCategoria INT;

-- adicionar uma chave estrangeira​ --
ALTER TABLE tbProduto​ ADD CONSTRAINT fk_categoria FOREIGN KEY (idCategoria)​ REFERENCES tbCategoria(idCategoria);​

-- alterar uma coluna para unique --
ALTER TABLE tbProduto ADD CONSTRAINT uq_nomeProduto UNIQUE (nome);