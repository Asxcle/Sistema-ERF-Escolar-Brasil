-- ============================================
-- Script de Criação do Banco de Dados
-- Sistema de Gestão Escolar
-- ============================================

-- Criar banco de dados (opcional)
CREATE DATABASE IF NOT EXISTS sistema_escolar;
USE sistema_escolar;

-- ============================================
-- Tabela: ALUNO
-- ============================================
CREATE TABLE ALUNO (
    id_aluno INT AUTO_INCREMENT PRIMARY KEY,
    cpf VARCHAR(14) UNIQUE NOT NULL,
    nome VARCHAR(100) NOT NULL,
    data_nascimento DATE NOT NULL,
    foto_3x4 BLOB,
    endereco VARCHAR(255),
    telefone VARCHAR(20)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ============================================
-- Tabela: TURMA
-- ============================================
CREATE TABLE TURMA (
    id_turma INT AUTO_INCREMENT PRIMARY KEY,
    nome_turma VARCHAR(50) NOT NULL,
    capacidade_maxima INT NOT NULL,
    ano_letivo INT NOT NULL,
    periodo VARCHAR(20)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ============================================
-- Tabela: MATRICULA
-- ============================================
CREATE TABLE MATRICULA (
    id_matricula INT AUTO_INCREMENT PRIMARY KEY,
    id_aluno INT NOT NULL,
    id_turma INT NOT NULL,
    data_matricula DATE NOT NULL,
    status VARCHAR(20) DEFAULT 'Ativa',
    FOREIGN KEY (id_aluno) REFERENCES ALUNO(id_aluno) ON DELETE CASCADE,
    FOREIGN KEY (id_turma) REFERENCES TURMA(id_turma) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ============================================
-- Tabela: DISCIPLINA
-- ============================================
CREATE TABLE DISCIPLINA (
    id_disciplina INT AUTO_INCREMENT PRIMARY KEY,
    nome_disciplina VARCHAR(100) NOT NULL,
    carga_horaria INT NOT NULL,
    ementa TEXT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ============================================
-- Tabela: DISCIPLINA_TURMA
-- ============================================
CREATE TABLE DISCIPLINA_TURMA (
    id_disc_turma INT AUTO_INCREMENT PRIMARY KEY,
    id_disciplina INT NOT NULL,
    id_turma INT NOT NULL,
    FOREIGN KEY (id_disciplina) REFERENCES DISCIPLINA(id_disciplina) ON DELETE CASCADE,
    FOREIGN KEY (id_turma) REFERENCES TURMA(id_turma) ON DELETE CASCADE,
    UNIQUE KEY uk_disciplina_turma (id_disciplina, id_turma)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ============================================
-- Tabela: FUNCIONARIO
-- ============================================
CREATE TABLE FUNCIONARIO (
    id_funcionario INT AUTO_INCREMENT PRIMARY KEY,
    cpf VARCHAR(14) UNIQUE NOT NULL,
    nome VARCHAR(100) NOT NULL,
    data_nascimento DATE NOT NULL,
    cargo VARCHAR(50),
    departamento VARCHAR(50),
    data_admissao DATE,
    formacao_academica TEXT,
    curriculo BLOB,
    telefone VARCHAR(20),
    email VARCHAR(100)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ============================================
-- Tabela: DISCIPLINA_FUNCIONARIO
-- ============================================
CREATE TABLE DISCIPLINA_FUNCIONARIO (
    id_disc_func INT AUTO_INCREMENT PRIMARY KEY,
    id_funcionario INT NOT NULL,
    id_disciplina INT NOT NULL,
    ano_letivo INT NOT NULL,
    FOREIGN KEY (id_funcionario) REFERENCES FUNCIONARIO(id_funcionario) ON DELETE CASCADE,
    FOREIGN KEY (id_disciplina) REFERENCES DISCIPLINA(id_disciplina) ON DELETE CASCADE,
    UNIQUE KEY uk_func_disc_ano (id_funcionario, id_disciplina, ano_letivo)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ============================================
-- Tabela: NOTA
-- ============================================
CREATE TABLE NOTA (
    id_nota INT AUTO_INCREMENT PRIMARY KEY,
    id_matricula INT NOT NULL,
    id_disciplina INT NOT NULL,
    nota_valor DECIMAL(5,2),
    bimestre VARCHAR(20),
    anotacoes TEXT,
    redacao_digitalizada BLOB,
    FOREIGN KEY (id_matricula) REFERENCES MATRICULA(id_matricula) ON DELETE CASCADE,
    FOREIGN KEY (id_disciplina) REFERENCES DISCIPLINA(id_disciplina) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ============================================
-- Índices adicionais para otimização
-- ============================================
CREATE INDEX idx_aluno_cpf ON ALUNO(cpf);
CREATE INDEX idx_funcionario_cpf ON FUNCIONARIO(cpf);
CREATE INDEX idx_matricula_aluno ON MATRICULA(id_aluno);
CREATE INDEX idx_matricula_turma ON MATRICULA(id_turma);
CREATE INDEX idx_nota_matricula ON NOTA(id_matricula);
CREATE INDEX idx_nota_disciplina ON NOTA(id_disciplina);