-- 1.)
CREATE TABLE IF NOT EXISTS Curso(
	id SERIAL PRIMARY KEY,
	codigo TEXT NOT NULL,
	nome TEXT NOT NULL,
	instituicao TEXT NOT NULL,
	duracao INT DEFAULT 0,
	ativo BOOLEAN
);

-- 2.)
INSERT INTO Curso(codigo, nome, instituicao, duracao, ativo) VALUES ('FIS001', 'Física', 'UFRN', 4, TRUE);
INSERT INTO Curso(codigo, nome, instituicao, duracao, ativo) VALUES ('FIS112', 'Física', 'UNP', 4, '1');
INSERT INTO Curso(codigo, nome, instituicao, duracao, ativo) VALUES ('TADS01', 'TADS', 'UFRN', 3, TRUE);
INSERT INTO Curso(codigo, nome, instituicao, duracao, ativo) VALUES ('ENG001', 'Engenharia da Computação', 'UFRN', 4, TRUE);
INSERT INTO Curso(codigo, nome, instituicao, duracao, ativo) VALUES ('TEA002', 'Teatro', 'UFRN', 4, FALSE);

-- 3.)
CREATE TABLE IF NOT EXISTS Aluno(
	id SERIAL PRIMARY KEY,
	nome TEXT,
	sobrenome TEXT,
	data_nascimento DATE,
	endereco TEXT
);

-- 4.)
INSERT INTO Aluno(nome, sobrenome, data_nascimento, endereco) VALUES ('Gilneide', 'Felix', '1999-12-19', 'Pajuçara');
INSERT INTO Aluno(nome, sobrenome, data_nascimento, endereco) VALUES ('André V', 'Germano', '2005-08-08', 'Nova Parnamirim');
INSERT INTO Aluno(nome, sobrenome, data_nascimento, endereco) VALUES ('Luan', 'Verissimo', '2005-10-16', 'Novo Amarante');
INSERT INTO Aluno(nome, sobrenome, data_nascimento) VALUES ('Andrew', 'Germany', '1255-02-15');
INSERT INTO Aluno(nome, data_nascimento, endereco) VALUES ('André', '1500-05-04', 'Nova Parnamirim');
INSERT INTO Aluno(nome, sobrenome, data_nascimento) VALUES ('André L', 'Curvelo', '2005-07-07');
INSERT INTO Aluno(nome, sobrenome, data_nascimento, endereco) VALUES ('Gilneide', 'Feliz', '1999-11-19', 'Pajusara');
INSERT INTO Aluno(nome, sobrenome, data_nascimento, endereco) VALUES ('Danny', 'Querino', '2000-05-18', 'Felipe Camarão');
INSERT INTO Aluno(nome, sobrenome, data_nascimento, endereco) VALUES ('Paulo', 'Almeida', '2004-10-07', 'Abel Cabral');
INSERT INTO Aluno(nome, sobrenome, data_nascimento, endereco) VALUES ('Paulo', 'Abrantes', '2003-11-08', 'Maria Lacerda');

-- 5.)
CREATE TABLE IF NOT EXISTS CursoAluno(
	ativo BOOLEAN,
	id_aluno INT,
	id_curso INT,
	PRIMARY KEY(id_aluno, id_curso),
	FOREIGN KEY (id_aluno) REFERENCES Aluno(id),
	FOREIGN KEY (id_curso) REFERENCES Curso(id) ON DELETE CASCADE
);

-- 6.)
INSERT INTO CursoAluno(ativo, id_aluno, id_curso) VALUES (true, (SELECT id FROM Aluno WHERE nome='Luan' AND sobrenome='Verissimo'), (SELECT id FROM Curso WHERE nome='TADS' AND instituicao='UFRN'));
INSERT INTO CursoAluno(ativo, id_aluno, id_curso) VALUES (true, (SELECT id FROM Aluno WHERE nome='Danny' AND sobrenome='Querino'), (SELECT id FROM Curso WHERE nome='TADS' AND instituicao='UFRN'));
INSERT INTO CursoAluno(ativo, id_aluno, id_curso) VALUES (true, (SELECT id FROM Aluno WHERE nome='André V' AND data_nascimento='2005-08-08'), (SELECT id FROM Curso WHERE nome='TADS' AND instituicao='UFRN'));
INSERT INTO CursoAluno(ativo, id_aluno, id_curso) VALUES (true, (SELECT id FROM Aluno WHERE nome='André V' AND data_nascimento='2005-08-08'), (SELECT id FROM Curso WHERE nome='Teatro' AND instituicao='UFRN'));
INSERT INTO CursoAluno(ativo, id_aluno, id_curso) VALUES (true, (SELECT id FROM Aluno WHERE nome='Gilneide' AND data_nascimento='1999-12-19'), (SELECT id FROM Curso WHERE nome='Física' AND instituicao='UFRN'));
INSERT INTO CursoAluno(ativo, id_aluno, id_curso) VALUES (true, (SELECT id FROM Aluno WHERE nome='Gilneide' AND data_nascimento='1999-12-19'), (SELECT id FROM Curso WHERE nome='TADS' AND instituicao='UFRN'));
INSERT INTO CursoAluno(ativo, id_aluno, id_curso) VALUES (true, (SELECT id FROM Aluno WHERE nome='Paulo' AND data_nascimento='2004-10-07'), (SELECT id FROM Curso WHERE nome='Engenharia da Computação' AND instituicao='UFRN'));
INSERT INTO CursoAluno(ativo, id_aluno, id_curso) VALUES (true, (SELECT id FROM Aluno WHERE nome='Andrew' AND data_nascimento='1255-02-15'), (SELECT id FROM Curso WHERE nome='Física' AND instituicao='UNP'));
INSERT INTO CursoAluno(ativo, id_aluno, id_curso) VALUES (true, (SELECT id FROM Aluno WHERE nome='Danny' AND data_nascimento='2000-05-18'), (SELECT id FROM Curso WHERE nome='Física' AND instituicao='UFRN'));
INSERT INTO CursoAluno(ativo, id_aluno, id_curso) VALUES (true, (SELECT id FROM Aluno WHERE nome='Luan' AND data_nascimento='2005-10-16'), (SELECT id FROM Curso WHERE nome='Teatro' AND instituicao='UFRN'));

-- 7.)
UPDATE Curso SET duracao=2475 WHERE nome='TADS'

-- 8.)
DELETE FROM Curso WHERE id=4

-- 9.)
SELECT nome
From Aluno
Where nome LIKE '%Carla%' 

-- Extra.)
SELECT nome, id
FROM Aluno
WHERE nome LIKE '%And%' OR nome LIKE 'Gil%'
ORDER BY id DESC

-- 10.)
SELECT A.nome
FROM Aluno A
WHERE A.id IN (
    SELECT id_aluno
    FROM CursoAluno C
    WHERE ativo = true
    GROUP BY id_aluno
    HAVING COUNT(id_aluno) > 1
);

-- 11.)
SELECT duracao AS media
FROM 

10. Selecionar os nomes dos alunos que estão cursando mais de um curso ativo
11. Selecionar o valor médio de duração dos cursos da instituição de ensino
12. Selecionar os cursos com menor e maior duração




