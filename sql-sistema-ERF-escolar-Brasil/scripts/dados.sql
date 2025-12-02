-- ============================================
-- INSERÇÃO DE DADOS - ALUNOS
-- ============================================
INSERT INTO `sistema_escolar`.`aluno` (`cpf`, `nome`, `data_nascimento`, `foto_3x4`, `endereco`, `telefone`) VALUES 
('48877087854', 'Leonardo Lucas Silva', '2004-12-18', NULL, 'Rua das Palmeiras, 100', '11997385214'),
('92755413022', 'Mariana Alves Costa', '2005-03-05', NULL, 'Av. Brasil, 200', '11984221155'),
('31488977090', 'João Pedro Santos', '2004-08-12', NULL, 'Rua São Paulo, 300', '11992334455'),
('70155398010', 'Ana Clara Oliveira', '2005-10-22', NULL, 'Rua Central, 400', '11999228811'),
('10977366044', 'Carlos Eduardo Ferreira', '2004-01-17', NULL, 'Av. Paulista, 500', '11984557766'),
('55899044072', 'Julia Ferreira Rodrigues', '2005-11-09', NULL, 'Rua das Flores, 600', '11995544123'),
('88921433011', 'Gabriel Santos Lima', '2004-07-26', NULL, 'Rua Independência, 700', '11980113455'),
('33711899052', 'Luiza Moraes Barbosa', '2005-04-04', NULL, 'Av. Santos, 800', '11997766422'),
('66400222877', 'Eduardo Lima Pereira', '2004-09-30', NULL, 'Rua Rio Branco, 900', '11988556644'),
('22049877001', 'Sofia Cardoso Martins', '2005-06-14', NULL, 'Av. Getúlio Vargas, 1000', '11990023411');

-- ============================================
-- INSERÇÃO DE DADOS - TURMAS
-- ============================================
INSERT INTO `sistema_escolar`.`turma` (`nome_turma`, `capacidade_maxima`, `ano_letivo`, `periodo`) VALUES
('8º Ano A', 30, 2025, 'Matutino'),
('8º Ano B', 30, 2025, 'Vespertino'),
('9º Ano A', 30, 2025, 'Matutino'),
('9º Ano B', 30, 2025, 'Vespertino'),
('1º Ano EM A', 30, 2025, 'Matutino'),
('1º Ano EM B', 30, 2025, 'Vespertino'),
('2º Ano EM A', 30, 2025, 'Matutino'),
('2º Ano EM B', 30, 2025, 'Vespertino'),
('3º Ano EM A', 30, 2025, 'Matutino'),
('3º Ano EM B', 30, 2025, 'Vespertino');

-- ============================================
-- INSERÇÃO DE DADOS - MATRÍCULAS
-- ============================================
-- Matrículas para 8º Ano A (alunos 1-10 matriculados em dezembro de 2024)
INSERT INTO `sistema_escolar`.`matricula` (`id_aluno`, `id_turma`, `data_matricula`, `status`) VALUES
(1, 1, '2024-12-01', 'Ativa'),
(2, 1, '2024-12-01', 'Ativa'),
(3, 1, '2024-12-01', 'Ativa'),
(4, 1, '2024-12-02', 'Ativa'),
(5, 1, '2024-12-02', 'Ativa'),
(6, 1, '2024-12-03', 'Ativa'),
(7, 1, '2024-12-03', 'Ativa'),
(8, 1, '2024-12-04', 'Ativa'),
(9, 1, '2024-12-04', 'Ativa'),
(10, 1, '2024-12-05', 'Ativa');

