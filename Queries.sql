use ecommerce;

-- Quantos pedidos foram feitos por cada cliente?
select idCliente, Nome, COUNT(idPedido) as Total_Pedidos from Cliente
left join Pedido on idCliente = idCliente
group by idCliente, Nome
order by Total_Pedidos desc;

-- Algum vendedor também é fornecedor?
select idTerceiro, t.CNPJ as CNPJ_Terceiro, idFornecedor, f.CNPJ as CNPJ_Fornecedor
from Terceiro t
join Fornecedor f on f.CNPJ = t.CNPJ;

-- Relação de produtos fornecedores e estoques
select p.idProduto, p.Descricao as Produto, 
       f.idFornecedor, f.Razao_Social, 
       e.idEstoque, e.local, 
       pe.Quantidade 
from Produto p
join Produto_Fornecedor pf on p.idProduto = pf.idPFProduto
join Fornecedor f on pf.idPFFornecedor = f.idFornecedor
join Produto_Estoque pe on p.idProduto = pe.idPEProduto
join Estoque e on pe.idPEEstoque = e.idEstoque
order by p.idProduto, f.idFornecedor, e.idEstoque;

-- Relação de nomes dos fornecedores e nomes dos produtos
select f.Razao_Social as Nome, p.Descricao as Produto
from Produto_Fornecedor pf
join Produto p on pf.idPFProduto = p.idProduto
join Fornecedor f on pf.idPFFornecedor = f.idFornecedor;