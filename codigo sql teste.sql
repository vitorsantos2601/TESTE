CREATE DATABASE IF NOT EXISTS gestao_torneios; 
USE gestao_torneios; 
-- Tabela Equipas 
CREATE TABLE Equipas ( 
ID_Equipa INT AUTO_INCREMENT PRIMARY KEY, 
Nome_Equipa VARCHAR(100) NOT NULL, 
Data_Criacao DATE NOT NULL 
); 

-- Tabela Jogadores 
CREATE TABLE Jogadores ( 
ID_Jogador INT AUTO_INCREMENT PRIMARY KEY, 
Nome VARCHAR(100) NOT NULL, 
Nickname VARCHAR(50) NOT NULL, 
Data_Nascimento DATE NOT NULL, 
ID_Equipa INT NOT NULL, 
FOREIGN KEY (ID_Equipa) 
REFERENCES Equipas(ID_Equipa) 
);

 -- Tabela Torneios 
CREATE TABLE Torneios ( 
ID_Torneio INT AUTO_INCREMENT PRIMARY KEY, 
Nome VARCHAR(100) NOT NULL, 
Data_Inicio DATE NOT NULL, 
Premio_Monetario DECIMAL(10,2) NOT NULL, 
CHECK (Premio_Monetario >= 0) 
); 

-- Tabela Participacoes 
CREATE TABLE Participacoes ( 
ID_Equipa INT NOT NULL, 
ID_Torneio INT NOT NULL, 
PRIMARY KEY (ID_Equipa, ID_Torneio), 
FOREIGN KEY (ID_Equipa) 
REFERENCES Equipas(ID_Equipa), 
FOREIGN KEY (ID_Torneio) 
REFERENCES Torneios(ID_Torneio) 
); 

INSERT INTO Equipas (ID_Equipa,Nome_Equipa,Data_Criacao) VALUES
(1,'Os Feios',20261106),
(2,'Os Bonitos',20261105),
(3,'Os que moram em ilhavo',20261107);

INSERT INTO Jogadores (ID_Jogador,Nome,Nickname,Data_Nascimento,ID_Equipa) VALUES
(1,'Vitor','Santos',20090126,2),
(2,'Ricardo','Perdigão',20091016,1),
(3,'João','Silva',20080724,2),
(4,'Caique','Silva',20080921,1),
(5,'Henrique','Marcos',20090519,3);


INSERT INTO Torneios (ID_Torneio,Nome,Data_Inicio,Premio_Monetario) VALUES
(1,'Copa do Mundo',20260116,1000000),
(2,'Champions League',20260906,200000),
(3,'Premier League',20260816,30000);

INSERT INTO Participacoes (ID_Equipa,ID_Torneio) VALUES
(1,2),
(2,1),
(1,3),
(1,1),
(3,3),
(3,1);

SELECT * FROM Equipas;
SELECT * FROM Jogadores;
SELECT * FROM Torneios;
SELECT * FROM Participacoes;

-- a
SELECT * FROM Jogadores ORDER BY Nome;
-- b 
SELECT Nome,ID_Equipa FROM	Jogadores;
-- c
SELECT * FROM Participacoes WHERE ID_torneio LIKE 1;

-- d
SELECT ID_Equipa, COUNT(*) AS total FROM Jogadores GROUP BY ID_Equipa HAVING COUNT(*) > 1;

