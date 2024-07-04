--
-- Cria uma VIEW para retornar o objeto do SAP - em Inglês e Português Brasil
-- Creates a VIEW to return the SAP object - in English and Portuguese Brazil
--

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[VIEW_SAPObj]
AS

-- 15/05/2020 - FBS - View fixa com os objetos da SAP

SELECT '1'[ObjType], 'OACT'[ObjName], 'Plano de Contas'[DescriptionBR], 'G/L Accounts'[DescriptionUS], 'AcctCode'[KeyField] UNION ALL
SELECT '2', 'OCRD', 'Parceiro de Negócio', 'Business Partner', 'CardCode' UNION ALL
SELECT '3', 'ODSC' , 'Códigos bancários', 'Bank Codes', 'AbsEntry' UNION ALL
SELECT '4', 'OITM' , 'Itens', 'Items', 'ItemCode' UNION ALL
SELECT '5', 'OVTG' , 'Definição de imposto', 'Tax Definition', 'Code' UNION ALL
SELECT '6', 'OPLN' , 'Lista de preços', 'Price Lists', 'ListNum' UNION ALL
SELECT '7', 'OSPP' , 'Preços especiais', 'Special Prices', 'CardCode, ItemCode' UNION ALL
SELECT '8', 'OITG' , 'propriedades do item', 'Item Properties', 'ItmsTypCod' UNION ALL
SELECT '9', 'ORTM' , 'Diferenças de taxa', 'Rate Differences', 'LineNum, IsSysCurr' UNION ALL
SELECT '10', 'OCRG' , 'Grupos de cartão', 'Card Groups', 'GroupCode' UNION ALL
SELECT '11', 'OCPR' , 'Pessoas de contato', 'Contact Persons', 'CntctCode' UNION ALL
SELECT '12', 'OUSR' , 'Usuários do sistema', 'Users', 'USERID' UNION ALL
SELECT '13', 'OINV' , 'Nota Fiscal de Saída', 'A/R Invoice', 'DocEntry' UNION ALL
SELECT '203', 'ODPI' , 'Adiantamento de cliente', 'A/R Down Payment', 'DocEntry' UNION ALL
SELECT '14', 'ORIN' , 'Devolução da Nota Fiscal de Saída / Dev. Adiantamento', 'A/R Credit Memo', 'DocEntry' UNION ALL
SELECT '15', 'ODLN' , 'Entrega', 'Delivery', 'DocEntry' UNION ALL
SELECT '16', 'ORDN' , 'Devolução notas de entrega', 'Returns', 'DocEntry' UNION ALL
SELECT '17', 'ORDR' , 'Pedido de Vendas', 'Sales Order', 'DocEntry' UNION ALL
SELECT '18', 'OPCH' , 'Nota Fiscal de Entrada', 'A/P Invoice', 'DocEntry' UNION ALL
SELECT '204', 'ODPO' , 'Adiantamento de fornecedor', 'A/P Down Payment', 'DocEntry' UNION ALL
SELECT '19', 'ORPC' , 'Devolução Nota Fiscal de Entrada / Dev. Adiantamento', 'A/P Credit Memo', 'DocEntry' UNION ALL
SELECT '20', 'OPDN' , 'Entrada de mercadoria', 'Goods Receipt PO', 'DocEntry' UNION ALL
SELECT '21', 'ORPD' , 'Devolução de Entrada de mercadoria', 'Goods Return', 'DocEntry' UNION ALL
SELECT '22', 'OPOR' , 'Pedido de Compras', 'Purchase Order', 'DocEntry' UNION ALL
SELECT '1470000113', 'OPRQ' , 'Solicitação de Compra', 'Purchase Request', 'DocEntry' UNION ALL
SELECT '540000006', 'OPQT' , 'Oferta de Compra (Cotação)', 'Purchase Quotation', 'DocEntry' UNION ALL
SELECT '26', 'OMTH' , 'História reconciliação', 'Reconciliation History', 'MthAcctCod, IsInternal, MatchNum' UNION ALL
SELECT '27', 'OCHH' , 'Verifique Register', 'Check Register', 'CheckKey' UNION ALL
SELECT '28', 'OBTF' , 'Jornal voucher Entrada', 'Journal Voucher Entry', 'BatchNum, TransId' UNION ALL
SELECT '29', 'OBTD' , 'Jornal Lista Vouchers', 'Journal Vouchers List', 'BatchNum' UNION ALL
SELECT '30', 'OJDT' , 'Lançamentos Contábeis (LCM)', 'Journal Entry', 'TransId' UNION ALL
SELECT '31', 'OITW' , 'Itens - Depósitos / Armazém', 'Items – Warehouse', 'ItemCode, WhsCode' UNION ALL
SELECT '32', 'OADP' , 'Preferências de impressão', 'Print Preferences', 'PrintId' UNION ALL
SELECT '33', 'OCLG' , 'Atividades', 'Activities', 'ClgCode' UNION ALL
SELECT '34', 'ORCR' , 'lançamentos recorrentes', 'Recurring Postings', 'RcurCode, Instance' UNION ALL
SELECT '35', 'ONNM' , 'documento de Numeração', 'Document Numbering', 'ObjectCode, DocSubType' UNION ALL
SELECT '36', 'OCRC' , 'Cartões de crédito', 'Credit Cards', 'CreditCard' UNION ALL
SELECT '37', 'OCRN' , 'moeda Códigos', 'Currency Codes', 'CurrCode' UNION ALL
SELECT '38', 'OIDX' , 'Códigos de CPI', 'CPI Codes', 'IdexCode' UNION ALL
SELECT '39', 'OADM' , 'Administração', 'Administration', 'Code' UNION ALL
SELECT '40', 'OCTG' , 'Termos de pagamento', 'Payment Terms', 'GroupNum' UNION ALL
SELECT '41', 'OPRF' , 'preferências', 'Preferences', 'FormNumber, UserSign' UNION ALL
SELECT '42', 'OBNK' , 'Extrato bancário externo Recebidos', 'External Bank Statement Received', 'AcctCode, Sequence' UNION ALL
SELECT '43', 'OMRC' , 'fabricantes', 'Manufacturers', 'FirmCode' UNION ALL
SELECT '44', 'OCQG' , 'Propriedades do cartão', 'Card Properties', 'GroupCode' UNION ALL
SELECT '45', 'OTRC' , 'Códigos de entrada Jornal', 'Journal Entry Codes', 'TrnsCode' UNION ALL
SELECT '46', 'OVPM' , 'Pagamentos de saída', 'Outgoing Payments', 'DocEntry' UNION ALL
SELECT '47', 'OSRL' , 'números de série', 'Serial Numbers', 'ItemCode, SerialNum' UNION ALL
SELECT '48', 'OALC' , 'Carregando Despesas', 'Loading Expenses', 'AlcCode' UNION ALL
SELECT '49', 'OSHP' , 'Tipos de entrega', 'Delivery Types', 'TrnspCode' UNION ALL
SELECT '50', 'OLGT' , 'Unidades de comprimento', 'Length Units', 'UnitCode' UNION ALL
SELECT '51', 'OWGT' , 'Unidades de peso', 'Weight Units', 'UnitCode' UNION ALL
SELECT '52', 'OITB' , 'Grupos de itens', 'Item Groups', 'ItmsGrpCod' UNION ALL
SELECT '53', 'OSLP' , 'Vendedores', 'Sales Employee', 'SlpCode' UNION ALL
SELECT '54', 'OFLT' , 'Critérios de seleção - Relatório', 'Report – Selection Criteria', 'FormNum, UserSign, FilterName' UNION ALL
SELECT '55', 'OTRT' , 'modelos de lançamento', 'Posting Templates', 'TrtCode' UNION ALL
SELECT '56', 'OARG' , 'Grupos alfandegários', 'Customs Groups', 'CstGrpCode' UNION ALL
SELECT '57', 'OCHO' , 'Cheques para pagamento', 'Checks for Payment', 'CheckKey' UNION ALL
SELECT '58', 'OINM' , 'Whse Jornal', 'Whse Journal', 'TransNum, Instance' UNION ALL
SELECT '59', 'OIGN' , 'Entrada de mercadorias', 'Goods Receipt', 'DocEntry' UNION ALL
SELECT '60', 'OIGE' , 'Saída de mercadorias', 'Goods Issue', 'DocEntry' UNION ALL
SELECT '61', 'OPRC' , 'Centro de custo', 'Cost Center', 'PrcCode' UNION ALL
SELECT '62', 'OOCR' , 'Taxa de custo', 'Cost Rate', 'OcrCode' UNION ALL
SELECT '63', 'OPRJ' , 'Códigos de projeto', 'Project Codes', 'PrjCode' UNION ALL
SELECT '64', 'OWHS' , 'armazéns', 'Warehouses', 'WhsCode' UNION ALL
SELECT '65', 'OCOG' , 'Grupos da Comissão', 'Commission Groups', 'GroupCode' UNION ALL
SELECT '66', 'OITT' , 'Estrutura do Produto (Arvore do Produto)', 'Product Tree', 'Code' UNION ALL
SELECT '67', 'OWTR' , 'Transferência de inventário', 'Inventory Transfer', 'DocEntry' UNION ALL
SELECT '68', 'OWKO' , 'Instruções de produção', 'Production Instructions', 'OrderNum' UNION ALL
SELECT '69', 'OIPF' , 'despesas de importação', 'Landed Costs', 'DocEntry' UNION ALL
SELECT '70', 'OCRP' , 'Métodos de Pagamento', 'Payment Methods', 'CrTypeCode' UNION ALL
SELECT '71', 'OCDT' , 'Pagamento com cartão de crédito', 'Credit Card Payment', 'Code' UNION ALL
SELECT '72', 'OCRH' , 'Gestão de Cartão de Crédito', 'Credit Card Management', 'AbsId, Instance' UNION ALL
SELECT '73', 'OSCN' , 'Cliente / Cat Vendor. Não.', 'Customer/Vendor Cat. No.', 'ItemCode, CardCode, Substitute' UNION ALL
SELECT '74', 'OCRV' , 'Pagamentos de crédito', 'Credit Payments', 'AbsId, PayId, Instance' UNION ALL
SELECT '75', 'ORTT' , 'CPI e FC Rates', 'CPI and FC Rates', 'RateDate, Currency' UNION ALL
SELECT '76', 'ODPT' , 'pré-datados Depósito', 'Postdated Deposit', 'DeposId' UNION ALL
SELECT '77', 'OBGT' , 'Despesas', 'Budget', 'AbsId' UNION ALL
SELECT '78', 'OBGD' , 'Custo orçamento Avaliar. Mthd', 'Budget Cost Assess. Mthd', 'BgdCode' UNION ALL
SELECT '79', 'ORCN' , 'Redes de varejo', 'Retail Chains', 'ChainCode' UNION ALL
SELECT '80', 'OALT' , 'Template alertas', 'Alerts Template', 'Code' UNION ALL
SELECT '81', 'OALR' , 'alertas', 'Alerts', 'Code' UNION ALL
SELECT '82', 'OAIB' , 'Alertas recebidos', 'Received Alerts', 'AlertCode, UserSign' UNION ALL
SELECT '83', 'OAOB' , 'Mensagem enviada', 'Message Sent', 'AlertCode, UserSign' UNION ALL
SELECT '84', 'OCLS' , 'assuntos de atividade', 'Activity Subjects', 'Code' UNION ALL
SELECT '85', 'OSPG' , 'Preços especiais para grupos', 'Special Prices for Groups', 'CardCode, ObjType, ObjKey' UNION ALL
SELECT '86', 'SPRG' , 'Iniciar aplicação', 'Application Start', 'LineNum, UserCode' UNION ALL
SELECT '87', 'OMLS' , 'Lista de distribuição', 'Distribution List', 'Code' UNION ALL
SELECT '88', 'OENT' , 'Tipos de transporte', 'Shipping Types', 'DocEntry' UNION ALL
SELECT '89', 'OSAL' , 'Extrovertido', 'Outgoing', 'DocEntry' UNION ALL
SELECT '90', 'OTRA' , 'Transição', 'Transition', 'DocEntry' UNION ALL
SELECT '91', 'OBGS' , 'Cenário orçamento', 'Budget Scenario', 'AbsId' UNION ALL
SELECT '92', 'OIRT' , 'juros preços', 'Interest Prices', 'Numerator' UNION ALL
SELECT '93', 'OUDG' , 'padrões do usuário', 'User Defaults', 'Code' UNION ALL
SELECT '94', 'OSRI' , 'Números de série para Itens', 'Serial Numbers for Items', 'ItemCode, SysSerial' UNION ALL
SELECT '95', 'OFRT' , 'Relatório Financeiro Templates', 'Financial Report Templates', 'AbsId' UNION ALL
SELECT '96', 'OFRC' , 'Relatório Financeiro Categorias', 'Financial Report Categories', 'TemplateId, CatId' UNION ALL
SELECT '97', 'OOPR' , 'Oportunidade', 'Opportunity', 'OpprId' UNION ALL
SELECT '98', 'OOIN' , 'Interesse', 'Interest', 'Num' UNION ALL
SELECT '99', 'OOIR' , 'nível de interesse', 'Interest Level', 'Num' UNION ALL
SELECT '100', 'OOSR' , 'Fonte de informação', 'Information Source', 'Num' UNION ALL
SELECT '101', 'OOST' , 'oportunidade Stage', 'Opportunity Stage', 'Num' UNION ALL
SELECT '102', 'OOFR' , 'defeito Causa', 'Defect Cause', 'Num' UNION ALL
SELECT '103', 'OCLT' , 'Tipos de atividade', 'Activity Types', 'Code' UNION ALL
SELECT '104', 'OCLO' , 'reuniões Localização', 'Meetings Location', 'Code' UNION ALL
SELECT '105', 'OISR' , 'chamadas de serviço', 'Service Calls', 'RequestNum' UNION ALL
SELECT '106', 'OIBT' , 'Lote No. para o Item', 'Batch No. for Item', 'ItemCode, BatchNum, WhsCode' UNION ALL
SELECT '107', 'OALI' , 'Itens alternativos 2', 'Alternative Items 2', 'OrigItem, AltItem' UNION ALL
SELECT '108', 'OPRT' , 'parceiros', 'Partners', 'PrtId' UNION ALL
SELECT '109', 'OCMT' , 'concorrentes', 'Competitors', 'CompetId' UNION ALL
SELECT '110', 'OUVV' , 'As validações de utilizador', 'User Validations', 'IndexID, LineNum' UNION ALL
SELECT '111', 'OFPR' , 'Período de lançamento', 'Posting Period', 'AbsEntry' UNION ALL
SELECT '112', 'ODRF' , 'rascunhos', 'Drafts', 'DocEntry' UNION ALL
SELECT '113', 'OSRD' , 'Lotes e números de série', 'Batches and Serial Numbers', 'ItemCode, DocType, DocEntry, DocLineNum' UNION ALL
SELECT '114', 'OUDC' , 'Do usuário Monitor Cat.', 'User Display Cat.', 'CodeID' UNION ALL
SELECT '115', 'OPVL' , 'Credor - Pelecard', 'Lender – Pelecard', 'Code' UNION ALL
SELECT '116', 'ODDT' , 'Retenção na Fonte Hierarquia Dedução', 'Withholding Tax Deduction Hierarchy', 'Numerator' UNION ALL
SELECT '117', 'ODDG' , 'Grupos de Dedução do Imposto de Retenção', 'Withholding Tax Deduction Groups', 'Numerator' UNION ALL
SELECT '118', 'OUBR' , 'ramos', 'Branches', 'Code' UNION ALL
SELECT '119', 'OUDP' , 'departamentos', 'Departments', 'Code' UNION ALL
SELECT '120', 'OWST' , 'confirmação Nível', 'Confirmation Level', 'WstCode' UNION ALL
SELECT '121', 'OWTM' , 'Modelos de aprovação', 'Approval Templates', 'WtmCode' UNION ALL
SELECT '122', 'OWDD' , 'Docs. para confirmação', 'Docs. for Confirmation', 'WddCode' UNION ALL
SELECT '123', 'OCHD' , 'Cheques para Rascunhos de pagamento', 'Checks for Payment Drafts', 'CheckKey' UNION ALL
SELECT '124', 'CINF' , 'Informação da companhia', 'Company Info', 'Version' UNION ALL
SELECT '125', 'OEXD' , 'Configuração de frete', 'Freight Setup', 'ExpnsCode' UNION ALL
SELECT '126', 'OSTA' , 'Vendas autoridades fiscais', 'Sales Tax Authorities', 'Code, Type' UNION ALL
SELECT '127', 'OSTT' , 'Imposto sobre Vendas Autoridades Tipo', 'Sales Tax Authorities Type', 'AbsId' UNION ALL
SELECT '128', 'OSTC' , 'Códigos de imposto sobre vendas', 'Sales Tax Codes', 'Code' UNION ALL
SELECT '129', 'OCRY' , 'Países', 'Countries', 'Code' UNION ALL
SELECT '130', 'OCST' , 'Unidos', 'States', 'Country, Code' UNION ALL
SELECT '131', 'OADF' , 'Formatos de endereço', 'Address Formats', 'Code' UNION ALL
SELECT '132', 'OCIN' , 'A / R Fatura Correcção', 'A/R Correction Invoice', 'DocEntry' UNION ALL
SELECT '133', 'OCDC' , 'Desconto em dinheiro', 'Cash Discount', 'Code' UNION ALL
SELECT '134', 'OQCN' , 'consulta Catagories', 'Query Catagories', 'CategoryId' UNION ALL
SELECT '135', 'OIND' , 'triangular negócio', 'Triangular Deal', 'Code' UNION ALL
SELECT '136', 'ODMW' , 'Migração de dados', 'Data Migration', 'Code' UNION ALL
SELECT '137', 'OCSTN' , 'Workstation ID', 'Workstation ID', 'Code' UNION ALL
SELECT '138', 'OIDC' , 'Indicador', 'Indicator', 'Code' UNION ALL
SELECT '139', 'OGSP' , 'produtos Expedição', 'Goods Shipment', 'Code' UNION ALL
SELECT '140', 'OPDF' , 'pagamento Projecto', 'Payment Draft', 'DocEntry' UNION ALL
SELECT '141', 'OQWZ' , 'Assistente de consulta', 'Query Wizard', 'Code' UNION ALL
SELECT '142', 'OASG' , 'conta Segmentação', 'Account Segmentation', 'AbsId' UNION ALL
SELECT '143', 'OASC' , 'Conta Segmentação Categorias', 'Account Segmentation Categories', 'SegmentId, Code' UNION ALL
SELECT '144', 'OLCT' , 'Localização', 'Location', 'Code' UNION ALL
SELECT '145', 'OTNN' , '1099 Formas', '1099 Forms', 'FormCode' UNION ALL
SELECT '146', 'OCYC' , 'Ciclo', 'Cycle', 'Code' UNION ALL
SELECT '147', 'OPYM' , 'Métodos de pagamento para Assistente de pagamento', 'Payment Methods for Payment Wizard', 'PayMethCod' UNION ALL
SELECT '148', 'OTOB' , '1099 Saldo', '1099 Opening Balance', 'VendCode, Form1099, Box1099' UNION ALL
SELECT '149', 'ORIT' , 'Dunning Taxa de Juros', 'Dunning Interest Rate', 'Code' UNION ALL
SELECT '150', 'OBPP' , 'Prioridades BP', 'BP Priorities', 'PrioCode' UNION ALL
SELECT '151', 'ODUN' , 'cartas de cobrança', 'Dunning Letters', 'LineNum' UNION ALL
SELECT '152', 'CUFD' , 'Usuário Campos - Descrição', 'User Fields – Description', 'TableID, FieldID' UNION ALL
SELECT '153', 'OUTB' , 'Tabelas de usuários', 'User Tables', 'TableName' UNION ALL
SELECT '154', 'OCUMI' , 'Meus itens do menu', 'My Menu Items', 'UserSign , Id_' UNION ALL
SELECT '155', 'OPYD' , 'Run pagamento', 'Payment Run', 'Code' UNION ALL
SELECT '156', 'OPKL' , 'Lista de escolhas', 'Pick List', 'AbsEntry' UNION ALL
SELECT '157', 'OPWZ' , 'Assistente de pagamento', 'Payment Wizard', 'IdNumber' UNION ALL
SELECT '158', 'OPEX' , 'Resultados de pagamento de mesa', 'Payment Results Table', 'AbsEntry' UNION ALL
SELECT '159', 'OPYB' , 'pagamento Bloco', 'Payment Block', 'AbsEntry' UNION ALL
SELECT '160', 'OUQR' , 'consultas', 'Queries', 'IntrnalKey, Qcategory' UNION ALL
SELECT '161', 'OCBI' , 'Banco Central Ind.', 'Central Bank Ind.', 'Indicator' UNION ALL
SELECT '162', 'OMRV' , 'reavaliação do inventário', 'Inventory Revaluation', 'DocEntry' UNION ALL
SELECT '163', 'OCPI' , 'A / P Fatura Correcção', 'A/P Correction Invoice', 'DocEntry' UNION ALL
SELECT '164', 'OCPV' , 'Um Reversão Correcção Fatura / P', 'A/P Correction Invoice Reversal', 'DocEntry' UNION ALL
SELECT '165', 'OCSI' , 'A / R Fatura Correcção', 'A/R Correction Invoice', 'DocEntry' UNION ALL
SELECT '166', 'OCSV' , 'Um Reversão Correcção Fatura / R', 'A/R Correction Invoice Reversal', 'DocEntry' UNION ALL
SELECT '167', 'OSCS' , 'Service Call status', 'Service Call Statuses', 'statusID' UNION ALL
SELECT '168', 'OSCT' , 'Tipos de serviço de chamada', 'Service Call Types', 'callTypeID' UNION ALL
SELECT '169', 'OSCP' , 'Tipos de serviço de chamada com problema', 'Service Call Problem Types', 'prblmTypID' UNION ALL
SELECT '170', 'OCTT' , 'modelo de contrato', 'Contract Template', 'TmpltName' UNION ALL
SELECT '171', 'OHEM' , 'funcionários', 'Employees', 'empID' UNION ALL
SELECT '172', 'OHTY' , 'Tipos de empregado', 'Employee Types', 'typeID' UNION ALL
SELECT '173', 'OHST' , 'Estado do empregado', 'Employee Status', 'statusID' UNION ALL
SELECT '174', 'OHTR' , 'Motivo rescisão', 'Termination Reason', 'reasonID' UNION ALL
SELECT '175', 'OHED' , 'Tipos de educação', 'Education Types', 'edType' UNION ALL
SELECT '176', 'OINS' , 'Cartão de equipamento do cliente', 'Customer Equipment Card', 'insID' UNION ALL
SELECT '177', 'OAGP' , 'Nome do agente', 'Agent Name', 'AgentCode' UNION ALL
SELECT '178', 'OWHT' , 'Retenção na fonte', 'Withholding Tax', 'WTCode' UNION ALL
SELECT '179', 'ORFL' , 'Já exibidas 347, 349 e Relatórios WTax', 'Already Displayed 347, 349 and WTax Reports', 'DocEntry, ReportType, DocType, LineNum, TaxCode, OrdinalNum' UNION ALL
SELECT '180', 'OVTR' , 'Relatório de imposto', 'Tax Report', 'AbsEntry' UNION ALL
SELECT '181', 'OBOE' , 'Letra de câmbio para pagamento', 'Bill of Exchange for Payment', 'BoeKey' UNION ALL
SELECT '182', 'OBOT' , 'Bill Of Exchang Transação', 'Bill Of Exchang Transaction', 'AbsEntry' UNION ALL
SELECT '183', 'OFRM' , 'Formato de arquivo', 'File Format', 'AbsEntry' UNION ALL
SELECT '184', 'OPID' , 'Indicador período', 'Period Indicator', 'Indicator' UNION ALL
SELECT '185', 'ODOR' , 'Dívidas duvidosas', 'Doubtful Debts', 'AbsEntry' UNION ALL
SELECT '186', 'OHLD' , 'Tabela do feriado', 'Holiday Table', 'HldCode' UNION ALL
SELECT '187', 'OCRB' , 'BP - Conta Bancária', 'BP – Bank Account', 'Country, BankCode, Account, CardCode' UNION ALL
SELECT '188', 'OSST' , 'Service Call Solution status', 'Service Call Solution Statuses', 'Number' UNION ALL
SELECT '189', 'OSLT' , 'Serviço de chamada de Soluções', 'Service Call Solutions', 'SltCode' UNION ALL
SELECT '190', 'OCTR' , 'Contratos de serviço', 'Service Contracts', 'ContractID' UNION ALL
SELECT '191', 'OSCL' , 'chamadas de serviço', 'Service Calls', 'callID' UNION ALL
SELECT '192', 'OSCO' , 'Serviço de chamada Origens', 'Service Call Origins', 'originID' UNION ALL
SELECT '193', 'OUKD' , 'Usuário Tecla Descrição', 'User Key Description', 'TableName, KeyId' UNION ALL
SELECT '194', 'OQUE' , 'Fila', 'Queue', 'queueID' UNION ALL
SELECT '195', 'OIWZ' , 'inflação Assistente', 'Inflation Wizard', 'AbsEntry' UNION ALL
SELECT '196', 'ODUT' , 'Condições de advertência', 'Dunning Terms', 'TermCode' UNION ALL
SELECT '197', 'ODWZ' , 'Assistente Dunning', 'Dunning Wizard', 'WizardId' UNION ALL
SELECT '198', 'OFCT' , 'Previsão de vendas', 'Sales Forecast', 'AbsID' UNION ALL
SELECT '199', 'OMSN' , 'cenários MRP', 'MRP Scenarios', 'AbsEntry' UNION ALL
SELECT '200', 'OTER' , 'territórios', 'Territories', 'territryID' UNION ALL
SELECT '201', 'OOND' , 'Indústrias', 'Industries', 'IndCode' UNION ALL
SELECT '202', 'OWOR' , 'Ordem de produção', 'Production Order', 'DocEntry' UNION ALL
SELECT '205', 'OPKG' , 'Tipos de pacotes', 'Package Types', 'PkgCode' UNION ALL
SELECT '206', 'OUDO' , 'Objeto definido pelo usuário', 'User-Defined Object', 'Code' UNION ALL
SELECT '207', 'ODOW' , 'Propriedade de dados - Objectos', 'Data Ownership – Objects', 'Object, SubObject' UNION ALL
SELECT '208', 'ODOX' , 'Propriedade de dados - Exceções', 'Data Ownership – Exceptions', 'QueryId, Object, SubObject' UNION ALL
SELECT '210', 'OHPS' , 'empregado Posição', 'Employee Position', 'posID' UNION ALL
SELECT '211', 'OHTM' , 'equipes de funcionários', 'Employee Teams', 'teamID' UNION ALL
SELECT '212', 'OORL' , 'relações', 'Relationships', 'OrlCode' UNION ALL
SELECT '213', 'ORCM' , 'recomendação de dados', 'Recommendation Data', 'DocEntry' UNION ALL
SELECT '214', 'OUPT' , 'Árvore Auth usuário', 'User Autorization Tree', 'AbsId' UNION ALL
SELECT '215', 'OPDT' , 'texto predefinido', 'Predefined Text', 'AbsEntry' UNION ALL
SELECT '216', 'OBOX' , 'box Definição', 'Box Definition', 'BoxCode, ReportType, BosCode' UNION ALL
SELECT '217', 'OCLA' , 'status da atividade', 'Activity Status', 'statusID' UNION ALL
SELECT '218', 'OCHF' , '', '312', 'ObjName' UNION ALL
SELECT '219', 'OCSHS' , 'Valores definidos pelo usuário', 'User-Defined Values', 'IndexID' UNION ALL
SELECT '220', 'OACP' , 'períodos Categoria', 'Periods Category', 'AbsEntry' UNION ALL
SELECT '221', 'OATC' , 'anexos', 'Attachments', 'AbsEntry' UNION ALL
SELECT '222', 'OGFL' , 'Filtro de grade', 'Grid Filter', 'FormID, GridID, UserCode' UNION ALL
SELECT '223', 'OLNG' , 'Tabela idioma do usuário', 'User Language Table', 'Code' UNION ALL
SELECT '224', 'OMLT' , 'Multi-Language Translation', 'Multi-Language Translation', 'TranEntry' UNION ALL
SELECT '229', 'SDIS' , 'Interface dinâmica (Cordas)', 'Dynamic Interface (Strings)', 'FormId, ItemId, ColumnId, Language' UNION ALL
SELECT '230', 'OSVR' , 'reconciliações Saved', 'Saved Reconciliations', 'acctCode' UNION ALL
SELECT '231', 'DSC1' , 'Casa Contas Bancárias', 'House Bank Accounts', 'AbsEntry' UNION ALL
SELECT '232', 'RDOC' , 'Documento', 'Document', 'DocCode' UNION ALL
SELECT '233', 'ODGP' , 'Conjuntos documento Geração de Parâmetros', 'Document Generation Parameter Sets', 'AbsEntry' UNION ALL
SELECT '234', 'OMHD' , '', '#740', 'AlertCode' UNION ALL
SELECT '238', 'OACG' , 'Categoria conta', 'Account Category', 'AbsId' UNION ALL
SELECT '239', 'OBCA' , 'Banco cobra códigos de alocação', 'Bank Charges Allocation Codes', 'Code' UNION ALL
SELECT '241', 'OCFT' , 'Transações fluxo de caixa - Linhas', 'Cash Flow Transactions – Rows', 'CFTId' UNION ALL
SELECT '242', 'OCFW' , 'Linha de fluxo de caixa do item', 'Cash Flow Line Item', 'CFWId' UNION ALL
SELECT '247', 'OBPL' , 'Lugar de negócios', 'Business Place', 'BPLId' UNION ALL
SELECT '250', 'OJPE' , 'Calendário Época local', 'Local Era Calendar', 'Code' UNION ALL
SELECT '251', 'ODIM' , 'Custo Dimension Contabilidade', 'Cost Accounting Dimension', 'DimCode' UNION ALL
SELECT '254', 'OSCD' , 'Tabela Código de serviço', 'Service Code Table', 'AbsEntry' UNION ALL
SELECT '255', 'OSGP' , 'Grupo de serviço para o Brasil', 'Service Group for Brazil', 'AbsEntry' UNION ALL
SELECT '256', 'OMGP' , 'Grupo material', 'Material Group', 'AbsEntry' UNION ALL
SELECT '257', 'ONCM' , 'Código NCM', 'NCM Code', 'AbsEntry' UNION ALL
SELECT '258', 'OCFP' , 'CFOP para Nota Fiscal', 'CFOP for Nota Fiscal', 'ID' UNION ALL
SELECT '259', 'OTSC' , 'Código CST para Nota Fiscal', 'CST Code for Nota Fiscal', 'ID' UNION ALL
SELECT '260', 'OUSG' , 'Uso da Nota Fiscal', 'Usage of Nota Fiscal', 'ID' UNION ALL
SELECT '261', 'OCDP' , 'Data de Fechamento Procedimento', 'Closing Date Procedure', 'ClsDateNum' UNION ALL
SELECT '263', 'ONFN' , 'Nota Fiscal de Numeração', 'Nota Fiscal Numbering', 'ObjectCode, DocSubType' UNION ALL
SELECT '264', 'ONFT' , 'Categoria Nota Fiscal Fiscal (Brasil)', 'Nota Fiscal Tax Category (Brazil)', 'AbsId' UNION ALL
SELECT '265', 'OCNT' , 'Condados', 'Counties', 'AbsId' UNION ALL
SELECT '266', 'OTCD' , 'Determinação do código de imposto', 'Tax Code Determination', 'AbsId' UNION ALL
SELECT '267', 'ODTY' , 'BoE Tipo de Documento', 'BoE Document Type', 'AbsEntry' UNION ALL
SELECT '268', 'OPTF' , 'BoE Portfolio', 'BoE Portfolio', 'AbsEntry' UNION ALL
SELECT '269', 'OIST' , 'Instrução BoE', 'BoE Instruction', 'AbsEntry' UNION ALL
SELECT '271', 'OTPS' , 'imposto Parâmetro', 'Tax Parameter', 'AbsId' UNION ALL
SELECT '275', 'OTFC' , 'Tipo de imposto Combinação', 'Tax Type Combination', 'AbsId' UNION ALL
SELECT '276', 'OFML' , 'Fórmula imposto Tabela mestre', 'Tax Formula Master Table', 'AbsId' UNION ALL
SELECT '278', 'OCNA' , 'Código CNAE', 'CNAE Code', 'AbsId' UNION ALL
SELECT '280', 'OTSI' , 'Vendas Nota Fiscal', 'Sales Tax Invoice', 'DocEntry' UNION ALL
SELECT '281', 'OTPI' , 'Compra Nota Fiscal', 'Purchase Tax Invoice', 'DocEntry' UNION ALL
SELECT '283', 'OCCD' , 'Números declaração aduaneira de carga', 'Cargo Customs Declaration Numbers', 'CCDNum' UNION ALL
SELECT '290', 'ORSC' , 'Recursos', 'Resources', 'ResCode' UNION ALL
SELECT '291', 'ORSG' , 'Propriedades do recurso', 'Resource Properties', 'ResTypCod' UNION ALL
SELECT '292', 'ORSB' , 'ResGrpCod', 'ResGrpCod', 'ResGrpCod' UNION ALL
SELECT '321', 'OITR' , 'Reconciliação interna', 'Internal Reconciliation', 'ReconNum' UNION ALL
SELECT '541', 'OPOS' , 'POS Dados Mestre', 'POS Master Data', 'EquipNo' UNION ALL
SELECT '10000105', 'OMSG' , 'Configurações do serviço de mensagens', 'Messaging Service Settings', 'USERID' UNION ALL
SELECT '10000044', 'OBTN' , 'Números de lote Dados Mestre', 'Batch Numbers Master Data', 'AbsEntry' UNION ALL
SELECT '10000045', 'OSRN' , 'Números de série de dados mestre', 'Serial Numbers Master Data', 'AbsEntry' UNION ALL
SELECT '10000062', 'OIVK' , 'IVL Vs Chaves OINM', 'IVL Vs OINM Keys', 'TransSeq' UNION ALL
SELECT '10000071', 'OIQR' , 'Posting Inventory', 'Inventory Posting', 'DocEntry' UNION ALL
SELECT '10000073', 'OFYM' , 'Exercício Mestre', 'Financial Year Master', 'AbsId' UNION ALL
SELECT '10000074', 'OSEC' , 'Seções', 'Sections', 'AbsId' UNION ALL
SELECT '10000075', 'OCSN' , 'Série certificado', 'Certificate Series', 'AbsId' UNION ALL
SELECT '10000077', 'ONOA' , 'Natureza do assessee', 'Nature of Assessee', 'AbsId' UNION ALL
SELECT '10000196', 'RTYP' , 'Documento Lista de tipos', 'Document Type List', 'CODE' UNION ALL
SELECT '10000197', 'OUGP' , 'Grupo UoM', 'UoM Group', 'UgpEntry' UNION ALL
SELECT '10000199', 'OUOM' , 'UoM Dados Mestre', 'UoM Master Data', 'UomEntry' UNION ALL
SELECT '10000203', 'OBFC' , 'Configuração Campo Bin', 'Bin Field Configuration', 'AbsEntry' UNION ALL
SELECT '10000204', 'OBAT' , 'Bin Localização Atributo', 'Bin Location Attribute', 'AbsEntry' UNION ALL
SELECT '10000205', 'OBSL' , 'armazém Sublevel', 'Warehouse Sublevel', 'AbsEntry' UNION ALL
SELECT '10000206', 'OBIN' , 'bin Localização', 'Bin Location', 'AbsEntry' UNION ALL
SELECT '140000041', 'ODNF' , 'Código DNF', 'DNF Code', 'AbsEntry' UNION ALL
SELECT '231000000', 'OUGR' , 'Grupo de autorização', 'Authorization Group', 'GroupId' UNION ALL
SELECT '234000004', 'OEGP' , 'E-Mail Group', 'E-Mail Group', 'EmlGrpCode' UNION ALL
SELECT '243000001', 'OGPC' , 'Código de pagamento do governo', 'Government Payment Code', 'AbsId' UNION ALL
SELECT '310000001', 'OIQI' , 'Balanço Inventário de abertura', 'Inventory Opening Balance', 'DocEntry' UNION ALL
SELECT '310000008', 'OBTW' , 'Batch Atributos em Localização', 'Batch Attributes in Location', 'AbsEntry' UNION ALL
SELECT '410000005', 'OLLF' , 'Legal Format Lista', 'Legal List Format', 'AbsEntry' UNION ALL
SELECT '480000001', 'OHET' , 'Objecto: Transferência de RH empregado', 'Object: HR Employee Transfer', 'TransferID' UNION ALL
SELECT '540000005', 'OTCX' , 'Determinação do código de imposto', 'Tax Code Determination', 'DocEntry' UNION ALL
SELECT '540000040', 'ORCP' , 'Recorrentes Template Transação', 'Recurring Transaction Template', 'AbsEntry' UNION ALL
SELECT '540000042', 'OCCT' , 'Centro de Custo Tipo', 'Cost Center Type', 'CctCode' UNION ALL
SELECT '540000048', 'OACR' , 'competência Tipo', 'Accrual Type', 'Code' UNION ALL
SELECT '540000056', 'ONFM' , 'Nota Fiscal Modelo', 'Nota Fiscal Model', 'AbsEntry' UNION ALL
SELECT '540000067', 'OBFI' , 'Brasil Combustível indexador', 'Brazil Fuel Indexer', 'ID' UNION ALL
SELECT '540000068', 'OBBI' , 'Brasil bebidas indexador', 'Brazil Beverage Indexer', 'ID' UNION ALL
SELECT '1210000000', 'OCPT' , 'Tabela principal Cockpit', 'Cockpit Main Table', 'AbsEntry' UNION ALL
SELECT '1250000001', 'OWTQ' , 'Transferência de inventário Pedido', 'Inventory Transfer Request', 'DocEntry' UNION ALL
SELECT '1250000025', 'OOAT' , 'Acordo Blanket', 'Blanket Agreement', 'AbsID' UNION ALL
SELECT '1320000000', 'OKPI' , 'Key Performance Package Indicator', 'Key Performance Indicator Package', 'AbsEntry' UNION ALL
SELECT '1320000002', 'OTGG' , 'Grupo alvo', 'Target Group', 'TargetCode' UNION ALL
SELECT '1320000012', 'OCPN' , 'Campanha', 'Campaign', 'CpnNo' UNION ALL
SELECT '1320000028', 'OROC' , 'Códigos de Retorno de operação', 'Retorno Operation Codes', 'AbsEntry' UNION ALL
SELECT '1320000039', 'OPSC' , 'O produto Código Fonte', 'Product Source Code', 'Code' UNION ALL
SELECT '1470000000', 'ODTP' , 'Fixos Tipos de depreciação dos bens', 'Fixed Assets Depreciation Types', 'Code' UNION ALL
SELECT '1470000002', 'OADT' , 'Fixed Assets Determinação Conta', 'Fixed Assets Account Determination', 'Code' UNION ALL
SELECT '1470000003', 'ODPA' , 'Áreas de depreciação de ativos fixos', 'Fixed Asset Depreciation Areas', 'Code' UNION ALL
SELECT '1470000004', 'ODPP' , 'Pools Tipo Depreciação', 'Depreciation Type Pools', 'Code' UNION ALL
SELECT '1470000032', 'OACS' , 'Classes de ativos', 'Asset Classes', 'Code' UNION ALL
SELECT '1470000046', 'OAGS' , 'Grupos de ativos', 'Asset Groups', 'Code' UNION ALL
SELECT '1470000048', 'ODMC' , 'G / L conta Critérios Determinação - Inventário', 'G/L Account Determination Criteria – Inventory', 'DmcId' UNION ALL
SELECT '1470000049', 'OACQ' , 'Capitalização', 'Capitalization', 'DocEntry' UNION ALL
SELECT '1470000057', 'OGAR' , 'G L Regras Avançadas / Conta', 'G/L Account Advanced Rules', 'AbsEntry' UNION ALL
SELECT '1470000060', 'OACD' , 'nota de crédito', 'Credit Memo', 'DocEntry' UNION ALL
SELECT '1470000062', 'OBCD' , 'Código de barras de dados mestre', 'Bar Code Master Data', 'BcdEntry' UNION ALL
SELECT '1470000065', 'OINC' , 'Contando o inventário', 'Inventory Counting', 'DocEntry' UNION ALL
SELECT '1470000077', 'OEDG' , 'desconto de Grupos', 'Discount Groups', 'AbsEntry' UNION ALL
SELECT '1470000092', 'OCCS' , 'Ciclo determinação da contagem', 'Cycle Count Determination', 'WhsCode' UNION ALL
SELECT '1620000000', 'OWLS' , 'Fluxo de Trabalho - Detalhes da tarefa', 'Workflow – Task Details', 'TaskID'


GO