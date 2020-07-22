###################### POPULANDO O BANCO ##############################

/*CONVENENTE */
Insert into TB_CONVENENTE (CNPJ,NOME,ENDERECO,NATJUR) values ('50.307.590/0001-78','RASEC','Rua X - n 101','LTDA');

Insert into TB_CONVENENTE (CNPJ,NOME,ENDERECO,NATJUR) values ('62.395.986/0001-01','ACME','Rua Looney Toones - n 10','LTDA');

Insert into TB_CONVENENTE (CNPJ,NOME,ENDERECO,NATJUR) values ('18.781.013/0001-00','JUST. LEAGUE','Rua DC - n 45 - Gothan','S/A');

Insert into TB_CONVENENTE (CNPJ,NOME,ENDERECO,NATJUR) values ('33.464.849/0001-75','STARK IND.','Rua Avengers - n 45','S/A');





/*  CONVENIADA */
Insert into TB_CONVENIADA (CNPJ,NOME,ENDERECO,NATJUR) values ('08.407.183/0001-76','TABAJARA','Rua y - n 10','S/A');




/*GERENTES */

/*temp */
  INSERT INTO TB_GERENTE (NOME, EMAIL, FONES_GERENTE)  VALUES ( 'Josemário Sousa', 'jfsj4@rasec.org.br',  tp_nt_fone(tp_fone('81', '99889-8998'), tp_fone('81','91234-5678')));


  INSERT INTO TB_GERENTE (NOME, EMAIL, FONES_GERENTE)  VALUES ( 'Anderson Silva', 'aps3@rasec.org.br',  tp_nt_fone(tp_fone('81', '91122-3344'), tp_fone('81','93344-1122')));

  INSERT INTO TB_GERENTE (NOME, EMAIL, FONES_GERENTE)  VALUES ( 'Claudia Cunha', 'cmac@rasec.org.br',  tp_nt_fone(tp_fone('81', '95566-7788'), tp_fone('81','99999-0336')));

 INSERT INTO TB_GERENTE (NOME, EMAIL, FONES_GERENTE)  VALUES ( 'Carol Salgado', 'cs@rasec.org.br',  tp_nt_fone(tp_fone('81', '98888-1445'), tp_fone('81','93948-1122')));





/* CONTRATO */

Insert into TB_CONTRATO (matriculagerente, datacontrato, prazo_meses, obrigacoesconvenente, obrigacoesconveniada) values (1, '17/07/2020', 12, 'Comparecer ao projeto 1 vez a cada 15 dias', 'Entregar uma release a cada 15 dias');

Insert into TB_CONTRATO (matriculagerente, datacontrato, prazo_meses, obrigacoesconvenente, obrigacoesconveniada) values (2, '15/07/2020', 24, 'Comparecer ao projeto 1 vez a cada 15 dias', 'Entregar uma release a cada 15 dias');

Insert into TB_CONTRATO (matriculagerente, datacontrato, prazo_meses, obrigacoesconvenente, obrigacoesconveniada) values (4, '13/07/2020',12, 'Comparecer ao projeto 1 vez a cada 10 dias', 'Entregar uma release a cada 10 dias');

Insert into TB_CONTRATO (matriculagerente, datacontrato, prazo_meses, obrigacoesconvenente, obrigacoesconveniada) values (3, '10/07/2020', 6, 'Acompanhar projeto remotamente', 'Rodar sistema na VPN do cliente');

Insert into TB_CONTRATO (matriculagerente, datacontrato, prazo_meses, obrigacoesconvenente, obrigacoesconveniada) values (2, '13/07/2020', 24, 'Comparecer ao projeto 1 vez a cada 15 dias', 'Entregar uma release a cada 15 dias');


	




/* RELAÇÃO FIRMA */

Insert into TB_REL_FIRMA (CNPJCONVENENTE, CNPJCONVENIADA, NUMCONTRATO) values ('50.307.590/0001-78', '08.407.183/0001-76', 1);

Insert into TB_REL_FIRMA (CNPJCONVENENTE, CNPJCONVENIADA, NUMCONTRATO) values ('50.307.590/0001-78', '08.407.183/0001-76', 2);

Insert into TB_REL_FIRMA (CNPJCONVENENTE, CNPJCONVENIADA, NUMCONTRATO) values ('62.395.986/0001-01', '08.407.183/0001-76', 3);

Insert into TB_REL_FIRMA (CNPJCONVENENTE, CNPJCONVENIADA, NUMCONTRATO) values ('18.781.013/0001-00', '08.407.183/0001-76', 4);

Insert into TB_REL_FIRMA (CNPJCONVENENTE, CNPJCONVENIADA, NUMCONTRATO) values ('33.464.849/0001-75', '08.407.183/0001-76', 5);




/* COORD. TÉCNICO */

Insert into TB_COORDTECNICO (CPF, NOME, CARGO, EMAIL) values ('129.591.540-53', 'ASTROGILDO DA SILVA', 'Coord. de Eng.', 'as@rasec.org.br');

Insert into TB_COORDTECNICO (CPF, NOME, CARGO, EMAIL) values ('543.767.540-43', 'ANTONIO NASCIMENTO', 'Coord. de Eng.', 'an@rasec.org.br');