-- ============================================
-- INSERÇÃO DE DADOS - DISCIPLINAS
-- ============================================
INSERT INTO `sistema_escolar`.`disciplina` (`nome_disciplina`, `carga_horaria`, `ementa`) VALUES
('Português', 160, 'Gramática, literatura brasileira, produção textual e interpretação de textos'),
('Matemática', 160, 'Álgebra, geometria, estatística e probabilidade'),
('Geografia', 80, 'Geografia física, humana, cartografia e geopolítica'),
('História', 80, 'História do Brasil e mundial, desde a antiguidade até contemporaneidade'),
('Ciências', 120, 'Física, química e biologia introdutórias para ensino fundamental'),
('Artes', 80, 'Artes visuais, música, teatro e expressão artística'),
('Física', 120, 'Mecânica, termodinâmica, óptica e eletromagnetismo'),
('Química', 120, 'Química geral, físico-química e química orgânica'),
('Educação Física', 80, 'Esportes, jogos, atividades físicas e qualidade de vida'),
('Inglês', 80, 'Gramática, conversação, leitura e escrita em inglês');

-- ============================================
-- INSERÇÃO DE DADOS - FUNCIONÁRIOS
-- ============================================
INSERT INTO `sistema_escolar`.`funcionario` (`cpf`, `nome`, `data_nascimento`, `cargo`, `departamento`, `data_admissao`, `formacao_academica`, `telefone`, `email`) VALUES
('12345678901', 'Roberto Carlos Mendes', '1975-03-15', 'Diretor', 'Administração', '2023-12-01', 'Pedagogia com especialização em Gestão Escolar', '11991234567', 'diretor@escola.com'),
('23456789012', 'Maria José Silva', '1985-07-22', 'Agente Escolar', 'Secretaria', '2024-01-10', 'Administração', '11992345678', 'agente@escola.com'),
('34567890123', 'Sandra Regina Santos', '1980-11-08', 'Faxineira', 'Serviços Gerais', '2024-02-01', 'Ensino Médio Completo', '11993456789', 'limpeza@escola.com'),
('45678901234', 'Ana Paula Rodrigues', '1982-05-12', 'Professor', 'Ensino Fundamental e Médio', '2024-01-15', 'Letras - Português e Literatura', '11994567890', 'portugues@escola.com'),
('56789012345', 'Carlos Alberto Ferreira', '1978-09-20', 'Professor', 'Ensino Fundamental e Médio', '2023-12-10', 'Matemática com mestrado', '11995678901', 'matematica@escola.com'),
('67890123456', 'Juliana Costa Lima', '1985-02-18', 'Professor', 'Ensino Fundamental e Médio', '2024-02-05', 'Geografia com especialização', '11996789012', 'geografia@escola.com'),
('78901234567', 'Fernando Santos Oliveira', '1980-12-03', 'Professor', 'Ensino Fundamental e Médio', '2024-01-20', 'História com mestrado', '11997890123', 'historia@escola.com'),
('89012345678', 'Patricia Alves Martins', '1983-08-25', 'Professor', 'Ensino Fundamental', '2024-02-10', 'Ciências Biológicas', '11998901234', 'ciencias@escola.com'),
('90123456789', 'Ricardo Mendes Barbosa', '1979-04-17', 'Professor', 'Ensino Fundamental e Médio', '2024-01-25', 'Educação Artística', '11999012345', 'artes@escola.com'),
('01234567890', 'André Luiz Pereira', '1981-06-30', 'Professor', 'Ensino Médio', '2023-12-15', 'Física com doutorado', '11990123456', 'fisica@escola.com'),
('11223344556', 'Claudia Souza Costa', '1984-10-14', 'Professor', 'Ensino Médio', '2024-01-18', 'Química com mestrado', '11991234568', 'quimica@escola.com'),
('22334455667', 'Marcos Paulo Silva', '1977-01-22', 'Professor', 'Ensino Fundamental e Médio', '2024-02-08', 'Educação Física', '11992345679', 'edfisica@escola.com'),
('33445566778', 'Luciana Ferreira Gomes', '1986-03-09', 'Professor', 'Ensino Fundamental e Médio', '2024-01-12', 'Letras - Inglês', '11993456780', 'ingles@escola.com');

