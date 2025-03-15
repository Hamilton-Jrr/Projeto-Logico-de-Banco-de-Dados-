-- drop database ecommerce;
create database ecommerce;
use ecommerce;

-- criar tabela Cliente
create table Cliente(
    idCliente int auto_increment primary key,
    Nome varchar(255),
    Conta enum('CPF','CNPJ'),
    Identificacao varchar(14),
    Endereco varchar(100)
);

alter table Cliente auto_increment=1;

-- criar tabela Pedido
create table Pedido(
    idPedido int auto_increment primary key,
    idPCliente int,
    Status_do_Pedido enum ('Pendente', 'Aprovado', 'Processando', 'Enviado', 'Entregue') default 'Processando',
    Descricao varchar(100),
    Frete float,
	constraint fk_pedido_cliente foreign key (idPCliente) references Cliente(idCliente)
);
    
alter table Pedido auto_increment=1;

-- criar tabela entrega
create table Entrega(
	idEntrega int auto_increment primary key,
    idEPedido int,
    idECliente int,
    Status_entrega enum('Em Processo', 'Enviado', 'Entregue') default 'Em Processo',
    Codigo_de_Rastreio varchar(20),
    constraint fk_entrega_pedido foreign key (idEPedido) references Pedido(idPedido),
    constraint fk_entrega_cliente foreign key (idECliente) references Cliente(idCliente)
);

alter table Entrega auto_increment=1;

-- criar tabela Pagamento
create table Pagamento(
    idPagamento int auto_increment primary key,
    idPPedido int,
    idPCliente int,
    Forma_de_Pagamento varchar(45),
	constraint fk_pagamento_pedido foreign key (idPPedido) references Pedido(idPedido),
    constraint fk_pagamento_cliente foreign key (idPCliente) references Cliente(idCliente)    
);

alter table Pagamento auto_increment=1;
    
-- criar tabela Produto
create table Produto(
    idProduto int auto_increment primary key,
    Categoria varchar(15),
    Descricao varchar(100),
    Valor float
);

alter table Produto auto_increment=1;

-- criar tabela ProdutoPedido
create table ProdutoPedido(
    idPOProduto int,
    idPOPedido int,
    Quantidade int,
    constraint fk_produtopedido_produto foreign key (idPOProduto) references Produto(idProduto),
    constraint fk_produtopedido_pedido foreign key (idPOPedido) references Pedido(idPedido)
);

-- criar tabela Terceiro - Vendedor
create table Terceiro(
	idTerceiro int auto_increment primary key,
    Razao_Social varchar(80),
    Local varchar(100),
    CNPJ char(14)
);

alter table Terceiro auto_increment=1;

-- criar tabela Produto_Terceiro
create table Produto_Terceiro(
    idPTTerceiro int,
    idPTProduto int,
    Quantidade int,
    constraint fk_produtoterceiro_terceiro foreign key (idPTTerceiro) references Terceiro(idTerceiro),
    constraint fk_produtoterceiro_produto foreign key (idPTProduto) references Produto(idProduto)
);
    
-- criar tabela Estoque
create table Estoque(
    idEstoque int auto_increment primary key,
    Local varchar(100)
);

alter table Estoque auto_increment=1;

-- create tabela Produto_Estoque
create table Produto_Estoque(
    idPEProduto int,
    idPEEstoque int,
    Quantidade int,
    constraint fk_produtoestoque_produto foreign key (idPEProduto) references Produto(idProduto),
    constraint fk_produtoestoque_estoque foreign key (idPEEstoque) references Estoque(idEstoque)
);
    
-- criar tabela Fornecedor
create table Fornecedor(
    idFornecedor int auto_increment primary key,
    Razao_Social varchar(80),
    CNPJ char(14)
);

alter table Fornecedor auto_increment=1;

-- criar tabela Produto_Fornecedor
create table Produto_Fornecedor(
    idPFFornecedor int,
    idPFProduto int,
	constraint fk_produtofornecedor_fornecedor foreign key (idPFFornecedor) references Fornecedor(idFornecedor),
    constraint fk_produtofornecedor_produto foreign key (idPFProduto) references Produto(idProduto)
);