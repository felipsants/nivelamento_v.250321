SELECT 
    o."Razao_Social",
    SUM(dc."VL_SALDO_FINAL" - dc."VL_SALDO_INICIAL") AS total_despesas
FROM demonstracoes_contabeis dc
JOIN operadores_ativos o 
    ON dc."REG_ANS" = o."Registro_Ans"
WHERE dc."DESCRICAO" = 'EVENTOS/ SINISTROS CONHECIDOS OU AVISADOS  DE ASSISTÊNCIA A SAÚDE MEDICO HOSPITALAR '
  AND EXTRACT(YEAR FROM dc."DATA") = (
        SELECT EXTRACT(YEAR FROM MAX("DATA"))
        FROM demonstracoes_contabeis
    )
GROUP BY o."Razao_Social"
ORDER BY total_despesas DESC
LIMIT 10;
