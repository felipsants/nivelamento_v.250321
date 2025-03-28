\COPY Demonstracoes_Contabeis("DATA", "REG_ANS", "CD_CONTA_CONTABIL", "DESCRICAO", "VL_SALDO_INICIAL", "VL_SALDO_FINAL")
FROM 'C:/Users/rebek/Desktop/felipé/nivelamento_v.250321/3_sql/relatorios_semestre/1T2023.csv'
DELIMITER ';'
CSV HEADER;

\COPY Demonstracoes_Contabeis("DATA", "REG_ANS", "CD_CONTA_CONTABIL", "DESCRICAO", "VL_SALDO_INICIAL", "VL_SALDO_FINAL")
FROM 'C:/Users/rebek/Desktop/felipé/nivelamento_v.250321/3_sql/relatorios_semestre/2T2023.csv'
DELIMITER ';'
CSV HEADER;

\COPY Demonstracoes_Contabeis("DATA", "REG_ANS", "CD_CONTA_CONTABIL", "DESCRICAO", "VL_SALDO_INICIAL", "VL_SALDO_FINAL")
FROM 'C:/Users/rebek/Desktop/felipé/nivelamento_v.250321/3_sql/relatorios_semestre/3T2023.csv'
DELIMITER ';'
CSV HEADER;

\COPY Demonstracoes_Contabeis("DATA", "REG_ANS", "CD_CONTA_CONTABIL", "DESCRICAO", "VL_SALDO_INICIAL", "VL_SALDO_FINAL")
FROM 'C:/Users/rebek/Desktop/felipé/nivelamento_v.250321/3_sql/relatorios_semestre/4T2023.csv'
DELIMITER ';'
CSV HEADER;

\COPY Demonstracoes_Contabeis("DATA", "REG_ANS", "CD_CONTA_CONTABIL", "DESCRICAO", "VL_SALDO_INICIAL", "VL_SALDO_FINAL")
FROM 'C:/Users/rebek/Desktop/felipé/nivelamento_v.250321/3_sql/relatorios_semestre/1T2024.csv'
DELIMITER ';'
CSV HEADER;

\COPY Demonstracoes_Contabeis("DATA", "REG_ANS", "CD_CONTA_CONTABIL", "DESCRICAO", "VL_SALDO_INICIAL", "VL_SALDO_FINAL")
FROM 'C:/Users/rebek/Desktop/felipé/nivelamento_v.250321/3_sql/relatorios_semestre/2T2024.csv'
DELIMITER ';'
CSV HEADER;

\COPY Demonstracoes_Contabeis("DATA", "REG_ANS", "CD_CONTA_CONTABIL", "DESCRICAO", "VL_SALDO_INICIAL", "VL_SALDO_FINAL")
FROM 'C:/Users/rebek/Desktop/felipé/nivelamento_v.250321/3_sql/relatorios_semestre/3T2024.csv'
DELIMITER ';'
CSV HEADER;

\COPY Demonstracoes_Contabeis("DATA", "REG_ANS", "CD_CONTA_CONTABIL", "DESCRICAO", "VL_SALDO_INICIAL", "VL_SALDO_FINAL")
FROM 'C:/Users/rebek/Desktop/felipé/nivelamento_v.250321/3_sql/relatorios_semestre/4T2024.csv'
DELIMITER ';'
CSV HEADER;

\COPY Operadores_Ativos("Registro_Ans", "Cnpj", "Razao_Social", "Nome_Fantasia", "Modalidade", "Logradouro", "Numero", "Complemento", "Bairro", "Cidade", "Uf", "Cep", "Ddd", "Telefone", "Fax", "Endereco_Eletronico", "Representante", "Cargo_Representante", "Regiao", "Data_Registro_Ans")
FROM 'C:/Users/rebek/Desktop/felipé/nivelamento_v.250321/3_sql/Relatorio_cadop.csv'
DELIMITER ';'
CSV HEADER;

UPDATE Demonstracoes_Contabeis
SET "TRIMESTRE" = EXTRACT(QUARTER FROM "DATA");
