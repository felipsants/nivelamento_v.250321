INSERT INTO demonstracoes_contabeis("DATA", "REG_ANS", "CD_CONTA_CONTABIL", "DESCRICAO", "VL_SALDO_INICIAL", "VL_SALDO_FINAL", "TRIMESTRE")
SELECT 
    s."DATA",
    s."REG_ANS"::INTEGER,
    s."CD_CONTA_CONTABIL",
    s."DESCRICAO",
    REPLACE(s."VL_SALDO_INICIAL", ',', '.')::NUMERIC,
    REPLACE(s."VL_SALDO_FINAL", ',', '.')::NUMERIC,
    EXTRACT(QUARTER FROM s."DATA")
FROM staging_demonstracoes s
WHERE s."REG_ANS"::INTEGER IN (
    SELECT "Registro_Ans"
    FROM operadores_ativos
);

INSERT INTO demonstracoes_contabeis("DATA", "REG_ANS", "CD_CONTA_CONTABIL", "DESCRICAO", "VL_SALDO_INICIAL", "VL_SALDO_FINAL", "TRIMESTRE")
SELECT 
    to_date(d."DATA", 'DD/MM/YYYY'),
    d."REG_ANS"::INTEGER,
    d."CD_CONTA_CONTABIL",
    d."DESCRICAO",
    REPLACE(d."VL_SALDO_INICIAL", ',', '.')::NUMERIC,
    REPLACE(d."VL_SALDO_FINAL", ',', '.')::NUMERIC,
    EXTRACT(QUARTER FROM to_date(d."DATA", 'DD/MM/YYYY'))
FROM staging_4t2023 d
WHERE d."REG_ANS"::INTEGER IN (
    SELECT "Registro_Ans"
    FROM operadores_ativos
);
