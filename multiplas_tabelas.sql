USE restaurante;
SELECT pr.id_produto, pr.nome, pr.descricao, ing.ingredientes
FROM produtos pr
INNER JOIN info_produtos ing
ON pr.id_produto = ing.id_produto;


SELECT p.id_pedido, p.quantidade, p.dados, c.nome, c.email
FROM pedidos p 
INNER JOIN clientes c
ON p.id_cliente = c.id_clientes;


SELECT p.id_pedido, p.quantidade, cl.nome as Cliente,cl.email, f.nome as Funcionários
FROM clientes cl
INNER JOIN pedidos p ON cl.id_cliente = p.id_cliente
INNER JOIN funcionários f ON cl.id_cliente = f.id_funcionario
order by cl.nome asc;

use restaurante;


SELECT p.id_pedido, p.quantidade, cl.nome as Cliente,cl.email, f.nome as Funcionários, pr.nome as nome_produtos, pr.preço
FROM clientes cl
INNER JOIN pedidos p ON cl.id_cliente = p.id_cliente
INNER JOIN funcionários f ON cl.id_cliente = f.id_funcionario
INNER JOIN produtos pr ON cl.id_cliente = pr.id_produto
order by cl.nome asc;



SELECT c.nome, p.id_pedido
FROM clientes c
INNER JOIN pedidos p ON c.id_cliente = p.id_cliente
WHERE p.status_pedido = 'Pendente'
ORDER BY p.id_pedido DESC;

SELECT c.nome 
FROM clientes c
LEFT JOIN pedidos  ON c.id_cliente = pedidos.id_cliente
WHERE pedidos.id_pedido is null;

SELECT cl.nome, pedidos_to.total_pedidos
FROM clientes cl
JOIN 
  (SELECT id_cliente, COUNT(*) AS total_pedidos
  FROM pedidos 
GROUP BY id_cliente)
AS pedidos_to ON pedidos_to.id_cliente = cl.id_cliente
ORDER BY cl.nome asc;


SELECT id_pedido, SUM(pe.quantidade * pr.preço) AS preco_total
FROM pedidos pe
INNER JOIN produtos pr  ON pe.id_produto = pr.id_produto
GROUP BY id_pedido
ORDER BY id_pedido asc;










