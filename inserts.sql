-- PREENCHIMENTO E CONSULTA DA TABELA DE FERRAMENTA
insert into ferramenta(Nome,Descricao) values
("Martelo", "Ferramenta de batida"),
("Chave de Fenda", "Aperta parafusos"),
("Serrote", "Corta madeira"),
("Alicate", "Segura e corta"),
("Escova", "Limpa superfícies"),
("Trena", "Mede distâncias"),
("Broca", "Perfura materiais"),
("Chave Inglesa", "Aperta porcas"),
("Lixa", "Desbasta superfícies"),
("Aparafusadora", "Fixa parafusos"),
("Nível", "Verifica alinhamento"),
("Chave Allen", "Aperta Parafusos Allen"),
("Plaina", "Nivela superfícies"),
("Furadeira", "Faz furos"),
("Afiador", "Afia ferramentas"),
("Torquímetro", "Aperta com Precisão"),
("Sugador de Solda", "Remove solda"),
("Pinça", "Segura peças pequenas"),
("Estilete", "Corta precisamente"),
("Escova de Aço", "Remove ferrugem");

-- PREENCHIMENTO E CONSULTA DA TABELA FUNCIONÁRIO
insert into funcionario (Nome, Setor, Especializacao, Contato) values
("João Silva", "Manutenção", "Eletricista", "(41) 12345-6789"),
("Maria Santos", "Fábrica", "Operador", "(41) 98765-4321"),
("Pedro Oliveira", "Logística", "Motorista", "(41) 55555-4444"),
("Ana Costa", "RH", "Recrutamento e Seleção", "(41) 44444-5555"),
("Carlos Lima", "Fábrica", "Operador", "(41) 77777-8888"),
("Juliana Pereira", "Vendas", "Representante Comercial", "(41) 33333-2222"),
("Lucas Martins", "Manutenção", "Manutentor", "(41) 22222-3333"),
("Fernanda Almeida", "Marketing", "Analista de Marketing", "(41) 66666-7777"),
("Rafael Barbosa", "Engenharia", "Engenheiro Civil", "(41) 99999-8888"),
("Mariana Carvalho", "Qualidade", "Analista de Qualidade", "(41) 11111-2222"),
("Rodrigo Oliveira", "Manutenção", "Manutenção de máquinas", "(41) 55555-6666"),
("Patrícia Souza", "Fábrica", "Líder", "(41) 77777-5555"),
("Gustavo Santos", "Logística", "Almoxarife", "(41) 88888-9999"),
("Camila Silva", "Recursos Humanos", "Analista de RH", "(41) 22222-1111"),
("Daniel Almeida", "TI", "Analista de Segurança", "(41) 33333-4444"),
("Carolina Rodrigues", "Vendas", "Vendedor", "(41) 99999-1111"),
("Bruno Oliveira", "Recursos Humanos", "Analista de RH", "(41) 88888-4444"),
("Isabela Ferreira", "Ferramentaria", "Ferramenteiro", "(41) 77777-2222"),
("Leonardo Costa", "Engenharia", "Engenheiro Eletricista", "(41) 66666-5555"),
("Amanda Pereira", "Qualidade", "Analista de Processos", "(41) 44444-3333");

insert into maquina (Nome, Setor, Tipo, Fabricante) values
("Torno CNC", "Fábrica", "Torno CNC", "Haas Automation"),
("Centro de Usinagem Vertical", "Fábrica", "Centro de Usinagem", "DMG MORI"),
("Fresadora CNC", "Fábrica", "Fresadora CNC", "Mazak"),
("Retífica Cilíndrica", "Fábrica", "Retífica Cilíndrica", "Studer"),
("Furadeira de Bancada", "Fábrica", "Furadeira", "Jet"),
("Torno Convencional", "Fábrica", "Torno Convencional", "ROMI"),
("Centro de Torneamento", "Fábrica", "Centro de Torneamento", "Doosan"),
("Centro de Usinagem Horizontal", "Fábrica", "Centro de Usinagem", "Okuma"),
("Retífica Plana", "Fábrica", "Retífica Plana", "Chevalier"),
("Fresadora Universal", "Fábrica", "Fresadora Universal", "Bridgeport"),
("Torno Automático", "Fábrica", "Torno Automático", "Index"),
("Centro de Usinagem CNC", "Fábrica", "Centro de Usinagem", "Haas Automation"),
("Retífica Centerless", "Fábrica", "Retífica Centerless", "Royal Master"),
("Fresadora de Alta Velocidade", "Fábrica", "Fresadora CNC", "DMG MORI"),
("Torno Vertical", "Fábrica", "Torno Vertical", "DMG MORI"),
("Máquina de Eletroerosão a Fio", "Fábrica", "Eletroerosão a Fio", "Mitsubishi"),
("Retífica de Ferramentas", "Fábrica", "Retífica de Ferramentas", "Walter"),
("Centro de Torneamento e Fresamento", "Fábrica", "Centro de Torneamento e Fresamento", "Mazak"),
("Fresadora de Bancada", "Fábrica", "Fresadora Universal", "Haas Automation"),
("Retífica de Engrenagens", "Fábrica", "Retífica de Engrenagens", "Kapp");

