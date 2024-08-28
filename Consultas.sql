-- ABA PARA CONSULTAS

-- FROM 
select * from ferramenta;
select * from funcionario;
select * from manutencao;
select * from pecas;
select * from maquina;
select * from fornecedor;
select * from ferramenta_manutencao;
select * from pecas_manutencao;

-- WHERE
select * from maquina where Fabricante = 'Haas Automation';
select * from funcionario where Setor = "Manutenção";
select * from pecas where Estoque <= 100;

-- GROUP BY
select ID_Maquina, Nome, Fabricante from maquina group by Fabricante;
select ID_Funcionario, Nome, Especializacao, Setor from funcionario group by Setor;
select * from pecas group by Estoque;

-- HAVING

-- ORDER BY
select Nome,Data_Entrega from fornecedor order by Data_Entrega asc;
select * from manutencao order by Data_Inicio;
select * from funcionario order by ID_Funcionario desc;

-- DISTINCT
select distinct Nome,Setor,Especializacao from funcionario; 
select distinct Setor from funcionario;
select distinct Fabricante from maquina;

-- AND
select * from pecas where custo > 200 and Estoque <100;
select * from funcionario where Setor = "Fábrica" and Especializacao = "Operador";
select * from fornecedor where Dados_Pagamento = "Dinheiro" and ID_Fornecedor > 7;

-- OR 
select * from pecas where custo > 300 or Estoque <100;
select * from funcionario where Setor = "Fábrica" or Especializacao = "Líder";
select * from fornecedor where Dados_Pagamento = "Débito" or Dados_Pagamento = "Crédito" order by Dados_Pagamento asc;

-- NOT
select * from pecas where not Estoque <=100;
select * from fornecedor where not Dados_Pagamento = "Débito" ;
select * from fornecedor where not Data_Entrega > "2024/05/03";

-- BETWEEN
select * from pecas where estoque between 150 and 200;
select ID_Funcionario, Nome from funcionario where ID_Funcionario between 10 and 15;
select ID_Fornecedor, Nome, Data_Entrega from fornecedor where Data_Entrega between "2024/04/01" and "2024/04/30";

-- LIKE
select * from funcionario where Nome like "l%";
select * from maquina where Nome like "%CNC";
select Nome, Descricao from ferramenta where Nome like "%a%";

-- IN
select * from funcionario where Setor In ("Fábrica","RH");

-- AVG
select AVG(Estoque) from pecas;

-- COUNT
select count(ID_Funcionario) from funcionario;
select Setor, count(ID_Funcionario) from funcionario where Setor = "Fábrica";
select count(ID_Maquina) from maquina where Nome like "%CNC";

-- SUM
select sum(Estoque) from pecas;

-- MAX
select Nome, max(Estoque) from pecas;
select Nome, max(Custo) from pecas;

-- MIN
select Nome, min(Estoque) from pecas;
select Nome, min(Custo) from pecas;

-- LINKAR DUAS TABELAS 
select Descricao,Nome,Setor from manutencao, maquina where manutencao.ID_Maquina = maquina.ID_Maquina;

-- INNER JOIN
select m.Descricao, a.Nome, a.Setor from manutencao m INNER JOIN  maquina a ON m.ID_Maquina = a.ID_Maquina;

-- VIEW
create view man(Descrição,funcionario, Area) as select 
m.Descricao, a.Nome, a.Setor from manutencao m INNER JOIN  maquina a ON m.ID_Maquina = a.ID_Maquina;
select * from man;

-- TRIGGERS
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
select * from historico;
-- drop table auditoria;

DELIMITER $
create trigger Inclusao_Historico
before update on manutencao
for each row
begin
insert into historico set action = "update",
ID_Manutencao = old.ID_Manutencao,
Descricao = old.Descricao,
Data_Inicio = old.Data_Inicio,
Hora_Inicio = old.Hora_Inicio,
Data_Final = old.Data_Final,
Hora_Final = old.Hora_Final,
ID_Funcionario = old.ID_Funcionario,
ID_Maquina = old.ID_Maquina,
Data_Alteracao = now();
end$
DELIMITER ;

-- drop trigger Inclusao_Historico;

update manutencao set ID_Funcionario = 11, ID_Maquina = 3, Descricao = "Trocou foi tudo" where ID_Manutencao = 3;