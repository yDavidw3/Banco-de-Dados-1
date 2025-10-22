CREATE DATABASE dbAeroporto;
GO 

USE dbAeroporto;
GO

CREATE TABLE tbPassageiro(
	id INT IDENTITY (1,1)
	,nome VARCHAR (100)
	,idade INT
);

ALTER TABLE tbPassageiro ALTER COLUMN id INT NOT NULL;

ALTER TABLE tbPassageiro ADD cpf VARCHAR (14);

EXEC sp_rename 'tbpassageiro.idade', 'idade', 'COLUMN';

ALTER TABLE tbPassageiro ALTER COLUMN cpf CHAR (11);

ALTER TABLE tbPassageiro ADD CONSTRAINT uq_cpfPassageiro UNIQUE (cpf);

ALTER TABLE tbPassageiro ADD Nacionalidade VARCHAR (50);

ALTER TABLE tbPassageiro ADD CONSTRAINT pk_tbPassageiro PRIMARY KEY (id);

ALTER TABLE tbPassageiro DROP COLUMN Nacionalidade;

EXEC sp_rename 'tbPassageiro', 'tbClienteVoo';