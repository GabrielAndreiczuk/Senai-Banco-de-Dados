-- CONSULTA MANUTENÇÃO
select a.ID_Manutencao as Ordem, a.Descricao, 
m.Nome as Máquina, 
f.Nome as Manutentor, 
concat(date_format(a.Data_Inicio,"%d/%m/%Y"), " - ", a.Hora_Inicio) as Início, 
concat(date_format(a.Data_Final,"%d/%m/%Y"), " - ", a.Hora_Final) as Conclusão,
if(a.Data_Final > a.Data_Inicio,
if(a.Hora_Inicio>a.Hora_Final,
	concat(datediff(a.Data_Final,a.Data_Inicio)-1," D - ", timediff("24:00:00", timediff(a.Hora_Inicio, a.Hora_Final))," HRS"), #21:16
	concat(datediff(a.Data_Final,a.Data_Inicio)," D - ", timediff(a.Hora_Final, a.Hora_Inicio)," HRS") 
    ),
concat("0  D - ",timediff(a.Hora_final, a.Hora_Inicio)," HRS")) as Tempo,
if(a.ID_Manutencao = h.ID_Manutencao,"Editado"," - ") as Observação
from manutencao a INNER JOIN funcionario f ON a.ID_Funcionario = f.ID_Funcionario INNER JOIN maquina m ON a.ID_Maquina = m.ID_Maquina left join historico h on a.ID_Manutencao = h.ID_Manutencao
order by a.ID_Manutencao; 


-- ---------------------------------- CRIA  UMA VIEW DA MANUTENÇÃO ----------------------------------
create view view_manutencao(Ordem,Descrição,Máquina,Manutentor,Início,Conclusão,Tempo,Observação) as select
a.ID_Manutencao, a.Descricao, m.Nome, f.Nome, 
concat(date_format(a.Data_Inicio,"%d/%m/%Y"), " - ", a.Hora_Inicio), 
concat(date_format(a.Data_Final,"%d/%m/%Y"), " - ", a.Hora_Final),
if(a.Data_Final > a.Data_Inicio,
if(a.Hora_Inicio>a.Hora_Final,
	concat(datediff(a.Data_Final,a.Data_Inicio)-1," D - ", timediff("24:00:00", timediff(a.Hora_Inicio, a.Hora_Final))," HRS"), #21:16
	concat(datediff(a.Data_Final,a.Data_Inicio)," D - ", timediff(a.Hora_Final, a.Hora_Inicio)," HRS") 
    ),
concat(timediff(a.Hora_final, a.Hora_Inicio)," HRS")),
if(a.ID_Manutencao = h.ID_Manutencao,"Editado"," - ")
from manutencao a INNER JOIN funcionario f ON a.ID_Funcionario = f.ID_Funcionario INNER JOIN maquina m ON a.ID_Maquina = m.ID_Maquina left join historico h on a.ID_Manutencao = h.ID_Manutencao 
order by a.ID_Manutencao;

select*from view_manutencao;
-- drop view view_manutencao;

-- ---------------------------------- CRIANDO UMA VIEW DA LISTA DE PEÇAS ----------------------------------
create view view_lista_pecas(Ordem,Descrição, Peça, Quantidade) as select
m.ID_Manutencao, m.Descricao, p.Nome, pm.Quantidade from pecas p inner join pecas_manutencao pm on p.ID_Pecas = pm.ID_Pecas inner join manutencao m on m.ID_Manutencao = pm.ID_Manutencao
order by m.ID_Manutencao asc; 
select * from view_lista_pecas ;

--  ---------------------------------- CRIANDO UMA VIEW DA LISTA DE FERRAMENTAS ----------------------------------
create view view_lista_ferramentas(Ordem,Descricao, Ferramenta) as select
m.ID_Manutencao, m.Descricao, f.Nome from ferramenta_manutencao fm inner join manutencao m on fm.ID_Manutencao = m.ID_Manutencao inner join ferramenta f on fm.ID_Ferramenta = f.ID_Ferramenta
order by m.ID_Manutencao asc;
select * from view_lista_ferramentas ;
#drop view view_lista_ferramentas;

-- ------------------------------- TRIGGER QUE DIMINUI PEÇAS DO ESTOQUE --------------------------------
delimiter $
create trigger Tirar_Estoque
after insert on pecas_manutencao 
for each row
begin
update pecas set Estoque = Estoque - (select Quantidade from pecas_manutencao where ID = last_insert_id()+1) 
where ID_Pecas = (select ID_Pecas from pecas_manutencao where ID = last_insert_id()+1);
end$
delimiter ;
-- drop trigger Tirar_Estoque;


-- ------------------------- TRIGGER QUE CONTROLA AS ALTERAÇÕES NOS DADOS DA TABELA DE MANUTENÇÃO --------------------------
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
 
select * from historico;
select * from view_manutencao;

-- update manutencao set ID_Funcionario = 7, ID_Maquina = 3, Descricao = "Funcionou" where ID_Manutencao = 4;