-- PREENCHIMENTO E CONSULTA DA TABELA PECAS
insert into pecas (Nome, Descricao,Estoque,Custo) values
("Fuso de Torno", "Peça essencial para o funcionamento do torno", 100, 50.00),
("Fresa de Metal Duro", "Utilizada em fresadoras CNC", 150, 200.00),
("Bucha de Fixação", "Utilizada em centros de usinagem", 200, 100.00),
("Mandril de Torno", "Permite a fixação de peças no torno", 120, 350.00),
("Retentor de Vedação", "Evita vazamentos em retíficas cilíndricas", 80, 50.00),
("Furadeira de Bancada", "Peça fundamental para a furadeira", 180, 150.00),
("Guia Linear", "Utilizada em centros de usinagem", 100, 400.00),
("Cabeçote de Fresadora", "Essencial para a fresadora CNC", 130, 800.00),
("Engrenagem de Transmissão", "Peça de transmissão de movimento", 150, 250.00),
("Placa de Torno", "Permite a fixação de peças no torno", 100, 600.00),
("Fresa de Topo", "Utilizada em centros de usinagem", 120, 180.00),
("Rolamento Linear", "Componente para movimento linear em máquinas CNC", 150, 120.00),
("Parafuso de Fixação", "Usado em várias máquinas para fixar componentes", 200, 5.00),
("Broca de Metal Duro", "Utilizada em furadeiras de bancada", 100, 30.00),
("Mola de Compressão", "Componente de suporte em várias máquinas", 180, 8.00),
("Cabeçote de Retificação", "Utilizado em retíficas cilíndricas", 90, 450.00),
("Correia de Transmissão", "Transmite potência em diversas máquinas", 120, 25.00),
("Sistema de Refrigeração", "Componente para resfriamento em fresadoras CNC", 80, 350.00),
("Engrenagem Helicoidal", "Componente de transmissão de movimento", 100, 180.00),
("Sensor de Proximidade", "Usado em sistemas de automação em máquinas", 150, 50.00);

-- PREENCHIMENTO E CONSULTA DA TABELA FORNECEDOR
insert into fornecedor (Nome,Contato,Dados_Pagamento,Data_Entrega) values
("Sandvik","(11) 998765432","Crédito","2024/12/10"),
("Metalúrgica Aço Forte", "(11) 998765432", "Crédito", "2024/05/15"),
("Ferramentas Precisas Ltda", "(11) 998765432", "Débito", "2024/05/15"),
("Peças Industriais S.A.", "(11) 998765432", "Dinheiro", "2024/04/05"),
("Mecânica Exata Ltda", "(11) 998765432", "Pix", "2024/04/03"),
("Rolamentos e Componentes Ltda", "(11) 998765432", "Crédito", "2024/05/22"),
("Molas e Acessórios Técnicos", "(11) 998765432", "Débito", "2024/03/17"),
("Correias & Cia", "(11) 998765432", "Dinheiro", "2024/03/15"),
("Sistemas de Refrigeração Industrial", "(11) 998765432", "Pix", "2024/04/08"),
("Engrenagens e Cia", "(11) 998765432", "Crédito", "2024/05/19"),
("Sensores Avançados", "(11) 998765432", "Débito", "2024/07/26");

-- PREENCHIMENTO E CONSULTA TABELA MANUTENÇÃO
insert into manutencao(Descricao, ID_Maquina, Data_Inicio,Hora_Inicio, Data_Final, Hora_Final, ID_Funcionario) values 
("Manutenção preventiva",1,"2024-03-19", "21:46","2024-04-21", "19:02",7),
("Troca dos parafusos de fixaxão do carro transversal",7,"2024-02-22","9:30","2024-02-22","11:27",7),
("Troca da placa do torno",1,"2024-03-26","14:45","2024-03-26","15:17",11),
("Reformulação do sistema de segurança",20,"2024-04-01","08:30","2024-04-05","16:45",11),
("Troca da correia",4,"2024-04-23","10:45","2024-04-23","16:15",7);

-- PREENCHIMENTO E CONSULTA TABELA PECAS MANUTENCAO
insert into pecas_manutencao(ID_Pecas,ID_Manutencao,Quantidade) values
(13,2,8),
(10,3,1),
(13,3,4),
(20,4,3),
(15,4,4);
-- insert into pecas_manutencao(ID_Pecas,ID_Manutencao,Quantidade) values (3,4,10);

-- PREENCHIMENTO TABELA FERRAMENTA_MANUTENCAO
insert into ferramenta_manutencao(ID_Ferramenta, ID_Manutencao) values
(12,2),
(16,3);

-- PREENCHIMENTO E CONSULTA TABELA PECAS_FORNECEDOR
