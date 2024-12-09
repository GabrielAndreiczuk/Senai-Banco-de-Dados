#drop database projeto;
create database projeto;
ALTER DATABASE `projeto` CHARSET = UTF8 COLLATE = utf8_general_ci;
use projeto;

-- CRIAÇÃO DA TABELA STATUS
create table status(
	ID_Status int(5) primary key auto_increment,
    Nome varchar(20)
);

-- CRIAÇÃO DA TABELA TIPO DE MANUTENÇÃO
create table tipo(
	ID_Tipo int(2) primary key auto_increment,
    Nome varchar(50)
);

-- CRIAÇÃO DA TABELA SETOR
create table setor(
	ID_Setor int (5) primary key auto_increment,
    Nome varchar (50)
);

-- CRIAÇÃO DA TABELA CARGO
create table cargo(
	ID_Cargo int (5) primary key auto_increment,
    Nome varchar (50)
);

-- CRIAÇÃO DA TABELA FUNCIONÁRIO
create table funcionario(
	ID_Funcionario int (5) primary key auto_increment,
    Nome varchar(75),
    Email varchar(50),
    Senha varchar(15),
    Setor int (5),
    constraint foreign key (Setor) references setor(ID_Setor),
    Cargo int (5),
    constraint foreign key (Cargo) references cargo(ID_Cargo),
    Contato varchar(20)
);
select * from funcionario;

create view view_funcionario as select 
f.ID_Funcionario,f.Nome,f.Email,f.Senha,s.Nome as Setor,c.Nome as Cargo, f.Contato
from funcionario f INNER JOIN setor s on f.Setor = s.ID_Setor INNER JOIN cargo c on f.Cargo = c.ID_Cargo;
select * from view_funcionario;

-- CRIAÇÃO DA TABELA MÁQUINA
create table maquina(
	ID_Maquina int(3) primary key auto_increment,
    Nome varchar(50),
    Setor int (5),
    constraint foreign key (Setor) references setor(ID_Setor),
    Valor_Hora float
);
select * from maquina;

-- CRIAÇÃO DA TABELA MANUTENCAO
create table manutencao(
	ID_Manutencao int(5) primary key auto_increment,    
    ID_Funcionario_Abertura int (5),
    constraint foreign key (ID_Funcionario_Abertura) references funcionario(ID_Funcionario),
    Data_Abertura datetime,
    Descricao_Abertura varchar (100),    
    ID_Funcionario_Conclusao int (5),
	constraint foreign key (ID_Funcionario_Conclusao) references funcionario(ID_Funcionario),
    Data_Conclusao datetime,
    Descricao_Conclusao varchar (100),    
    Duracao time,
    Custo float,   
    ID_Setor int(5),
    constraint foreign key (ID_Setor) references setor (ID_Setor),
    ID_Maquina int(5),
    constraint foreign key (ID_Maquina) references maquina (ID_Maquina),    
    Tipo int(5),
    constraint foreign key (Tipo) references tipo (ID_Tipo),
    Status int(5),
    constraint foreign key (Status) references status (ID_Status)
);
select * from manutencao;

/*
SET FOREIGN_KEY_CHECKS = 0;
-- Truncar a tabela
TRUNCATE TABLE manutencao;
-- Reativar as restrições de chave estrangeira
SET FOREIGN_KEY_CHECKS = 1;
*/

-- CRIAÇÃO DA VIEW ORDENS EM ABERTO
create view view_ordens_aberto(Ordem,ResponsavelAbertura,DataAbertura,DescricaoAbertura,Setor,Maquina,Status) as select
m.ID_Manutencao, f.Nome, m.Data_Abertura, m.Descricao_Abertura, s.Nome, q.Nome, e.Nome
from manutencao m INNER JOIN maquina q on m.ID_Maquina = q.ID_Maquina INNER JOIN setor s on m.ID_Setor = s.ID_Setor 
INNER JOIN status e on m.Status = e.ID_Status INNER JOIN funcionario f on m.ID_Funcionario_Abertura = f.ID_Funcionario
order by ID_Manutencao;
select * from view_ordens_aberto;

