CREATE TABLE operadores_ativos (
    "Registro_Ans" INTEGER PRIMARY KEY NOT NULL,
    "Cnpj" VARCHAR(14) NOT NULL,
    "Razao_Social" VARCHAR(255) NOT NULL,
    "Nome_Fantasia" VARCHAR(255),
    "Modalidade" VARCHAR(100) NOT NULL,
    "Logradouro" VARCHAR(255) NOT NULL,
    "Numero" VARCHAR(100) NOT NULL DEFAULT 'S/N',
    "Complemento" VARCHAR(255),
    "Bairro" VARCHAR(100) NOT NULL,
    "Cidade" VARCHAR(100) NOT NULL,
    "Uf" CHAR(2) NOT NULL,
    "Cep" VARCHAR(9) NOT NULL,
    "Ddd" CHAR(2),
    "Telefone" VARCHAR(20),
    "Fax" VARCHAR(15),
    "Endereco_Eletronico" VARCHAR(255),
    "Representante" VARCHAR(255) NOT NULL,
    "Cargo_Representante" VARCHAR(255) NOT NULL,
    "Regiao" INTEGER,
    "Data_Registro_Ans" DATE NOT NULL
);

CREATE TABLE staging_demonstracoes (
    "DATA" DATE,  
    "REG_ANS" TEXT,
    "CD_CONTA_CONTABIL" TEXT,
    "DESCRICAO" TEXT,
    "VL_SALDO_INICIAL" TEXT, 
    "VL_SALDO_FINAL" TEXT
);

CREATE TABLE staging_4t2023 (
    "DATA" TEXT,  
    "REG_ANS" TEXT,
    "CD_CONTA_CONTABIL" TEXT,
    "DESCRICAO" TEXT,
    "VL_SALDO_INICIAL" TEXT, 
    "VL_SALDO_FINAL" TEXT
);

CREATE TABLE demonstracoes_contabeis(
    "DATA" DATE,
    "TRIMESTRE" INT NOT NULL CHECK ("TRIMESTRE" BETWEEN 1 AND 4),
    "REG_ANS" INTEGER NOT NULL,
    "CD_CONTA_CONTABIL" VARCHAR(9) NOT NULL,
    "DESCRICAO" VARCHAR(255),
    "VL_SALDO_INICIAL" DECIMAL(14,2) NOT NULL,
    "VL_SALDO_FINAL" DECIMAL(14,2) NOT NULL,
    FOREIGN KEY ("REG_ANS") REFERENCES operadores_ativos("Registro_Ans")
)