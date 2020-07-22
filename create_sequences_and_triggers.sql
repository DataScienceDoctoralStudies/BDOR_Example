/* GERAÇÃO DE SEQUENCES PARA AUTO INCREMENTO DE IDs
*/
CREATE SEQUENCE seq_matCoord
nocache;

create or replace trigger gera_coor_mat
	before insert on tb_coordTecnico
	for each row
	begin
 		select seq_matCoord.nextval into :new.matricula from dual;
	end;
	/


CREATE SEQUENCE seq_numContrato
nocache;

create or replace trigger gera_num_contrato
	before insert on tb_contrato
	for each row
	begin
 		select seq_numContrato.nextval into :new.numcontrato from dual;
	end;
	/

CREATE SEQUENCE seq_matGerente
nocache;

create or replace trigger gera_mat_ger
	before insert on tb_gerente
	for each row
	begin
 		select seq_matGerente.nextval into :new.matricula from dual;
	end;
	/

CREATE SEQUENCE seq_codProjeto
nocache;

create or replace trigger gera_cod_proj
	before insert on tb_projeto
	for each row
	begin
 		select seq_codProjeto.nextval into :new.cod_projeto from dual;
	end;
	/

CREATE SEQUENCE seq_codTA
nocache;

create or replace trigger gera_cod_TA
	before insert on tb_TA
	for each row
	begin
 		select seq_codTA.nextval into :new.cod_ta from dual;
	end;
	/



/* TRIGGERS */

CREATE OR REPLACE TRIGGER verifica_data_ta
BEFORE INSERT ON tb_ta
for each row
DECLARE
 x INTEGER;
 y tp_contrato;
 
BEGIN
    SELECT c.prazo_meses INTO x FROM tb_contrato c WHERE c.numcontrato = :NEW.numcontrato;
    IF :NEW.prazo_meses > x THEN
        RAISE_APPLICATION_ERROR(-20022, 'Não é possível construir um TA com prazo maior que o contrato atrelado');
    END IF;
END;
/
