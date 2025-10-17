CREATE DATABASE bdPlataformaCurso
GO

USE bdPlataformaCurso

CREATE TABLE tbProfessor (
idProfessor INT PRIMARY KEY IDENTITY (1,1)
,nomeProfessor VARCHAR (50) NOT NULL
);

CREATE TABLE tbEmailProfessor (
 idEmailProfessor INT PRIMARY KEY IDENTITY (1,1)
,emailEmailProfessor VARCHAR (50) NOT NULL
,idProfessor INT FOREIGN KEY REFERENCES tbProfessor (idProfessor)
);

 CREATE TABLE tbEspecialidade (
   idEspecialidade INT PRIMARY KEY IDENTITY (1,1)
  ,nomeEspecialidade VARCHAR (50) NOT NULL
  ,descricaoEspecialidade VARCHAR (50)
 );

CREATE TABLE tbEspecialidadeProfessor (
 idEspecialidadeProfessor INT PRIMARY KEY IDENTITY (1,1)
 ,idEspecialidade INT FOREIGN KEY REFERENCES tbEspecialidade
 ,idProfessor INT FOREIGN KEY REFERENCES tbProfessor (idProfessor)
 );

CREATE TABLE tbCurso (
 idCurso INT PRIMARY KEY IDENTITY (1,1)
,nomeCurso VARCHAR (50) NOT NULL
,descricaoCurso VARCHAR (50)
,cargaHorariaCurso INT  NOT NULL
);
CREATE TABLE tbCursoProfessor (
 idCursoProfessor INT PRIMARY KEY IDENTITY (1,1)
,idProfessor INT FOREIGN KEY REFERENCES tbProfessor (idProfessor)
,idCurso INT FOREIGN KEY REFERENCES tbCurso (idCurso)
);



CREATE TABLE tbAluno (
 idAluno INT PRIMARY KEY IDENTITY (1,1)
,nomeAluno VARCHAR (50) NOT NULL
,dataNasciAluno DATE NOT NULL
);

CREATE TABLE tbCursoAluno (
 idCursoAluno INT PRIMARY KEY IDENTITY (1,1)
 ,idAluno INT FOREIGN KEY REFERENCES tbAluno (idAluno)
 ,idCurso INT FOREIGN KEY REFERENCES tbCurso (idCurso)
);

CREATE TABLE tbEmailAluno (
 idEmailAluno INT PRIMARY KEY IDENTITY (1,1)
,emailEmailAluno VARCHAR (50) NOT NULL
,idAluno INT FOREIGN KEY REFERENCES tbAluno (idAluno)
);

CREATE TABLE tbFoneAluno (
 idFoneAluno INT PRIMARY KEY IDENTITY (1,1)
,numeroFoneAluno CHAR (13) NOT NULL
,idAluno INT FOREIGN KEY REFERENCES tbAluno (idAluno)
);

CREATE TABLE tbStatusMatricula (
 idStatusMatricula INT PRIMARY KEY IDENTITY (1,1)
,descricaoStatusMatricula VARCHAR (50)
);

CREATE TABLE tbMatricula (
 idMatricula INT PRIMARY KEY IDENTITY (1,1)
,dataMatricula CHAR (8) NOT NULL
,idAluno INT FOREIGN KEY REFERENCES tbAluno (idAluno)
,idCurso INT FOREIGN KEY REFERENCES tbCurso (idCurso)
,idStatusMatricula INT FOREIGN KEY REFERENCES tbStatusMatricula (idStatusMatricula)
);

