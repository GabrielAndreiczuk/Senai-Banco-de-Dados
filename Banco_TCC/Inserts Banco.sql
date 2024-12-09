use projeto;
insert into Status (Nome) values ("Não iniciado"),("Em andamento"),("Concluído");
insert into tipo (Nome) values ("Corretiva"),("Preventiva"),("Preditiva");

insert into Setor (Nome) values
("Administração"),
("Linha de Produção"),
("Manutenção Industrial"),
("TI e Automação"),
("Almoxarifado");

insert into cargo (Nome) values
("Diretor de Operações Industriais"),
("Gerente Industrial"),
("Analista de Automação Industrial"),
("Operador de Linha de Produção"),
("Manutentor Industrial"),
("Almoxarife"),
("Auxiliar de Produção");

Insert into funcionario (Nome,Email,Senha,Setor,Cargo,Contato) values 
("Damares","damares@gmail.com","12345",1,1,"(41) 99999-9999"),
("Gabriel","gabriel@gmail.com","12345",1,1,"(41) 99999-9999");
#INSERT INTO funcionario (Nome, Email, Senha) VALUES ("Teste", "teste@gmail.com", AES_ENCRYPT('000','chave'));
#SELECT Nome, AES_DECRYPT(Senha, 'chave') AS SenhaDesencriptada FROM funcionario WHERE ID_Funcionario = 1;

insert into maquina (Nome, Setor, Valor_Hora) values
("Impressora Multifuncional", 1, 50.00),
("Servidor de Dados", 1, 120.00),
("Esteira Transportadora Automática", 2, 200.00),
("Máquina de Moldagem por Injeção", 2, 300.00),
("Prensa Hidráulica", 2, 250.00),
("Sistema de Envasamento e Selagem", 2, 180.00),
("Forno Industrial", 2, 350.00),
("Equipamento de Diagnóstico por Ultrassom", 3, 150.00),
("Ferramenta de Alinhamento a Laser", 3, 180.00),
("Controlador Lógico Programável (CLP)", 4, 220.00),
("Sistema de Supervisão e Aquisição de Dados (SCADA)", 4, 300.00),
("Empilhadeira Elétrica", 5, 90.00),
("Sistema de Armazenagem Vertical Automatizado", 5, 200.00);
select * from maquina;

