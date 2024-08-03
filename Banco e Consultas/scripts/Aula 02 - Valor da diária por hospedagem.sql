SELECT
    a.hospedagem_id,
    a.preco_total,
    DATEDIFF(a.data_fim, a.data_inicio) AS dias_aluguel,
    ROUND(a.preco_total / DATEDIFF(a.data_fim, a.data_inicio), 2) AS preco_dia
FROM
    alugueis a
ORDER BY
    preco_dia DESC;