-- CRIAÇÃO DA VIEW MANUTENÇÃO
create view view_manutencao(Ordem, ResponsavelAbertura, DataAbertura, DescricaoAbertura,
							ResponsavelConclusao, DataConclusao, DescricaoConclusao,
                            Duracao, Custo, Máquina, Setor, Tipo, Status) 
as select m.ID_Manutencao, f.Nome, m.Data_Abertura, m.Descricao_Abertura, 
		  u.Nome, m.Data_Conclusao, m.Descricao_Conclusao,
          m.Duracao, m.Custo, q.Nome, s.Nome, t.Nome, e.Nome
from manutencao m INNER JOIN maquina q on m.ID_Maquina = q.ID_Maquina INNER JOIN setor s on m.ID_Setor = s.ID_Setor INNER JOIN tipo t on m.Tipo = t.ID_Tipo 
INNER JOIN funcionario f on m.ID_Funcionario_Abertura = f.ID_Funcionario INNER JOIN funcionario u on m.ID_Funcionario_Conclusao = u.ID_Funcionario
INNER JOIN status e on m.Status = e.ID_Status
order by ID_Manutencao;
select * from view_manutencao;

-- CRIAÇÃO DA VIEW MANUTENÇÃO SETOR
create view manutencao_setor (Setor,Total) as select s.Nome, COUNT(*) from manutencao m INNER JOIN setor s on m.ID_Setor = s.ID_Setor group by m.ID_Setor;
select * from manutencao_setor;

-- CRIAÇÃO DA VIEW MTTR
create view MTTR as SELECT 
			q.Nome as Maquina, s.Nome as Setor, 
			sec_to_time(SUM(time_to_sec(m.Duracao)) / Count(*)) AS MTTR
FROM manutencao m  INNER JOIN maquina q on m.ID_Maquina = q.ID_Maquina
INNER JOIN setor s on m.ID_Setor = s.ID_Setor
WHERE m.Duracao IS NOT NULL
GROUP BY m.ID_Maquina;

select * from MTTR;

-- CRIAÇÃO DA VIEW MTBF
create view MTBF as select 
    q.Nome as Maquina, s.Nome as Setor,
    SEC_TO_TIME((TIMESTAMPDIFF(SECOND, m.Data_Abertura, Now()) - m.Duracao) / COUNT(m.ID_Maquina)) AS MTBF
FROM manutencao m INNER JOIN maquina q on m.ID_Maquina = q.ID_Maquina
INNER JOIN setor s on m.ID_Setor = s.ID_Setor
WHERE m.Data_Conclusao IS NOT NULL
GROUP BY m.ID_Maquina;

select * from MTBF;

CREATE VIEW custos_mensais AS SELECT 
    MONTH(Data_Conclusao) AS Mes,
    SUM(Custo) AS Custo_Total
FROM manutencao WHERE Status = 3
GROUP BY MONTH(Data_Conclusao);

select * from custos_mensais order by Mes;

CREATE VIEW tempo_medio as select
MONTH(Data_Conclusao) AS Mes,
SEC_TO_TIME(AVG(TIME_TO_SEC(Duracao))) AS Tempo
FROM manutencao WHERE Status = 3
GROUP BY MONTH(Data_Conclusao);

select * from tempo_medio;

select sum(Custo) as Custo,count(*) as Total from view_manutencao where Máquina = "Máquina de Moldagem por Injeção";

-- CRIAÇÃO DA TABELA DE PEÇAS
create table pecas(
	ID_Pecas int(5) primary key auto_increment,
    Nome varchar(50),
    Descricao varchar(85),
    Estoque int(3),
    Custo float
);
select * from pecas;

-- CRIAÇÃO DA TABELA PECAS_MANUTENCAO
create table pecas_manutencao(
	ID int(5) primary key auto_increment,
    ID_Manutencao int(8),
    constraint foreign key (ID_Manutencao) references manutencao(ID_Manutencao),
	ID_Pecas int(5),
    constraint foreign key (ID_Pecas) references pecas(ID_Pecas),
    Quantidade int(3)
);

-- CRIAÇÃO DA VIEW PEÇAS
create view view_pecas (Ordem,Peça,Quantidade) as select
m.ID_Manutencao, p.Nome, m.Quantidade from pecas p INNER JOIN pecas_manutencao m on p.ID_Pecas = m.ID_Pecas
order by ID_Manutencao;