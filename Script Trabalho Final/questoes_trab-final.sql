-Numero 4
-- a)Uma consulta mostrando todos os produtos cadastrados, com o nome da categoria e o nome do 
--funcionário que o cadastrou; (2 pontos)

select nome_produto, nome_funcionario, nome_categoria from produto p
inner join funcionario f 
on(p.codigo_funcionario = f.codigo_funcionario)
inner join categoria c 
on(p.codigo_categoria = c.codigo_categoria)

-- b)Uma consulta mostrando todos os pedidos feitos (sem os itens do pedido), com o nome e telefone do cliente; (2 pontos)
select codigo_pedido, nome, sobrenome, ddd_principal, telefone_principal, ddd_secundario, telefone_secundario from pedido p
inner join cliente c 
on(p.codigo_cliente = c.codigo_cliente)
inner join telefone_cliente t 
on(c.codigo_telefone  = t.codigo_telefone);


-- c)Uma consulta mostrando todos os pedidos feitos, com seus itens, mostrando: número do pedido, nome do cliente, data do pedido, nome do produto comprado 
--e a quantidade comprada de cada produto; (2 pontos)

select pedido.codigo_pedido, nome, sobrenome, data_pedido, nome_produto, quantidade_comprada from item_compra
inner join produto
on(item_compra.codigo_produto = produto.codigo_produto)
inner join pedido 
on(item_compra.codigo_pedido = pedido.codigo_pedido)
inner join cliente
on(pedido.codigo_cliente = cliente.codigo_cliente);


--d)Uma consulta mostrando a quantidade de pedidos por cliente, com resultado ordenado por nome do cliente, de modo crescente. (2 pontos)

select count(codigo_pedido), nome, sobrenome from pedido
	inner join cliente 
	on(pedido.codigo_cliente = cliente.codigo_cliente)
group by nome, sobrenome
order by nome

--e)Utilize o inner join para uma consulta coerente em 3 tabelas. (2 pontos)

select nome, sobrenome, rua, bairro, ddd_principal, telefone_principal from cliente 
inner join endereco_cliente ec 
on(ec.codigo_endereco = cliente.codigo_cliente)
inner join telefone_cliente tc 
on(tc.codigo_telefone = cliente.codigo_telefone)

--f)Faça uso de outro join para consultar os dados, mesmo que nulos, da tabela funcionario. (2 pontos)
select nome_produto, nome_funcionario from produto
full join funcionario 
on(produto.codigo_funcionario = funcionario.codigo_funcionario)

--Numero 5
--a)Um SQL que mude o salário de todos os funcionários: eles passarão a ganhar R$ 500,00 a mais; (3 pontos)

update funcionario set salario= (salario + 500);

--b)Um SQL que altere o e-mail e o telefone de um cliente qualquer cadastrado. (2 pontos)

update cliente set email_cliente = 'jose_novoemail@gmail.com' where codigo_cliente = 1;

update telefone_cliente set telefone_principal = '990475364' where codigo_telefone = 1;

--Numero 6
--SQL de exclusão, dos clientes que foram cadastrados contendo o caractere ‘e’ no nome ou que possuem uma
--senha com menos de 4 caracteres. (3 pontos)

alter table pedido drop constraint "FK_pedido.codigo_cliente";
delete from cliente where nome like '%e%' or length(senha)<4;