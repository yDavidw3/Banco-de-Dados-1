CREATE DATABASE dbEmpresaEvento
GO

USE dbEmpresaEvento

CREATE TABLE tbFornecedor(
	idFornecedor INT PRIMARY KEY IDENTITY (1,1)
	,nomeFornecedor VARCHAR (50) NOT NULL
	,cnpjFornecedor CHAR (14) NOT NULL
);

CREATE TABLE tbFoneFornecedor(
	 idFoneFornecedor INT PRIMARY KEY IDENTITY (1,1)
	 ,numeroFoneFornecedor VARCHAR (15) NOT NULL -- existem paísess com mais de 3 dígitos ddd --
	 ,idFornecedor INT FOREIGN KEY REFERENCES tbFornecedor (idFornecedor)
);

CREATE TABLE tbEmailFornecedor(
	idEmailFornecedor INT PRIMARY KEY IDENTITY (1,1)
	,emailEmailFornecedor VARCHAR (320) NOT NULL 
	,idFornecedor INT FOREIGN KEY REFERENCES tbFornecedor (idFornecedor)
);

CREATE TABLE tbTipoServico(
	idTipoServico INT PRIMARY KEY IDENTITY (1,1)
	,nomeTipoServico VARCHAR (100) NOT NULL
	,descricaoTipoServico VARCHAR (200) NOT NULL
	,idFornecedor INT FOREIGN KEY REFERENCES tbFornecedor (idFornecedor)
);

CREATE TABLE tbServico(
	idServico INT PRIMARY KEY IDENTITY (1,1)
	,nomeServico VARCHAR (228) NOT NULL
	,descricaoServico VARCHAR (200) NOT NULL
	,custoUnitarioServico MONEY NOT NULL
);

CREATE TABLE tbServicoFornecedor(
	idServicoFornecedor INT PRIMARY KEY IDENTITY (1,1)
	,idFornecedor INT FOREIGN  KEY REFERENCES tbFornecedor (idFornecedor)
	,idServico INT FOREIGN KEY REFERENCES tbServico (idServico)
);

CREATE TABLE tbEvento(
	idEvento INT PRIMARY KEY IDENTITY (1,1)
	,nomeEvento VARCHAR (50) NOT NULL
	,dataEvento DATE NOT NULL
	,localEvento VARCHAR (100) NOT NULL
	,orcamentoEvento MONEY NOT NULL
);

CREATE TABLE tbContratoServico(
	idContratoServico INT PRIMARY KEY IDENTITY (1,1)
	,quantidadeContratoServico VARCHAR (100) NOT NULL
	,dataContratoServico DATE NOT NULL
	,assinaturaClienteContratoServico VARCHAR (228) NOT NULL
	,assinaturaFornecedorContratoServico VARCHAR (228) NOT NULL
	,valorTotalContratoServico MONEY NOT NULL
	,idEvento INT FOREIGN KEY REFERENCES tbEvento (idEvento)
	,idServico INT FOREIGN KEY REFERENCES tbServico (idServico)
);

CREATE TABLE tbCliente(
	idCliente INT PRIMARY KEY IDENTITY (1,1)
	,nomeCliente VARCHAR (228) NOT NULL
	,logradouroCliente VARCHAR (200) NOT NULL
	,cepCliente CHAR (8) NOT NULL
	,bairroCliente VARCHAR (150) NOT NULL
	,cidadeCliente VARCHAR (150) NOT NULL
	,ufCliente CHAR (2) NOT NULL
	,estadoCliente VARCHAR (85) NOT NULL
	,paisCliente VARCHAR (150) NOT NULL
);

CREATE TABLE tbEventoCliente(
	idEventoCliente INT PRIMARY KEY IDENTITY (1,1)
	,idEvento INT FOREIGN KEY REFERENCES tbEvento (idEvento)
	,idCliente INT FOREIGN KEY REFERENCES tbCliente (idCliente)
);

CREATE TABLE tbFoneCliente(
	idFoneCliente INT PRIMARY KEY IDENTITY (1,1)
	,numeroFoneCliente VARCHAR (15) NOT NULL
	,idCliente INT FOREIGN KEY REFERENCES tbCliente (idCliente)
);

CREATE TABLE tbEmailCliente(
	idEmailCLiente INT PRIMARY KEY IDENTITY (1,1)
	,emailEmailCliente VARCHAR (320)
	,idCliente INT FOREIGN KEY REFERENCES tbCliente (idCliente)
);