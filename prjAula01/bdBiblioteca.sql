CREATE DATABASE  dbBilbioteca
GO

USE dbBilbioteca

CREATE TABLE tbLeitor(
	idLeitor INT PRIMARY KEY IDENTITY (1,1)
	,nomeLeitor VARCHAR (50) NOT NULL
	,lograLeitor VARCHAR (50)
	,numlogra VARCHAR (50)
	,cepLeitor VARCHAR (08)
	,bairroLeitor VARCHAR (50)
	,cidadeLeitor VARCHAR (50)
	,estadoLeitor VARCHAR (50)
	,ufLeitor CHAR (2)
	,paisLeitor VARCHAR (50)
	,idLivro INT FOREIGN KEY REFERENCES tbLivro
);

CREATE TABLE tbLivro(
	idLivro INT PRIMARY KEY IDENTITY (1,1)
	,tituloLivro VARCHAR (50)
	,autorLivro VARCHAR (50)
	,anoPublicacaoLivro CHAR (04)
	,isbnLivro VARCHAR (13)
);

CREATE TABLE tbEmprestimo (
    idEmprestimo INT PRIMARY KEY IDENTITY (1,1)
	,dataEmprestimo VARCHAR (6) NOT NULL
	,dataDevolucaoPrevistaEmprestimo  VARCHAR (6)NOT NULL
	,dataDevolucaoRealEmprestimo VARCHAR (6) NOT NULL
	,idLeitor INT FOREIGN KEY REFERENCES tbLeitor
	,idLivro INT FOREIGN KEY REFERENCES tbLivro
);

CREATE TABLE tbGenero (
    idGenero INT PRIMARY KEY IDENTITY (1,1)
   ,nomeGenero VARCHAR (50) NOT NULL
   ,descricaoGenero VARCHAR (50)
);

CREATE  TABLE tbGeneroLivro (
     idgeneroLivro INT PRIMARY KEY IDENTITY (1,1)
	,idLivro INT FOREIGN KEY REFERENCES tbLivro
	,idGenero INT FOREIGN KEY REFERENCES tbGenero
);

CREATE TABLE tbFoneLeitor(
	idFoneLeitor INT PRIMARY KEY IDENTITY (1,1)
	,numeroFoneLeitor CHAR (13)
	,idLeitor INT FOREIGN KEY REFERENCES tbLeitor
);