insert into manutencao (ID_Funcionario_Abertura, Data_Abertura, Descricao_Abertura, ID_Funcionario_Conclusao, Data_Conclusao, Descricao_Conclusao, Duracao, Custo, ID_Setor, ID_Maquina, Tipo, Status) values
(1, "2024/09/05 08:30:00", "Aquecimento irregular na prensa hidráulica.", 2, "2024/09/07 16:30:00", "Ajuste realizado para estabilizar a temperatura.", TIMEDIFF("2024/09/07 16:30:00", "2024/09/05 08:30:00"), 12000, 2, 5, 2, 3),
(1, "2024/09/12 09:00:00", "Falha no sensor de temperatura do forno industrial.", 2, "2024/09/13 13:00:00", "Sensor substituído e sistema recalibrado.", TIMEDIFF("2024/09/13 13:00:00", "2024/09/12 09:00:00"), 1200, 2, 7, 1, 3),
(1, "2024/09/20 10:00:00", "Barulho excessivo na esteira transportadora.", 2, "2024/09/20 16:00:00", "Manutenção preventiva realizada.", TIMEDIFF("2024/09/20 16:00:00", "2024/09/20 10:00:00"), 7200, 2, 3, 3, 3),
(1, "2024/10/01 08:00:00", "Erro de comunicação no sistema SCADA.", 2, "2024/10/03 15:00:00", "Sistema reconfigurado e comunicação restabelecida.", TIMEDIFF("2024/10/03 15:00:00", "2024/10/01 08:00:00"), 11200, 4, 11, 1, 3),
(1, "2024/10/08 14:00:00", "Desgaste na ferramenta de alinhamento a laser.", 2, "2024/10/09 19:00:00", "Alinhamento a laser recalibrado.", TIMEDIFF("2024/10/09 19:00:00", "2024/10/08 14:00:00"), 10150, 3, 9, 2, 3),
(1, "2024/10/15 10:00:00", "Falha no empilhamento de carga.", 2, "2024/10/16 13:00:00", "Correção de falha e testes de carga realizados.", TIMEDIFF("2024/10/16 13:00:00", "2024/10/15 10:00:00"), 9180, 5, 12, 3, 3),
(1, "2024/11/01 07:30:00", "Falha de comunicação no controlador lógico programável (CLP).", 2, "2024/11/03 12:30:00", "CLP reprogramado e operando normalmente.", TIMEDIFF("2024/11/03 12:30:00", "2024/11/01 07:30:00"), 11000, 4, 10, 3, 3),
(1, "2024/11/10 13:00:00", "Falha no sistema de envasamento e selagem.", 2, "2024/11/11 17:00:00", "Sistema de envasamento ajustado e operando.", TIMEDIFF("2024/11/11 17:00:00", "2024/11/10 13:00:00"), 7840, 2, 6, 1, 3),
(1, "2024/11/15 10:00:00", "Falha no sistema de resfriamento da máquina de injeção.", 2, "2024/11/16 14:00:00", "Sistema de resfriamento reparado e testado.", TIMEDIFF("2024/11/16 14:00:00", "2024/11/15 10:00:00"), 11200, 2, 4, 1, 3),
(1, "2024/12/01 08:00:00", "Problema na pressão de óleo da prensa hidráulica.", 2, "2024/12/01 18:00:00", "Ajuste na válvula de pressão.", TIMEDIFF("2024/12/01 18:00:00", "2024/12/01 08:00:00"), 180, 2, 5, 3, 3), -- Concluída
(1, "2024/12/02 09:00:00", "Falha na linha de alimentação do forno industrial.", NULL, NULL, NULL, 0, 0, 2, 7, 1, 2), -- Em andamento
(1, "2024/12/03 14:00:00", "Barulho excessivo na esteira transportadora.", 2, "2024/12/04 19:00:00", "Troca de rolamentos e lubrificação.", TIMEDIFF("2024/12/04 19:00:00", "2024/12/03 14:00:00"), 150, 2, 3, 2, 3), -- Concluída
(1, "2024/12/04 11:30:00", "Quebra de peça no alinhamento da ferramenta a laser.", NULL, NULL, NULL, 0, 0, 3, 9, 1, 1), -- Não iniciada
(1, "2024/12/07 10:00:00", "Desgaste excessivo na correia transportadora.", NULL, NULL, NULL, 0, 0, 2, 3, 1, 1); -- Não iniciada
select * from view_manutencao order by Ordem desc;

insert into pecas (Nome, Descricao,Estoque,Custo) values
("Sensor de Temperatura", "Sensor para medição de temperatura em fornos industriais.", 20, 1500),
("Bucha de Fixação", "Bucha usada para fixação de peças em prensas hidráulicas.", 50, 80),
("Correia Transportadora", "Correia para esteira transportadora automática.", 10, 500),
("Ferramenta de Alinhamento a Laser", "Ferramenta usada para alinhamento preciso em máquinas CNC.", 15, 2500),
("Bateria de Backup para CLP", "Bateria usada para garantir que o CLP continue operando durante falhas de energia.", 30, 300),
("Válvula de Controle de Pressão", "Válvula usada para controle de pressão em sistemas hidráulicos.", 25, 600),
("Filtro de Ar para Compressor", "Filtro utilizado para manutenção de compressores industriais.", 12, 150),
("Vedação de Borracha para Forno", "Vedação usada para selar fornos industriais.", 40, 200),
("Placa de Circuito para Sistema SCADA", "Placa de reposição para o sistema SCADA.", 8, 1200),
("Lâmina de Corte para Ferramenta CNC", "Lâmina de corte para máquinas CNC de corte.", 18, 350),
("Relé de Sobrecarga", "Relé utilizado para proteção de motores elétricos.", 10, 180),
("Termostato para Forno Industrial", "Termostato para controle de temperatura em fornos industriais.", 25, 450),
("Engrenagem para Empilhadeira", "Engrenagem de reposição para empilhadeiras elétricas.", 15, 1200),
("Sensor de Vibração", "Sensor utilizado para monitoramento de vibração em motores.", 10, 600),
("Fusível de Alta Capacidade", "Fusível de reposição para sistemas de alta capacidade.", 30, 100);

insert into pecas_manutencao(ID_Manutencao,ID_Pecas,Quantidade) values
(1, 1, 1),  
(1, 2, 1),  
(2, 12, 1), 
(2, 15, 2),  
(3, 3, 4),  
(4, 9, 1),  
(4, 11, 1),  
(5, 4, 1),
(7, 5, 1),
(10, 6, 1), 
(10, 2, 1),
(12, 2, 2), 
(12, 3, 1);