Insert into TB_COORDTECNICO (CPF, NOME, CARGO, EMAIL) values ('433.007.784-35', 'ALICE NASCIMENTO DA SILVA', 'Coord. de Eng.', 'ans@rasec.org.br');

Insert into TB_COORDTECNICO (CPF, NOME, CARGO, EMAIL) values ('773.221.907-44', 'MARIANA DE PAULA CARVALHO', 'Coord. de Eng.', 'mpc@rasec.org.br');

Insert into TB_COORDTECNICO (CPF, NOME, CARGO, EMAIL) values ('845.910.019-07', 'DANIELLE DO NASCIMENTO SILVA', 'Coord. de Eng.', 'dns@rasec.org.br');



/* INSERINDO EM TB_FONESCOORD - VARRAY */

Insert into TB_FONESCOORD (MATRICULA, FONES) values (1, tp_fones(tp_fone('81','93234-4323'), tp_fone('81','98764-9876')));


Insert into TB_FONESCOORD (MATRICULA, FONES) values (2, tp_fones(tp_fone('81','98989-1223'), tp_fone('81','90021-1122')));

Insert into TB_FONESCOORD (MATRICULA, FONES) values (3, tp_fones(tp_fone('81','98876-1234'), tp_fone('81','99009-2211')));

Insert into TB_FONESCOORD (MATRICULA, FONES) values (4, tp_fones(tp_fone('81','98888-6556'), tp_fone('81','99900-1012')));

Insert into TB_FONESCOORD (MATRICULA, FONES) values (5, tp_fones(tp_fone('81','98778-0055'), tp_fone('81','96758-1029')));



/* INSERINDO NA TABELA PROJETO */

INSERT INTO TB_PROJETO(NOME, RECURSOS, COD_COORD_TECNICO, PLANO_TRABALHO) VALUES ('ASIA', '5 ENG. 5 DESIGNERS', 1, 'SPRINTS SEMANAIS');

INSERT INTO TB_PROJETO(NOME, RECURSOS, COD_COORD_TECNICO, PLANO_TRABALHO) VALUES ('ULTRON', '50 ENG. 15 DESIGNERS', 2, 'SPRINTS QUINZENAIS');

INSERT INTO TB_PROJETO(NOME, RECURSOS, COD_COORD_TECNICO, PLANO_TRABALHO) VALUES ('AMAZO', '50 ENG. 15 DESIGNERS', 3, 'SPRINTS QUINZENAIS');

INSERT INTO TB_PROJETO(NOME, RECURSOS, COD_COORD_TECNICO, PLANO_TRABALHO) VALUES ('TINY TOONS', '5 ENG. 25 DESIGNERS', 4, 'SPRINTS SEMANAIS');

INSERT INTO TB_PROJETO(NOME, RECURSOS, COD_COORD_TECNICO, PLANO_TRABALHO) VALUES ('OCEANIA', '8 ENG. 3 DESIGNERS', 5, 'SPRINTS SEMANAIS');


INSERT INTO TB_PROJETO(NOME, RECURSOS, COD_COORD_TECNICO, PLANO_TRABALHO) VALUES ('HULK', '50 ENG. 15 DESIGNERS', 2, 'SPRINTS QUINZENAIS');



/* INSERINDO UM TA  COM REF */

INSERT INTO TB_TA ( NUMCONTRATO, COD_PROJETO, PRAZO_MESES, TERMOSRESCISAO, VALOR) VALUES (4, (
SELECT REF(c) FROM TB_PROJETO c WHERE COD_PROJETO = 3), 12, 'CASO A CONVENIADA ATRASE UMA SPRINT', 100000);

INSERT INTO TB_TA (NUMCONTRATO, COD_PROJETO, PRAZO_MESES, TERMOSRESCISAO, VALOR) VALUES (5, (
SELECT REF(c) FROM TB_PROJETO c WHERE COD_PROJETO = 2), 12, 'CASO A CONVENIADA ATRASE UMA SPRINT', 2000000);

INSERT INTO TB_TA (NUMCONTRATO, COD_PROJETO, PRAZO_MESES, TERMOSRESCISAO, VALOR) VALUES (1, (
SELECT REF(c) FROM TB_PROJETO c WHERE COD_PROJETO = 1), 24, 'CASO A CONVENIADA ATRASE UMA SPRINT', 200000);

INSERT INTO TB_TA (NUMCONTRATO, COD_PROJETO, PRAZO_MESES, TERMOSRESCISAO, VALOR) VALUES (1, (
SELECT REF(c) FROM TB_PROJETO c WHERE COD_PROJETO = 5), 12, 'CASO A CONVENIADA ATRASE TRÊS SPRINTS', 50000);

INSERT INTO TB_TA (NUMCONTRATO, COD_PROJETO, PRAZO_MESES, TERMOSRESCISAO, VALOR) VALUES (3, (
SELECT REF(c) FROM TB_PROJETO c WHERE COD_PROJETO = 4), 6, 'CASO A CONVENIADA ATRASE DUAS SPRINTS', 52345);

INSERT INTO TB_TA (NUMCONTRATO, COD_PROJETO, PRAZO_MESES, TERMOSRESCISAO, VALOR) VALUES (5, (
SELECT REF(c) FROM TB_PROJETO c WHERE COD_PROJETO = 6), 2, 'CASO A CONVENIADA ATRASE UMA SPRINT', 2345000);



