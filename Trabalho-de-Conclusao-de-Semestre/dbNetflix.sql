CREATE DATABASE dbNetflix
GO

USE dbNetflix

CREATE TABLE tbCliente(
	idCliente INT PRIMARY KEY IDENTITY (1,1)
	,nomeCliente VARCHAR (50) NOT NULL
	,sobrenomeCliente VARCHAR (120)
	,dataNascimentoCliente DATE
	,generoCliente CHAR (6)
);

CREATE TABLE tbSenhaLoginCliente(
	idSenhaLoginCliente INT PRIMARY KEY IDENTITY (1,1)
	,senhaSenhaLoginCliente CHAR (60) NOT NULL
	,idCliente INT FOREIGN KEY REFERENCES tbCliente
);

CREATE TABLE tbFoneCliente(
	idFoneCliente INT PRIMARY KEY IDENTITY (1,1)
	,numeroFoneCliente CHAR (13)
	,idCliente INT FOREIGN KEY REFERENCES tbCliente
);

CREATE TABLE tbAssinaturaCliente(
	idAssinaturaCliente INT PRIMARY KEY IDENTITY (1,1)
	,idCliente INT FOREIGN KEY REFERENCES tbCliente
	,dataAssinatura DATE
	,dataVencimentoAssinatura DATE
);

CREATE TABLE tbPerfilUsuario(
	idPerfilUsuario INT PRIMARY KEY IDENTITY (1,1)
	,nomeidPefilUsuario VARCHAR (100)
	,tipoPerfiLUsuario VARCHAR (30)
	,idCliente INT FOREIGN KEY REFERENCES tbCliente
);

CREATE TABLE tbSenhaPerfilUsuario(
	idSenhaPerfilUsuario INT PRIMARY KEY IDENTITY (1,1)
	,senhaSenhaPerfilUsuario CHAR (60)
	,idPerfilUsuario INT FOREIGN KEY REFERENCES tbPerfilUsuario
);

CREATE TABLE tbTipoPagamento(
	idTipoPagamento INT PRIMARY KEY IDENTITY (1,1)
	,tipoTipoPagamento VARCHAR (50)
	,descricaoTipoPagamento VARCHAR (40)
);

CREATE TABLE tbPagamento(
	idPagamento INT PRIMARY KEY IDENTITY (1,1)
	,dataPagamento DATE
	,idTipoPagamento INT FOREIGN KEY REFERENCES tbTipoPagamento
	,idCliente INT FOREIGN KEY REFERENCES tbCliente
	,idAssinaturaCliente INT FOREIGN KEY REFERENCES tbAssinaturaCliente
);

CREATE TABLE tbPlanoAssinatura(
	idPlanoAssinatura INT PRIMARY KEY IDENTITY (1,1)
	,tipoPlanoAssinatura VARCHAR (30)
	,valorPlanoAssinatura MONEY
	,descricaoPlanoAssinatura VARCHAR (30)
	,idAssinaturaCliente INT FOREIGN KEY REFERENCES tbAssinaturaCliente
);

CREATE TABLE tbProdutor(
	idProduto INT PRIMARY KEY IDENTITY (1,1)
	,nomeProdutor VARCHAR (65)
	,descricaoProdutor VARCHAR (100)
);

CREATE TABLE tbDiretor(
	idDiretor INT PRIMARY KEY IDENTITY (1,1)
	,nomeDiretor VARCHAR (65)
	,descricaoDiretor VARCHAR (100)
);

CREATE TABLE tbIdioma(
	idIdioma INT PRIMARY KEY IDENTITY (1,1)
	,nomeIdioma VARCHAR (40)
	,paisIdioma VARCHAR (65)
);

CREATE TABLE tbLegenda(
	idLegenda INT PRIMARY KEY IDENTITY (1,1)
	,idiomaLegenda VARCHAR (40)
	,paisIdiomaLegenda VARCHAR (65)
);

CREATE TABLE tbTitulo(
	idTitulo INT PRIMARY KEY IDENTITY (1,1)
	,tituloTitulo VARCHAR (120)
	,classificacaoIdadeTitulo VARCHAR (5)
	,tempoTitulo INT NOT NULL
	,elencoTitulo VARCHAR (450)
	,dataLancamentoTitulo DATE
	,sinopseTitulo CHAR (200)
	,idIdioma INT FOREIGN KEY REFERENCES tbIdioma
	,idLegenda INT FOREIGN KEY REFERENCES tbLegenda
);

CREATE TABLE tbFormato(
	idFormato INT PRIMARY KEY IDENTITY (1,1)
	,nomeFormato VARCHAR (40)
	,idTitulo INT FOREIGN KEY REFERENCES tbTitulo
);

CREATE TABLE tbGenero(
	idGenero INT PRIMARY KEY IDENTITY (1,1)
	,tipoGenero VARCHAR (45)
	,descricaoGenero VARCHAR (45)
);

CREATE TABLE tbGeneroTitulo(
	idGeneroTitulo INT PRIMARY KEY IDENTITY (1,1)
	,idGenero INT FOREIGN KEY REFERENCES tbGenero
	,idTitulo INT FOREIGN KEY REFERENCES tbTitulo
);

CREATE TABLE tbDiretorTitulo(
	tbDiretorTitulo INT PRIMARY KEY IDENTITY (1,1)
	,idTitulo INT FOREIGN KEY REFERENCES tbTitulo
	,idDiretor INT FOREIGN KEY REFERENCES tbDiretor
); 

CREATE TABLE tbLegendaTitulo(
	idLegendaTitulo INT PRIMARY KEY IDENTITY (1,1)
	,idTitulo INT FOREIGN KEY REFERENCES tbTitulo
	,idLegenda INT FOREIGN KEY REFERENCES tbLegenda
);

CREATE TABLE tbTemporadaSerie(
	idTemporadaSerie INT PRIMARY KEY IDENTITY (1,1)
	,numeroTemporadaSerie CHAR (2)
	,quantidadeEpisodiosTemporadaSerie VARCHAR (1000)
	,idTitulo INT FOREIGN KEY REFERENCES tbTitulo
);

CREATE TABLE tbEpisodio(
	idEpisodio INT PRIMARY KEY IDENTITY (1,1)
	,tituloEpisodio VARCHAR (50)
	,numeroEpisodio VARCHAR (3)
	,descricaoEpisodio VARCHAR (200)
	,idTemporadaSerie INT FOREIGN KEY REFERENCES tbTemporadaSerie
);
