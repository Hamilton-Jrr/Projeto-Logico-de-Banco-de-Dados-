use ecommerce;

-- Inserção de dados fictícios na tabela Cliente
insert into Cliente (Nome, Conta, Identificacao, Endereco) values
('João Silva', 'CPF', '12345678901', 'Rua A, 123'),
('Empresa XYZ', 'CNPJ', '12345678000199', 'Av. B, 456'),
('Maria Oliveira', 'CPF', '98765432100', 'Rua C, 789');

-- Inserção de dados fictícios na tabela Pedido
insert into Pedido (idPCliente, Status_do_Pedido, Descricao, Frete) values
(1, 'Aprovado', 'Pedido de produtos variados', 15.50),
(2, 'Processando', 'Pedido empresarial', 25.00),
(3, 'Pendente', 'Pequena compra', 10.00);

-- Inserção de dados fictícios na tabela Entrega
insert into Entrega (idEPedido, idECliente, Status_entrega, Codigo_de_Rastreio) values
(1, 1, 'Enviado', 'BR1234567890BR'),
(2, 2, 'Em Processo', 'BR0987654321BR'),
(3, 3, 'Entregue', 'BR5678901234BR');

-- Inserção de dados fictícios na tabela Pagamento
insert into Pagamento (idPPedido, idPCliente, Forma_de_Pagamento) values
(1, 1, 'Cartão de Crédito'),
(2, 2, 'Boleto Bancário'),
(3, 3, 'PIX');

-- Inserção de dados fictícios na tabela Produto
insert into Produto (Categoria, Descricao, Valor) values
('Eletrônico', 'Smartphone X', 2500.00),
('Vestuário', 'Camiseta Polo', 99.90),
('Livros', 'Aprenda SQL', 45.00);

-- Inserção de dados fictícios na tabela ProdutoPedido
insert into ProdutoPedido (idPOProduto, idPOPedido, Quantidade) values
(1, 1, 2),
(2, 2, 3),
(3, 3, 1);

-- Inserção de dados fictícios na tabela Terceiro
insert into Terceiro (Razao_Social, Local) values
('Distribuidora Tech', 'São Paulo - SP'),
('Moda & Estilo', 'Rio de Janeiro - RJ');

-- Inserção de dados fictícios na tabela Produto_Terceiro
insert into Produto_Terceiro (idPTTerceiro, idPTProduto, Quantidade) values
(1, 1, 50),
(2, 2, 100);

-- Inserção de dados fictícios na tabela Estoque
insert into Estoque (Local) values
('Galpão Central'),
('Filial Norte');

-- Inserção de dados fictícios na tabela Produto_Estoque
insert into Produto_Estoque (idPEProduto, idPEEstoque, Quantidade) values
(1, 1, 30),
(2, 2, 50);

-- Inserção de dados fictícios na tabela Fornecedor
insert into Fornecedor (Razao_Social, CNPJ) values
('Fornecedor A', '11222333444455'),
('Fornecedor B', '22333444555566');

-- Inserção de dados fictícios na tabela produto_fornecedor
insert into produto_fornecedor (idPFFORNECEDOR, idPFPRODUTO) values
(1, 1),
(2, 2);