CREATE TABLE Curso(
	ID SERIAL PRIMARY KEY,
	codigo INT,
	nome TEXT NOT NULL,
	instituicao TEXT NOT NULL,
	duracao INT DEFAULT 0
);
CREATE TABLE Aluno(
	ID SERIAL PRIMARY KEY,
	nome TEXT,
	sobrenome TEXT, 
	data_de_nascimento TEXT, 
	endereco TEXT
);
DROP TABLE Curso
UPDATE Curso SET codigo='330' WHERE ID=3
--UPDATE Curso SET instituicao='UNP' WHERE ID=3 AND ID=4 AND ID=5 AND ID=6 AND ID=7
UPDATE Curso SET instituicao='unp'


INSERT INTO Curso (codigo, nome, instituicao, duracao) VALUES (105,'Matemática', 'UFRN', 60);
INSERT INTO Curso (codigo, nome, instituicao, duracao) VALUES (115,'Matemática', 'UFRJ', 60);
INSERT INTO Curso (codigo, nome, instituicao) VALUES (185,'TADS','UFRN');
INSERT INTO Curso (codigo, nome, instituicao) VALUES (225,'Gastronomia','UNI-RN');	
INSERT INTO Curso (codigo, nome, instituicao, duracao) VALUES (145,'Agropecuária','UNP',45);


SELECT *
FROM Curso
ORDER BY ID