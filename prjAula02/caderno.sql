 CREATE DATABASE dbLojaGuaia
 GO 

 USE dbLojaGuaia

 CREATE TABLE tbPrudutu(
	id INT IDENTITY (1,1)
	,nome VARCHAR (40)
	,valor VARCHAR (40)
	,qtddd INT
	--descricao
);

 CREATE TABLE tbCategoria(​
	idCategoria INT PRIMARY KEY IDENTITY (1,1)
	,nomeCategoria VARCHAR(40)​
);​


 EXEC sp_rename "tbPrudutu", "tbProduto";

 ALTER TABLE tbProduto ALTER COLUMN id NOT NULL;

 ALTER TABLE tbProduto ADD CONSTRAINT pk_tbProduto PRIMARY KEY (id);

 EXEC sp_rename "tbProduto.id", "idProduto", "COLUMN";

 ALTER TABLE tbProduto ADD descricao VARCHAR (40);

 ALTER TABLE tbProduto DROP COLUMN qtddd;

 ALTER TABLE tbProduto ALTER COLUMN VALOR FLOAT;

 ALTER TABLE tbProduto ADD idCategoria INT;​

 ALTER TABLE tbProduto ADD idCategoria INT;

 ADD CONSTRAINT fk_categoria FOREIGN KEY (idCategoria)​

 REFERENCES tbCategoria(idCategoria);​