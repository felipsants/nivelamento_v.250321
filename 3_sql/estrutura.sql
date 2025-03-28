CREATE TABLE operadores_ativos (
    registro_ans INTEGER PRIMARY KEY NOT NULL,
    cnpj VARCHAR(14) NOT NULL,
    razao_social VARCHAR(255) NOT NULL,
    nome_fantasia VARCHAR(255),
    modalidade VARCHAR(100) NOT NULL,
    logradouro VARCHAR(255) NOT NULL,
    numero VARCHAR(100) NOT NULL default 'S/N',
    complemento VARCHAR(255),
    bairro VARCHAR(100) NOT NULL,
    cidade VARCHAR(100) NOT NULL,
    uf CHAR(2) NOT NULL,
    cep VARCHAR(9) NOT NULL,
    ddd CHAR(2),
    telefone VARCHAR(11),
    fax VARCHAR(15),
    endereco_eletronico VARCHAR(255),
    representante VARCHAR(255) NOT NULL,
    cargo_representante VARCHAR(255) NOT NULL,
    regiao INTEGER,
    data_registro_ans DATE NOT NULL
);

CREATE TABLE demonstracoes_contabeis(
    data DATE,
    trimestre INT NOT NULL CHECK (trimestre BETWEEN 1 AND 4),
    reg_ans INTEGER NOT NULL,
    cd_conta_contabil VARCHAR(9) NOT NULL,
    descricao VARCHAR(255),
    vl_saldo_inicial DECIMAL(12,2) NOT NULL,
    vl_saldo_final DECIMAL (12,2) NOT NULL,
    FOREIGN KEY (reg_ans) REFERENCES operadores_ativos(registro_ans)
)