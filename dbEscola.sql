DROP DATABASE dbEscola;
CREATE DATABASE dbEscola;
USE dbEscola;

CREATE TABLE tbFuncionarios (
    idFunc INT NOT NULL AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL,
    telefone CHAR(9) NOT NULL,
    cpf CHAR(14) NOT NULL UNIQUE,
    PRIMARY KEY (idFunc)
);

CREATE TABLE tbProfessores (
    re CHAR(7) NOT NULL,
    idFunc INT NOT NULL,
    PRIMARY KEY (re),
    FOREIGN KEY (idFunc) REFERENCES tbFuncionarios(idFunc)
);

CREATE TABLE tbTurmas (
    idTurma INT NOT NULL AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    PRIMARY KEY (idTurma)
);

CREATE TABLE tbSalas (
    idSala INT NOT NULL AUTO_INCREMENT,
    descricao VARCHAR(100),
    localizacao VARCHAR(30),
    PRIMARY KEY (idSala)
);

CREATE TABLE tbCurso (
    idCurso INT NOT NULL AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    data DATE NOT NULL,
    hora TIME NOT NULL,
    re CHAR(7) NOT NULL,
    idSala INT NOT NULL,
    PRIMARY KEY (idCurso),
    FOREIGN KEY (re) REFERENCES tbProfessores(re),
    FOREIGN KEY (idSala) REFERENCES tbSalas(idSala)
);

CREATE TABLE tbAlunos (
    idAluno INT NOT NULL AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL,
    cpf CHAR(14) NOT NULL UNIQUE,
    sexo CHAR(1) DEFAULT 'F' CHECK (sexo IN ('F', 'M')),
    idade INT DEFAULT 0 CHECK (idade >= 0),
    PRIMARY KEY (idAluno)
);

CREATE TABLE tbUsuarios (
    idUsu INT NOT NULL AUTO_INCREMENT,
    nome VARCHAR(50) NOT NULL,
    senha VARCHAR(30) NOT NULL,
    idFunc INT NOT NULL,
    PRIMARY KEY (idUsu),
    FOREIGN KEY (idFunc) REFERENCES tbFuncionarios(idFunc)
);

CREATE TABLE tbMatricula (
    idMatr INT NOT NULL AUTO_INCREMENT,
    idCurso INT NOT NULL,
    idTurma INT NOT NULL,
    idUsu INT NOT NULL,
    idAluno INT NOT NULL,
    data DATE,
    hora TIME,
    PRIMARY KEY (idMatr),
    FOREIGN KEY (idCurso) REFERENCES tbCurso(idCurso),
    FOREIGN KEY (idTurma) REFERENCES tbTurmas(idTurma),
    FOREIGN KEY (idUsu) REFERENCES tbUsuarios(idUsu),
    FOREIGN KEY (idAluno) REFERENCES tbAlunos(idAluno)
);

DESC tbFuncionarios;
DESC tbCurso;
DESC tbTurmas;
DESC tbSalas;
DESC tbProfessores;
DESC tbAlunos;
DESC tbUsuarios;
DESC tbMatricula;
