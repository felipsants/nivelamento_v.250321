-- Se estiver rodando PostgreSQL via Docker e montou o volume corretamente, use:

COPY staging_demonstracoes("DATA", "REG_ANS", "CD_CONTA_CONTABIL", "DESCRICAO", "VL_SALDO_INICIAL", "VL_SALDO_FINAL")
FROM '/dados_csv/1T2023.csv'
DELIMITER ';'
CSV HEADER;

COPY staging_demonstracoes("DATA", "REG_ANS", "CD_CONTA_CONTABIL", "DESCRICAO", "VL_SALDO_INICIAL", "VL_SALDO_FINAL")
FROM '/dados_csv/2T2023.csv'
DELIMITER ';'
CSV HEADER;

COPY staging_demonstracoes("DATA", "REG_ANS", "CD_CONTA_CONTABIL", "DESCRICAO", "VL_SALDO_INICIAL", "VL_SALDO_FINAL")
FROM '/dados_csv/3T2023.csv'
DELIMITER ';'
CSV HEADER;

COPY staging_4t2023("DATA", "REG_ANS", "CD_CONTA_CONTABIL", "DESCRICAO", "VL_SALDO_INICIAL", "VL_SALDO_FINAL")
FROM '/dados_csv/4T2023.csv'
DELIMITER ';'
CSV HEADER;

COPY staging_demonstracoes("DATA", "REG_ANS", "CD_CONTA_CONTABIL", "DESCRICAO", "VL_SALDO_INICIAL", "VL_SALDO_FINAL")
FROM '/dados_csv/1T2024.csv'
DELIMITER ';'
CSV HEADER;

COPY staging_demonstracoes("DATA", "REG_ANS", "CD_CONTA_CONTABIL", "DESCRICAO", "VL_SALDO_INICIAL", "VL_SALDO_FINAL")
FROM '/dados_csv/2T2024.csv'
DELIMITER ';'
CSV HEADER;

COPY staging_demonstracoes("DATA", "REG_ANS", "CD_CONTA_CONTABIL", "DESCRICAO", "VL_SALDO_INICIAL", "VL_SALDO_FINAL")
FROM '/dados_csv/3T2024.csv'
DELIMITER ';'
CSV HEADER;

COPY staging_demonstracoes("DATA", "REG_ANS", "CD_CONTA_CONTABIL", "DESCRICAO", "VL_SALDO_INICIAL", "VL_SALDO_FINAL")
FROM '/dados_csv/4T2024.csv'
DELIMITER ';'
CSV HEADER;

COPY Operadores_Ativos("Registro_Ans", "Cnpj", "Razao_Social", "Nome_Fantasia", "Modalidade", "Logradouro", "Numero", "Complemento", "Bairro", "Cidade", "Uf", "Cep", "Ddd", "Telefone", "Fax", "Endereco_Eletronico", "Representante", "Cargo_Representante", "Regiao", "Data_Registro_Ans")
FROM '/dados_csv/Relatorio_cadop.csv'
DELIMITER ';'
CSV HEADER;

-- Se estiver usando PostgreSQL localmente (fora de Docker), prefira:
-- \COPY (roda no cliente psql, e precisa ser executado no terminal psql)
-- \COPY staging_demonstracoes(...) FROM 'caminho/para/o/csv.csv' DELIMITER ';' CSV HEADER;