drop database atividade9;
create database atividade9;
alter database `atividade9` charset = UTF8 collate = utf8_general_ci;
use atividade9;

create table aeroporto(
	ID_Aeroporto int(5) primary key auto_increment,
    Nome varchar(45),
    Cidade varchar(45),
    Estado varchar(45),
    Pais varchar(45)
);
select * from aeroporto;

create table voo(
	ID_Voo int primary key auto_increment,
    Data_Partida date,
    Hora_Partida time,
    Data_Chegada date,
    Hora_Chegada time,
    Duracao datetime,
    Origem int(5),
    constraint foreign key (Origem) references aeroporto (ID_Aeroporto),
    Destino int(5),
    constraint foreign key (Destino) references aeroporto (ID_Aeroporto)
);
select * from voo;

create table escalas(
	ID_Voo int,
    constraint foreign key (ID_Voo) references voo (ID_Voo),
    Escala int (5),
    constraint foreign key (Escala) references aeroporto(ID_Aeroporto)
);
select * from escalas;

create table passageiro(
	ID_Passageiro int primary key auto_increment,
    RG varchar(15),
    CPF varchar(15),
    Nome varchar(45),
	Telefone varchar(15)
);
select * from passageiro;

create table passagem(
	ID_Passagem int primary key auto_increment,
    Data_Emissao date,
    Data_Validade date,
    Valor float(7,2),
    ID_Voo int,
    constraint foreign key (ID_Voo) references voo (ID_Voo),
    ID_Passageiro int,
    constraint foreign key (ID_Passageiro) references passageiro (ID_Passageiro)
);
select * from passagem;
