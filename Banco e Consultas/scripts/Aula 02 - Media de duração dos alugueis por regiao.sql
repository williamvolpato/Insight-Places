SELECT
    r.regiao,
    ROUND(AVG(a.preco_total / DATEDIFF(a.data_fim, a.data_inicio)), 2) AS media_preco_aluguel,
    ROUND(MAX(a.preco_total / DATEDIFF(a.data_fim, a.data_inicio)), 2) AS max_preco_dia,
    ROUND(MIN(a.preco_total / DATEDIFF(a.data_fim, a.data_inicio)), 2) AS min_preco_dia,
    ROUND(AVG(DATEDIFF(a.data_fim, a.data_inicio)), 2) AS media_dias_aluguel
FROM
    alugueis a
JOIN
    hospedagens h ON a.hospedagem_id = h.hospedagem_id
JOIN
    enderecos e ON h.endereco_id = e.endereco_id
JOIN 
    regioes_geograficas r ON r.estado = e.estado
GROUP BY
    r.regiao;
