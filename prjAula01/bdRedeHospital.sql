CREATE DATABASE bdRedeHospital
GO

USE bdRedeHospital

CREATE TABLE tbPaciente (
 idPaciente INT PRIMARY KEY IDENTITY (1,1)
,nomePaciente VARCHAR (50) NOT NULL
,cpfPaciente CHAR (12) NOT NULL
,dataNacimentoPaciente DATE NOT NULL
,logradouroPaciente VARCHAR (50) NOT NULL
,cepPaciente VARCHAR (50) NOT NULL
,bairroPaciente VARCHAR (50)
,ufPaciente VARCHAR (50)
,cidadePaciente VARCHAR (50)
,estadoPaciente VARCHAR (50)
,paisPaciente VARCHAR (50)
);

CREATE TABLE tbFonePaciente (
 idFonePaciente INT PRIMARY KEY IDENTITY (1,1)
,numeroFonePaciente CHAR (13) NOT NULL
,idPaciente INT FOREIGN KEY REFERENCES tbPaciente (idPaciente)
);

CREATE TABLE tbMedico (
 idMedico INT PRIMARY KEY IDENTITY (1,1)
,nomeMedico VARCHAR (50) NOT NULL
,crmMEdico CHAR (6) NOT NULL
);

CREATE TABLE tbEspecialidade (
 idEspecialidade INT PRIMARY KEY IDENTITY (1,1)
,nomeEspecialidade VARCHAR (50) NOT NULL
,descricaoEspecialidade VARCHAR (200)
);

CREATE TABLE tbEspecialidadeMedico (
idEspecialidadeMedico INT PRIMARY KEY IDENTITY
,idMedico INT FOREIGN KEY REFERENCES tbMedico (idMedico)
,idEspecialidade INT FOREIGN KEY REFERENCES tbEspecialidade (idEspecialidade)
);

CREATE TABLE tbFoneMedico (
idFoneMedico INT PRIMARY KEY IDENTITY (1,1)
,numeroFoneMedico CHAR (13) NOT NULL
,idMedico INT FOREIGN KEY REFERENCES tbMedico (idMedico)
);

CREATE TABLE tbConsulta (
 idConsulta INT PRIMARY KEY IDENTITY (1,1)
,dataConsulta DATE NOT NULL
,horaConsulta TIME
,observacaoConsulta VARCHAR (200)
,idPaciente INT FOREIGN KEY REFERENCES tbPaciente (idPaciente)
,idMedico INT FOREIGN KEY REFERENCES tbMedico (idMedico)
);

CREATE TABLE tbDiagnosticoConsulta (
 idDiagnosticoConsulta INT PRIMARY KEY IDENTITY (1,1)
,nomeDiagnosticoConsulta VARCHAR (50) NOT NULL
,descricaoDiagnosticoConsulta VARCHAR (200) NOT NULL
,idConsulta INT FOREIGN KEY REFERENCES tbConsulta (idConsulta)
);

CREATE TABLE tbExame (
 idExame INT PRIMARY KEY IDENTITY (1,1)
,dataRealizacaoExame DATE NOT NULL
,idConsulta INT FOREIGN KEY REFERENCES tbConsulta (idConsulta)
);

CREATE TABLE tbResultadoExame (
 idResultadoExame INT PRIMARY KEY IDENTITY (1,1)
,descricaoResultadoExame VARCHAR (200) NOT NULL
,idExame INT FOREIGN KEY REFERENCES tbExame (idExame)
);

CREATE TABLE tbTipoExame (
 idTipoExame INT PRIMARY KEY IDENTITY (1,1)
,nomeTipoExame VARCHAR (50) NOT NULL
,descricaoTipoExame VARCHAR (200) NOT NULL
,idExame INT FOREIGN KEY REFERENCES tbExame (idExame)
);

CREATE TABLE tbMedicamento (
 idMedicamento INT PRIMARY KEY IDENTITY (1,1)
,nomeMedicamento VARCHAR (50) NOT NULL
,dosagemMedicamento INT NOT NULL
,formaApresentacaoMedicamento VARCHAR (50) NOT NULL
);

CREATE TABLE tbMedicamentoConsulta (
 idMedicamentoConsulta INT PRIMARY KEY IDENTITY (1,1)
,idConsulta INT FOREIGN KEY REFERENCES tbConsulta
,idMedicamento INT FOREIGN KEY REFERENCES tbMedicamento (idMedicamento)
);

CREATE TABLE tbIngrediente (
idIngrediente INT PRIMARY KEY IDENTITY (1,1)
,nomeIngrediente VARCHAR (50) NOT NULL
,descricaoIngrediente VARCHAR (200) NOT NULL
);

CREATE TABLE tbMedicamentoIngrediente (
 idMedicamentoIngrediente INT PRIMARY KEY IDENTITY (1,1)
,idMedicamento INT FOREIGN KEY REFERENCES tbMedicamento (idMedicamento)
,idIngrediente INT FOREIGN KEY REFERENCES tbIngrediente (idIngrediente)
);
