INSERT INTO demonstracoes_contabeis("DATA", "REG_ANS", "CD_CONTA_CONTABIL", "DESCRICAO", "VL_SALDO_INICIAL", "VL_SALDO_FINAL", "TRIMESTRE")
SELECT 
    "DATA",
    "REG_ANS"::INTEGER,  -- Se o REG_ANS for numérico na tabela final
    "CD_CONTA_CONTABIL",
    "DESCRICAO",
    REPLACE("VL_SALDO_INICIAL", ',', '.')::NUMERIC,
    REPLACE("VL_SALDO_FINAL", ',', '.')::NUMERIC,
    EXTRACT(QUARTER FROM "DATA")  -- Se desejar calcular o trimestre a partir da data
FROM staging_demonstracoes;