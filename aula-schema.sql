-- criação do banco de dados para o cenário de E-commerce
-- drop  database ecommerce;
create database ecommerce;
use ecommerce;


-- criar tabela cliente

create table clients(
    idClient int auto_increment primary key,
    Fname varchar(10),
    Minit char(3),
    Lname varchar(20),
    CPF char(11) not null,
    Address varchar(255),
    constraint unique_cpf_cliente unique (CPF)
);

alter table clients auto_increment=1;

-- desc clients;

-- criar tabela produto

-- size = dimensão do produto

create table product(
    idProduct int auto_increment primary key,
    Pname varchar(255),
    classification_kids bool default false,
    category enum('Eletrônico','Vestimenta','Brinquedos','Alimentos','Móveis') not null,
    avaliação float default 0,
    size varchar(10)
);

alter table product auto_increment=1;

-- desc product;

-- para ser continuado no desafio: termine de implementar a tabela e crie a conexão com as tabelas necessárias
-- além disso, reflita essa modificação no diagrama de esquema relacional
-- criar constraints relacionadas ao pagamento

 create table payments(
    idClient int,
    idPayment int,
    typePayment enum('Boleto','Cartão','Dois cartões'),
    limitAvailable float,
    primary key(idClient, idPayment)
);

-- desc payments;

-- criar tabela pedido
create table orders(
    idOrder int auto_increment primary key,
    idOrderClient int,
    orderStatus enum('Cancelado','Confirmado','Em processamento') default 'Em processamento',
    orderDescription varchar(255),
    sendValue float default 10,
    paymentCash bool default false,
    constraint fk_ordes_client foreign key (idOrderClient) references clients(idClient)
            on update cascade
);

alter table orders auto_increment=1;

-- desc orders;

-- criar tabela estoque
create table productStorage(
    idProdStorage int auto_increment primary key,
    storagelocation varchar(255),
    quantity float default 10,
    paymentCash int default 0
);

alter table productStorage auto_increment=1;

-- desc productStorage;

-- criar tabela fornecedor
create table supplier(
    idSupplier int auto_increment primary key,
    SocialName varchar(255) not null,
    CNPJ char(15) not null,
    contact char(11) not null,
constraint unique_supplier unique (CNPJ)
);

alter table supplier auto_increment=1;

-- desc supplier;

-- criar tabela vendedor
create table seller(
    idSeller int auto_increment primary key,
    SocialName varchar(255) not null,
    AbsName varchar(255),
    CNPJ char(15),
    CPF char(9),
    location varchar(255),
    contact char(11) not null,
constraint unique_cnpj_supplier unique (CNPJ),
constraint unique_cpf_supplier unique (CPF)
);

alter table seller auto_increment=1;

-- desc seller;


create table productSeller(
    idPseller int,
    idPproduct int,
    prodQuantity int default 1,
    primary key (idPseller, idPproduct),
    constraint fk_product_seller foreign key (idPseller) references seller(idSeller),
    constraint  fk_product_product foreign key (idPproduct) references product(idProduct)
);

-- desc productSeller;

create table productOrder(
    idPOproduct int,
    idPOorder int,
    poQuantity int default 1,
    poStatus Enum('Disponível', 'Sem estoque') default 'Disponível',
    primary key (idPOproduct, idPOorder),
    constraint fk_productorder_seller foreign key (idPOproduct) references product(idProduct),
    constraint fk_productorder_product foreign key (idPOorder) references orders(idOrder)
);

-- desc productOrder;

create table storageLocation(
    idLproduct int,
    idLstorage int,
    location varchar(255) not null,
    primary key (idLproduct, idLstorage),
    constraint fk_storage_location_product foreign key (idLproduct) references product(idProduct),
    constraint fk_storage_location_storage foreign key (idLstorage) references productStorage(idProdStorage)
);

-- desc storageLocation;

create table productSupplier(
    idPsSupplier int,
    idPsProduct int,
    quantity int not null,
    primary key (idPsSupplier, idPsProduct),
    constraint fk_product_supplier_supplier foreign key (idPsSupplier) references supplier(idSupplier),
    constraint fk_product_supplier_product foreign key (idpsProduct) references product(idProduct)
    );

-- desc productsupplier;

show tables;

show databases;
use information_schema;
show tables;
desc referential_constraints;
select * from referential_constraints where constraint_schema = 'ecommerce';
