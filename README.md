# Sistema de Gestão Escolar - Banco de Dados

## 📋 Descrição do Projeto

Sistema de banco de dados relacional desenvolvido para gerenciar informações acadêmicas de uma instituição de ensino, incluindo alunos, funcionários, turmas, disciplinas, matrículas e notas.

## 🎯 Objetivo

Criar uma estrutura de banco de dados completa e funcional para administrar:
- Cadastro de alunos e funcionários
- Gestão de turmas e disciplinas
- Controle de matrículas
- Registro de notas e avaliações
- Vínculo entre professores e disciplinas

## 🗂️ Estrutura do Projeto

```
BDFACULDADE/
│
├── Banco.sql           # Script de criação das tabelas e estrutura do banco
├── dados.sql           # Scripts de inserção de dados de exemplo
├── consultas.sql       # Consultas SELECT, UPDATE e DELETE
└── README.md           # Documentação do projeto
```

## 🗄️ Estrutura do Banco de Dados

### Tabelas Principais

#### 1. **ALUNO**
Armazena informações dos estudantes matriculados.

**Campos:**
- `id_aluno` (PK, AUTO_INCREMENT)
- `cpf` (UNIQUE, NOT NULL)
- `nome` (NOT NULL)
- `data_nascimento` (NOT NULL)
- `foto_3x4` (BLOB)
- `endereco`
- `telefone`

#### 2. **TURMA**
Cadastro de turmas disponíveis na escola.

**Campos:**
- `id_turma` (PK, AUTO_INCREMENT)
- `nome_turma` (NOT NULL)
- `capacidade_maxima` (NOT NULL)
- `ano_letivo` (NOT NULL)
- `periodo`

#### 3. **MATRICULA**
Relaciona alunos às turmas.

**Campos:**
- `id_matricula` (PK, AUTO_INCREMENT)
- `id_aluno` (FK → ALUNO)
- `id_turma` (FK → TURMA)
- `data_matricula` (NOT NULL)
- `status` (DEFAULT 'Ativa')

#### 4. **DISCIPLINA**
Cadastro das disciplinas oferecidas.

**Campos:**
- `id_disciplina` (PK, AUTO_INCREMENT)
- `nome_disciplina` (NOT NULL)
- `carga_horaria` (NOT NULL)
- `ementa`

#### 5. **DISCIPLINA_TURMA**
Relaciona disciplinas com turmas.

**Campos:**
- `id_disc_turma` (PK, AUTO_INCREMENT)
- `id_disciplina` (FK → DISCIPLINA)
- `id_turma` (FK → TURMA)
- UNIQUE: (id_disciplina, id_turma)

#### 6. **FUNCIONARIO**
Cadastro de funcionários da escola.

**Campos:**
- `id_funcionario` (PK, AUTO_INCREMENT)
- `cpf` (UNIQUE, NOT NULL)
- `nome` (NOT NULL)
- `data_nascimento` (NOT NULL)
- `cargo`
- `departamento`
- `data_admissao`
- `formacao_academica`
- `curriculo` (BLOB)
- `telefone`
- `email`

#### 7. **DISCIPLINA_FUNCIONARIO**
Relaciona professores com as disciplinas que lecionam.

**Campos:**
- `id_disc_func` (PK, AUTO_INCREMENT)
- `id_funcionario` (FK → FUNCIONARIO)
- `id_disciplina` (FK → DISCIPLINA)
- `ano_letivo` (NOT NULL)
- UNIQUE: (id_funcionario, id_disciplina, ano_letivo)

#### 8. **NOTA**
Registro de notas dos alunos.

**Campos:**
- `id_nota` (PK, AUTO_INCREMENT)
- `id_matricula` (FK → MATRICULA)
- `id_disciplina` (FK → DISCIPLINA)
- `nota_valor` (DECIMAL 5,2)
- `bimestre`
- `anotacoes`
- `redacao_digitalizada` (BLOB)

## 📊 Relacionamentos

```
ALUNO (1) ─────< (N) MATRICULA (N) >───── (1) TURMA
                       │
                       │ (N)
                       │
                       ▼ (1)
                    DISCIPLINA ────< (N) DISCIPLINA_TURMA
                       │
                       │ (N)
                       │
                       ▼ (1)
            DISCIPLINA_FUNCIONARIO >───── (1) FUNCIONARIO
```

## 🚀 Como Usar

### 1. Criar o Banco de Dados

Execute o arquivo `Banco.sql` no MySQL Workbench:

```sql
SOURCE caminho/para/Banco.sql;
```

Ou copie e execute o conteúdo do arquivo diretamente.

### 2. Popular com Dados de Exemplo

Execute o arquivo `dados.sql`:

```sql
SOURCE caminho/para/dados.sql;
```

**Dados incluídos:**
- 10 alunos
- 10 turmas (8º Ano A/B, 9º Ano A/B, 1º-3º Ano EM A/B)
- 10 disciplinas (Português, Matemática, Geografia, História, Ciências, Artes, Física, Química, Educação Física, Inglês)
- 13 funcionários (Diretor, Agente Escolar, Faxineira + 10 Professores)
- 10 matrículas
- 50 notas do 1º Bimestre
- Vínculos entre turmas-disciplinas e professores-disciplinas