-- ============================================
-- INSERÇÃO DE DADOS - DISCIPLINA_TURMA
-- ============================================
-- Vinculando disciplinas às turmas (8º e 9º ano: Português, Matemática, Geografia, História, Ciências, Artes, Ed. Física, Inglês)
-- Ensino Médio: todas as 10 disciplinas
INSERT INTO `sistema_escolar`.`disciplina_turma` (`id_disciplina`, `id_turma`) VALUES
-- 8º Ano A e B
(1, 1), (2, 1), (3, 1), (4, 1), (5, 1), (6, 1), (9, 1), (10, 1),
(1, 2), (2, 2), (3, 2), (4, 2), (5, 2), (6, 2), (9, 2), (10, 2),
-- 9º Ano A e B
(1, 3), (2, 3), (3, 3), (4, 3), (5, 3), (6, 3), (9, 3), (10, 3),
(1, 4), (2, 4), (3, 4), (4, 4), (5, 4), (6, 4), (9, 4), (10, 4),
-- 1º Ano EM A e B (todas as disciplinas)
(1, 5), (2, 5), (3, 5), (4, 5), (6, 5), (7, 5), (8, 5), (9, 5), (10, 5),
(1, 6), (2, 6), (3, 6), (4, 6), (6, 6), (7, 6), (8, 6), (9, 6), (10, 6),
-- 2º Ano EM A e B (todas as disciplinas)
(1, 7), (2, 7), (3, 7), (4, 7), (6, 7), (7, 7), (8, 7), (9, 7), (10, 7),
(1, 8), (2, 8), (3, 8), (4, 8), (6, 8), (7, 8), (8, 8), (9, 8), (10, 8),
-- 3º Ano EM A e B (todas as disciplinas)
(1, 9), (2, 9), (3, 9), (4, 9), (6, 9), (7, 9), (8, 9), (9, 9), (10, 9),
(1, 10), (2, 10), (3, 10), (4, 10), (6, 10), (7, 10), (8, 10), (9, 10), (10, 10);

-- ============================================
-- INSERÇÃO DE DADOS - DISCIPLINA_FUNCIONARIO
-- ============================================
-- Vinculando professores às disciplinas no ano letivo 2025
INSERT INTO `sistema_escolar`.`disciplina_funcionario` (`id_funcionario`, `id_disciplina`, `ano_letivo`) VALUES
(4, 1, 2025),   -- Ana Paula - Português
(5, 2, 2025),   -- Carlos Alberto - Matemática
(6, 3, 2025),   -- Juliana Costa - Geografia
(7, 4, 2025),   -- Fernando Santos - História
(8, 5, 2025),   -- Patricia Alves - Ciências
(9, 6, 2025),   -- Ricardo Mendes - Artes
(10, 7, 2025),  -- André Luiz - Física
(11, 8, 2025),  -- Claudia Souza - Química
(12, 9, 2025),  -- Marcos Paulo - Educação Física
(13, 10, 2025); -- Luciana Ferreira - Inglês

