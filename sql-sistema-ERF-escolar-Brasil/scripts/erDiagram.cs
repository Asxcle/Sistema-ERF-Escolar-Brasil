erDiagram
    ALUNO ||--o{ MATRICULA : "possui"
    ALUNO {
        INT id_aluno PK
        VARCHAR cpf UK
        VARCHAR nome
        DATE data_nascimento
        BLOB foto_3x4
        VARCHAR endereco
        VARCHAR telefone
    }
   
    MATRICULA }o--|| TURMA : "vincula"
    MATRICULA ||--o{ NOTA : "contem"
    MATRICULA {
        INT id_matricula PK
        INT id_aluno FK
        INT id_turma FK
        DATE data_matricula
        VARCHAR status
    }
   
    TURMA ||--o{ DISCIPLINA_TURMA : "possui"
    TURMA {
        INT id_turma PK
        VARCHAR nome_turma
        INT capacidade_maxima
        INT ano_letivo
        VARCHAR periodo
    }
   
    DISCIPLINA_TURMA }o--|| DISCIPLINA : "vincula"
    DISCIPLINA_TURMA ||--o{ DISCIPLINA_FUNCIONARIO : "atribuida_a"
    DISCIPLINA_TURMA {
        INT id_disc_turma PK
        INT id_disciplina FK
        INT id_turma FK
    }
   
    DISCIPLINA ||--o{ NOTA : "referente_a"
    DISCIPLINA {
        INT id_disciplina PK
        VARCHAR nome_disciplina
        INT carga_horaria
        TEXT ementa
    }
   
    NOTA }o--|| DISCIPLINA : "gera"
    NOTA {
        INT id_nota PK
        INT id_matricula FK
        INT id_disciplina FK
        DECIMAL nota_valor
        VARCHAR bimestre
        TEXT anotacoes
        BLOB redacao_digitalizada
    }
   
    DISCIPLINA_FUNCIONARIO }o--|| FUNCIONARIO : "leciona"
    DISCIPLINA_FUNCIONARIO {
        INT id_disc_func PK
        INT id_funcionario FK
        INT id_disciplina FK
        INT ano_letivo
    }
   
    FUNCIONARIO {
        INT id_funcionario PK
        VARCHAR cpf UK
        VARCHAR nome
        DATE data_nascimento
        VARCHAR cargo
        VARCHAR departamento
        DATE data_admissao
        TEXT formacao_academica
        BLOB curriculo
        VARCHAR telefone
        VARCHAR email
    }