### 3. Executar Consultas

O arquivo `consultas.sql` contém:

#### 📌 5 Consultas SELECT

1. **Listar todos os alunos matriculados na turma "8º Ano A"**
   - Retorna: nome, CPF, turma, data de matrícula e status
   - Ordenado alfabeticamente por nome

2. **Mostrar as 5 melhores notas em Matemática do 1º Bimestre**
   - Retorna: nome do aluno, disciplina, nota, bimestre e turma
   - Ordenado por nota decrescente
   - Limitado aos 5 primeiros resultados

3. **Listar todos os professores com suas disciplinas e departamento**
   - Retorna: nome do professor, cargo, departamento, disciplina, ano letivo e email
   - Filtra apenas funcionários com cargo "Professor"
   - Ordenado alfabeticamente por nome

4. **Contar quantos alunos estão matriculados em cada turma**
   - Retorna: nome da turma, ano letivo, período, total de alunos, capacidade máxima e vagas restantes
   - Considera apenas matrículas com status "Ativa"
   - Ordenado por nome da turma

5. **Listar disciplinas com carga horária superior a 100 horas e suas turmas**
   - Retorna: nome da disciplina, carga horária, ementa, turma e ano letivo
   - Filtra disciplinas com mais de 100 horas
   - Ordenado por carga horária (decrescente) e nome da disciplina

#### 📌 3 Comandos UPDATE

1. **Atualizar o status de matrícula de um aluno específico para 'Trancada'**
   - Altera o status da matrícula do aluno ID 3 na turma ID 1

2. **Aumentar a carga horária de disciplinas de Ciências em 20 horas**
   - Incrementa em 20 horas as disciplinas: Ciências, Física e Química
   - Usa operador `LIKE` para buscar por padrão no nome

3. **Atualizar o departamento de professores de línguas para 'Departamento de Linguagens'**
   - Altera o departamento de professores de Português e Inglês
   - Filtra por cargo "Professor" e formação acadêmica

#### 📌 3 Comandos DELETE

1. **Remover uma nota específica**
   - Deleta a nota com ID = 1
   - Remove um registro específico da tabela NOTA

2. **Deletar um funcionário específico**
   - Remove o funcionário com ID = 3
   - Remove completamente o registro da tabela FUNCIONARIO

3. **Deletar um aluno específico**
   - Remove o aluno com ID = 10
   - Remove completamente o registro da tabela ALUNO
   - **Atenção:** Devido às foreign keys com `ON DELETE CASCADE`, isso também remove automaticamente:
     - Todas as matrículas do aluno
     - Todas as notas associadas às matrículas

## 🔧 Requisitos

- **MySQL Server** 5.7 ou superior
- **MySQL Workbench** 8.0 ou superior (recomendado)
- **Sistema Operacional:** Windows, Linux ou macOS

## ⚙️ Configurações Importantes

### Safe Update Mode

O arquivo `consultas.sql` inclui comandos para desabilitar temporariamente o modo de segurança do MySQL:

```sql
SET SQL_SAFE_UPDATES = 0;
-- comandos DELETE/UPDATE
SET SQL_SAFE_UPDATES = 1;
```

Isso permite executar comandos DELETE e UPDATE sem exigir chave primária na cláusula WHERE.

## 📝 Observações

- Todos os CPFs são fictícios
- As datas dos registros estão entre dezembro de 2023 e dezembro de 2025
- O sistema contempla turmas do 8º ano do Ensino Fundamental ao 3º ano do Ensino Médio
- Cada turma tem capacidade para 30 alunos
- Os vínculos entre professores e disciplinas são anuais (ano letivo 2025)

## 🎓 Disciplinas Disponíveis

### Ensino Fundamental (8º e 9º ano)
- Português
- Matemática
- Geografia
- História
- Ciências
- Artes
- Educação Física
- Inglês

### Ensino Médio (1º ao 3º ano)
Todas as acima, mais:
- Física
- Química

## 👥 Cargos dos Funcionários

- **Diretor:** Responsável pela gestão escolar
- **Agente Escolar:** Responsável pela secretaria
- **Faxineira:** Serviços gerais
- **Professores:** Especializados por disciplina

## 🔍 Exemplos de Consultas

### Consulta 1: Alunos de uma turma específica
```sql
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
```

### Consulta 2: Top 5 notas em Matemática
```sql
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
```

### Update: Trancar matrícula de um aluno
```sql
UPDATE MATRICULA
SET status = 'Trancada'
WHERE id_aluno = 3 AND id_turma = 1;
```

### Delete: Remover um aluno (com cascade)
```sql
SET SQL_SAFE_UPDATES = 0;
DELETE FROM `sistema_escolar`.`aluno` WHERE (`id_aluno` = '10');
SET SQL_SAFE_UPDATES = 1;
```

## 📚 Tecnologias Utilizadas

- **SQL** - Linguagem de consulta estruturada
- **MySQL** - Sistema de gerenciamento de banco de dados
- **MySQL Workbench** - Interface gráfica para administração

## 📄 Licença

Projeto acadêmico desenvolvido para fins educacionais.

## 👨‍💻 Autor

Desenvolvido como projeto de Banco de Dados Faculdade.

---

**Data de criação:** Dezembro de 2025  
**Versão:** 1.0