-- ============================================
-- INSERÇÃO DE DADOS - NOTAS
-- ============================================
-- Notas dos alunos da turma 8º Ano A (id_turma = 1) no 1º Bimestre de 2025
INSERT INTO `sistema_escolar`.`nota` (`id_matricula`, `id_disciplina`, `nota_valor`, `bimestre`, `anotacoes`) VALUES
-- Aluno 1 (Leonardo) - Matrícula 1
(1, 1, 8.5, '1º Bimestre', 'Boa interpretação textual'),
(1, 2, 7.0, '1º Bimestre', 'Precisa revisar frações'),
(1, 3, 8.0, '1º Bimestre', 'Excelente participação'),
(1, 4, 7.5, '1º Bimestre', 'Bom conhecimento histórico'),
(1, 5, 9.0, '1º Bimestre', 'Destaque em experimentos'),
-- Aluno 2 (Mariana) - Matrícula 2
(2, 1, 9.0, '1º Bimestre', 'Excelente redação'),
(2, 2, 8.5, '1º Bimestre', 'Ótimo raciocínio lógico'),
(2, 3, 7.5, '1º Bimestre', 'Bom desempenho'),
(2, 4, 8.0, '1º Bimestre', 'Boa análise histórica'),
(2, 5, 8.0, '1º Bimestre', 'Muito bom'),
-- Aluno 3 (João Pedro) - Matrícula 3
(3, 1, 7.0, '1º Bimestre', 'Regular'),
(3, 2, 6.5, '1º Bimestre', 'Deve estudar mais'),
(3, 3, 7.0, '1º Bimestre', 'Satisfatório'),
(3, 4, 6.0, '1º Bimestre', 'Precisa melhorar'),
(3, 5, 7.5, '1º Bimestre', 'Bom'),
-- Aluno 4 (Ana Clara) - Matrícula 4
(4, 1, 8.0, '1º Bimestre', 'Boa escrita'),
(4, 2, 9.5, '1º Bimestre', 'Excelente em matemática'),
(4, 3, 8.5, '1º Bimestre', 'Muito bom'),
(4, 4, 8.0, '1º Bimestre', 'Bom desempenho'),
(4, 5, 9.0, '1º Bimestre', 'Ótima aluna'),
-- Aluno 5 (Carlos Eduardo) - Matrícula 5
(5, 1, 6.5, '1º Bimestre', 'Precisa ler mais'),
(5, 2, 7.5, '1º Bimestre', 'Bom'),
(5, 3, 7.0, '1º Bimestre', 'Regular'),
(5, 4, 7.5, '1º Bimestre', 'Satisfatório'),
(5, 5, 8.0, '1º Bimestre', 'Bom desempenho'),
-- Aluno 6 (Julia) - Matrícula 6
(6, 1, 9.5, '1º Bimestre', 'Excelente domínio da língua'),
(6, 2, 8.0, '1º Bimestre', 'Muito bom'),
(6, 3, 8.5, '1º Bimestre', 'Ótima participação'),
(6, 4, 9.0, '1º Bimestre', 'Excelente'),
(6, 5, 8.5, '1º Bimestre', 'Muito bom'),
-- Aluno 7 (Gabriel) - Matrícula 7
(7, 1, 7.5, '1º Bimestre', 'Bom'),
(7, 2, 6.0, '1º Bimestre', 'Precisa de reforço'),
(7, 3, 6.5, '1º Bimestre', 'Regular'),
(7, 4, 7.0, '1º Bimestre', 'Satisfatório'),
(7, 5, 7.5, '1º Bimestre', 'Bom'),
-- Aluno 8 (Luiza) - Matrícula 8
(8, 1, 8.5, '1º Bimestre', 'Ótima redação'),
(8, 2, 9.0, '1º Bimestre', 'Excelente'),
(8, 3, 8.0, '1º Bimestre', 'Muito bom'),
(8, 4, 8.5, '1º Bimestre', 'Ótimo desempenho'),
(8, 5, 9.5, '1º Bimestre', 'Destaque da turma'),
-- Aluno 9 (Eduardo) - Matrícula 9
(9, 1, 7.0, '1º Bimestre', 'Regular'),
(9, 2, 7.5, '1º Bimestre', 'Bom'),
(9, 3, 7.0, '1º Bimestre', 'Satisfatório'),
(9, 4, 6.5, '1º Bimestre', 'Pode melhorar'),
(9, 5, 8.0, '1º Bimestre', 'Bom desempenho'),
-- Aluno 10 (Sofia) - Matrícula 10
(10, 1, 8.0, '1º Bimestre', 'Boa aluna'),
(10, 2, 8.5, '1º Bimestre', 'Muito bom'),
(10, 3, 9.0, '1º Bimestre', 'Excelente'),
(10, 4, 8.5, '1º Bimestre', 'Ótimo'),
(10, 5, 8.0, '1º Bimestre', 'Muito bom');

