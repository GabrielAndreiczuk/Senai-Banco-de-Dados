-- drop database projeto;
create database projeto;
ALTER DATABASE `projeto` CHARSET = UTF8 COLLATE = utf8_general_ci;
use projeto;

-- CRIAÇÃO DA TABELA DE FERRAMENTA
create table ferramenta(
	ID_Ferramenta int(5) primary key auto_increment,
    Nome varchar(25),
    Descricao varchar(25)
);

-- CRIAÇÃO DA TABELA FUNCIONÁRIO
create table funcionario(
	ID_Funcionario int (5) primary key auto_increment,
    Nome varchar(75),
    Setor varchar(20),
    Especializacao varchar(25),
    Contato varchar(15)
    -- ID_Ferramenta int(5),
    -- constraint foreign key (ID_Ferramenta) references ferramenta (ID_Ferramenta)
);

-- CRIAÇÃO DA TABELA MÁQUINA
create table maquina(
	ID_Maquina int(3) primary key auto_increment,
    Nome varchar(30),
    Setor varchar(20),
    Tipo varchar(30),
    Fabricante varchar(20)
);

-- CRIAÇÃO DA TABELA MANUTENCAO
create table manutencao(
	ID_Manutencao int(8) primary key auto_increment,
    Descricao varchar(100),
    Data_Inicio date,
    Hora_Inicio time,
    Data_Final date,
    Hora_Final time,
    ID_Funcionario int(5),
    constraint foreign key (ID_Funcionario) references funcionario(ID_Funcionario),
    ID_Maquina int(5),
    constraint foreign key (ID_Maquina) references maquina (ID_Maquina)
);

-- CRIAÇÃO DA TABELA DE PEÇAS
create table pecas(
	ID_Pecas int(5) primary key auto_increment,
    Nome varchar(45),
    Descricao varchar(20),
    Estoque int(3),
    Custo float(5,2)
);

-- CRIAÇÃO DA TABELA PECAS_MANUTENCAO
create table pecas_manutencao(
	ID_Pecas int(5),
    constraint foreign key (ID_Pecas) references pecas(ID_Pecas),
    ID_Manutencao int(8),
    constraint foreign key (ID_Manutencao) references manutencao(ID_Manutencao),
    Quantidade int(3)
);
alter table pecas_manutencao add ID int (5) primary key auto_increment;

-- CRIAÇÃO DA TABELA FERRAMENTA_MANUTENCAO
create table ferramenta_manutencao(
	ID_Ferramenta int(5),
    constraint foreign key (ID_Ferramenta) references ferramenta(ID_Ferramenta),
    ID_Manutencao int(8),
    constraint foreign key (ID_Manutencao) references manutencao(ID_Manutencao)
);
#drop table ferramenta_manutencao;

-- CRIAÇÃO DA TABELA FORNECEDOR
create table fornecedor(
	ID_Fornecedor int (5) primary key auto_increment,
    Nome varchar(45),
    Contato varchar(15),
    Dados_Pagamento varchar(8),
    Data_Entrega date
);

-- CRIAÇÃO DA TABELA PECAS_FORNECEDOR
create table pecas_fornecedor(
	ID_Pecas int(5),
    constraint foreign key (ID_Pecas) references pecas(ID_Pecas),
    ID_Fornecedor int(8),
    constraint foreign key (ID_Fornecedor) references fornecedor(ID_Fornecedor)
);

create table historico (
ID_Historico int(5) primary key auto_increment,
ID_Manutencao int(8),
Descricao varchar(100),
Data_Inicio date,
Hora_Inicio time,
Data_Final date,
Hora_Final time,
ID_Funcionario int(5),
ID_Maquina int(5),
Data_alteracao datetime,
action varchar(50)
);