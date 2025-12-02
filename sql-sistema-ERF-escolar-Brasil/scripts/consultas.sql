-- ============================================
-- CONSULTAS SQL - Sistema de Gestão Escolar
-- ============================================

-- ============================================
-- CONSULTAS SELECT
-- ============================================

-- 1. listar todos os alunos matriculados na turma "8º Ano A"
SELECT 
    a.nome, 
    a.cpf, 
    t.nome_turma, 
    m.data_matricula,
    m.status
FROM ALUNO a
INNER JOIN MATRICULA m ON a.id_aluno = m.id_aluno
INNER JOIN TURMA t ON m.id_turma = t.id_turma
WHERE t.nome_turma LIKE '%8º Ano A%' 
ORDER BY a.nome;


-- 2. Mostrar as 5 melhores notas em Matemática do 1º Bimestre
SELECT 
    a.nome AS aluno,
    d.nome_disciplina,
    n.nota_valor,
    n.bimestre,
    t.nome_turma
FROM NOTA n
INNER JOIN MATRICULA m ON n.id_matricula = m.id_matricula
INNER JOIN ALUNO a ON m.id_aluno = a.id_aluno
INNER JOIN DISCIPLINA d ON n.id_disciplina = d.id_disciplina
INNER JOIN TURMA t ON m.id_turma = t.id_turma
WHERE d.nome_disciplina = 'Matemática' AND n.bimestre = '1º Bimestre'
ORDER BY n.nota_valor DESC
LIMIT 5;

-- 3. Listar todos os professores com suas disciplinas e departamento
SELECT 
    f.nome AS professor,
    f.cargo,
    f.departamento,
    d.nome_disciplina,
    df.ano_letivo,
    f.email
FROM FUNCIONARIO f
INNER JOIN DISCIPLINA_FUNCIONARIO df ON f.id_funcionario = df.id_funcionario
INNER JOIN DISCIPLINA d ON df.id_disciplina = d.id_disciplina
WHERE f.cargo = 'Professor'
ORDER BY f.nome;

-- 4. Contar quantos alunos estão matriculados em cada turma
SELECT 
    t.nome_turma,
    t.ano_letivo,
    t.periodo,
    COUNT(m.id_matricula) AS total_alunos,
    t.capacidade_maxima,
    (t.capacidade_maxima - COUNT(m.id_matricula)) AS vagas_restantes
FROM TURMA t
LEFT JOIN MATRICULA m ON t.id_turma = m.id_turma AND m.status = 'Ativa'
GROUP BY t.id_turma, t.nome_turma, t.ano_letivo, t.periodo, t.capacidade_maxima
ORDER BY t.nome_turma;

-- 5. Listar disciplinas com carga horária superior a 100 horas e suas turmas
SELECT 
    d.nome_disciplina,
    d.carga_horaria,
    d.ementa,
    t.nome_turma,
    t.ano_letivo
FROM DISCIPLINA d
INNER JOIN DISCIPLINA_TURMA dt ON d.id_disciplina = dt.id_disciplina
INNER JOIN TURMA t ON dt.id_turma = t.id_turma
WHERE d.carga_horaria > 100
ORDER BY d.carga_horaria DESC, d.nome_disciplina;

-- ============================================
-- COMANDOS UPDATE
-- ============================================

-- 1. Atualizar o status de matrícula de um aluno específico para 'Trancada'
UPDATE MATRICULA
SET status = 'Trancada'
WHERE id_aluno = 3 AND id_turma = 1;

-- 2. Aumentar a carga horária de disciplinas de Ciências em 20 horas
UPDATE DISCIPLINA
SET carga_horaria = carga_horaria + 20
WHERE nome_disciplina LIKE '%Ciências%' OR nome_disciplina LIKE '%Física%' OR nome_disciplina LIKE '%Química%';

-- 3. Atualizar o departamento de professores de línguas para 'Departamento de Linguagens'
UPDATE FUNCIONARIO
SET departamento = 'Departamento de Linguagens'
WHERE cargo = 'Professor' 
AND (formacao_academica LIKE '%Português%' OR formacao_academica LIKE '%Inglês%');

-- ============================================
-- COMANDOS DELETE
-- ============================================
- Desabilitar temporariamente o safe update mode
SET SQL_SAFE_UPDATES = 0;

-- 1. Remover notas associadas a um aluno específico
DELETE FROM `sistema_escolar`.`nota` WHERE (`id_nota` = '1');

-- 2. Deletar um funcionário específico (ID 3)
DELETE FROM `sistema_escolar`.`funcionario` WHERE (`id_funcionario` = '3');


-- 3.   Deletar um aluno específico (ID 10)
DELETE FROM `sistema_escolar`.`aluno` WHERE (`id_aluno` = '10');


-- Reabilitar o safe update mode
SET SQL_SAFE_UPDATES = 1;
