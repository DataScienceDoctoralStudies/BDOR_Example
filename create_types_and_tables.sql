/* ORDEM DE DROP NAS TABELAS */

DROP TABLE TB_TA;
DROP TABLE TB_REL_FIRMA;
DROP TABLE TB_CONTRATO;
DROP TABLE TB_GERENTE;
DROP TABLE TB_CONVENIADA;
DROP TABLE TB_CONVENENTE;
DROP TABLE TB_PROJETO;
DROP TABLE TB_FONESCOORD;
DROP TABLE TB_COORDTECNICO;
DROP TYPE TP_TA;
DROP TYPE TB_REL_FIRMA;
DROP type TP_CONTRATO;
DROP TYPE TP_GERENTE;
DROP TYPE TP_CONVENIADA;
DROP TYPE TP_CONVENENTE;
DROP TYPE TP_PROJETO;
DROP TYPE TP_FONESCOORD;
DROP TYPE TP_COORDTECNICO;







/*Criação do tipo genérico empresa e dos tipos conveniada e convenente */
/*##### BUILDING ABSTRACT TYPE  empresa, TYPES  conveniada AND convenente #######*/


CREATE OR REPLACE TYPE tp_empresa AS OBJECT(
    CNPJ VARCHAR2(18),
    nome VARCHAR2(15),
    endereco VARCHAR2(30),
    natJur VARCHAR2(15),
    
    MEMBER PROCEDURE exibir_dados_empresa (SELF tp_empresa) ,
    FINAL MAP MEMBER FUNCTION projetoCNPJ RETURN VARCHAR2
)NOT INSTANTIABLE NOT FINAL;
/


CREATE OR REPLACE TYPE BODY tp_empresa AS 

    MEMBER PROCEDURE exibir_dados_empresa(SELF tp_empresa) IS

    BEGIN
        DBMS_OUTPUT.PUT_LINE('Dados da Empresa');
        DBMS_OUTPUT.PUT_LINE('CNPJ' || TO_CHAR(CNPJ));
        DBMS_OUTPUT.PUT_LINE('Nome' || TO_CHAR(nome));
    END;
    	FINAL MAP MEMBER FUNCTION projetoCNPJ RETURN VARCHAR2 IS
    BEGIN
        RETURN CNPJ;
    END;
END;
/




/* ###################### CONSTRUINDO OS TIPOS CONVENENTE E CONVENIADA,  USANDO CONSTRUCTOR E OVERRIDING##################*/

/* ###################### BUILDING CONVENENTE AND CONVENIADA TYPES, BY USING CONSTRUCTOR AND OVERRIDING##################*/


CREATE OR REPLACE TYPE tp_conveniada UNDER tp_empresa(
OVERRIDING MEMBER PROCEDURE exibir_dados_empresa (SELF tp_conveniada),
CONSTRUCTOR FUNCTION tp_conveniada(x tp_conveniada)
	RETURN SELF AS RESULT);
/

CREATE OR REPLACE TYPE BODY tp_conveniada AS

   OVERRIDING MEMBER PROCEDURE exibir_dados_empresa(SELF tp_conveniada) IS

	BEGIN
    	DBMS_OUTPUT.PUT_LINE('Dados da Conveniada');
    	DBMS_OUTPUT.PUT_LINE('CNPJ da Conveniada' || TO_CHAR(CNPJ));
    	DBMS_OUTPUT.PUT_LINE('Nome da Conveniada' || TO_CHAR(nome));
	END;
    
	CONSTRUCTOR FUNCTION tp_conveniada(x tp_conveniada)
	RETURN SELF AS RESULT
	AS
	BEGIN
    	SELF.CNPJ := x.CNPJ;
    	SELF.nome := x.nome;
    	SELF.endereco := x.endereco;
    	SELF.natJur := x.natJur;
    	RETURN;
	END;
    
  END;
/

CREATE OR REPLACE TYPE tp_convenente UNDER tp_empresa(
OVERRIDING MEMBER PROCEDURE exibir_dados_empresa (SELF tp_convenente),
CONSTRUCTOR FUNCTION tp_convenente(x tp_convenente)
	RETURN SELF AS RESULT);
/

CREATE OR REPLACE TYPE BODY tp_convenente AS

   OVERRIDING MEMBER PROCEDURE exibir_dados_empresa(SELF tp_convenente) IS

	BEGIN
    	DBMS_OUTPUT.PUT_LINE('Dados da Convenente');
    	DBMS_OUTPUT.PUT_LINE('CNPJ da Convenente' || TO_CHAR(CNPJ));
    	DBMS_OUTPUT.PUT_LINE('Nome da Convenente' || TO_CHAR(nome));
	END;
    
	CONSTRUCTOR FUNCTION tp_convenente(x tp_convenente)
	RETURN SELF AS RESULT
	AS
	BEGIN
    	SELF.CNPJ := x.CNPJ;
    	SELF.nome := x.nome;
    	SELF.endereco := x.endereco;
    	SELF.natJur := x.natJur;
    	RETURN;
	END;
    
  END;
/


/* VARRAY DE TELEFONES */

CREATE OR REPLACE TYPE tp_fone AS OBJECT(
cod_area VARCHAR2(2),
numero VARCHAR2(10));
/

CREATE OR REPLACE TYPE tp_fones AS VARRAY(3) OF tp_fone;
/

/*############ nested table de telefones para gerente #################*/
CREATE OR REPLACE TYPE tp_nt_fone AS TABLE OF tp_fone;
/



/* ################# Criei o tipo tp_gerente ###################*/

create or replace TYPE tp_gerente AS OBJECT (
  matricula NUMBER,
  nome VARCHAR2(30),
  email VARCHAR2(20),
  fones_gerente tp_nt_fone,

MEMBER PROCEDURE exibir_dados_gerente (SELF tp_gerente),
    MAP MEMBER FUNCTION gerenteMat RETURN NUMBER
);
/


CREATE OR REPLACE TYPE BODY tp_gerente AS 

    MEMBER PROCEDURE exibir_dados_gerente(SELF tp_gerente) IS

    BEGIN
        DBMS_OUTPUT.PUT_LINE('Dados do Gerente');
        DBMS_OUTPUT.PUT_LINE('Matricula' || TO_CHAR(matricula));
        DBMS_OUTPUT.PUT_LINE('Nome' || TO_CHAR(nome));
    END;
    MAP MEMBER FUNCTION gerenteMat RETURN NUMBER IS
    BEGIN
        RETURN matricula;
    END;
END;
/



/*Criei o tipo contrato e a tabela contrato já com foreign key */

create or replace TYPE tp_contrato AS OBJECT (
  numContrato NUMBER,
  matriculaGerente NUMBER,
  dataContrato DATE,
  prazo_meses INTEGER,
  obrigacoesConvenente VARCHAR2(200),
  obrigacoesConveniada VARCHAR2(200),

MEMBER PROCEDURE exibir_dados_contrato (SELF tp_contrato),
    MAP MEMBER FUNCTION contratoNum RETURN NUMBER

);
/

CREATE OR REPLACE TYPE BODY tp_contrato AS 

    MEMBER PROCEDURE exibir_dados_contrato (SELF tp_contrato) IS

    BEGIN
        DBMS_OUTPUT.PUT_LINE('Dados do Contrato');
        DBMS_OUTPUT.PUT_LINE('Numero' || TO_CHAR(numContrato));
        DBMS_OUTPUT.PUT_LINE('Matricula do Gerente' || TO_CHAR(matriculaGerente));
        DBMS_OUTPUT.PUT_LINE('data do Contrato' || TO_CHAR(dataContrato));
        DBMS_OUTPUT.PUT_LINE('Prazo em Meses' || TO_CHAR(prazo_meses));
        DBMS_OUTPUT.PUT_LINE('Obrigacoes da Convenente' || TO_CHAR(obrigacoesConvenente));
DBMS_OUTPUT.PUT_LINE('Obrigacoes da Conveniada' || TO_CHAR(obrigacoesConveniada));

    END;
    MAP MEMBER FUNCTION contratoNum RETURN NUMBER IS
    BEGIN
        RETURN numContrato;
    END;
END;
/


/*  Criei o tipo tp_rel_firma que representa o relacionamento firma */
create or replace TYPE tp_rel_firma AS OBJECT (
  CNPJConvenente VARCHAR2(18),
  CNPJConveniada VARCHAR2(18),
  NumContrato NUMBER
);



/*Coordenador Técnico */
create or replace TYPE tp_coordTecnico AS OBJECT (
  matricula NUMBER,
  CPF VARCHAR2(14),
  nome VARCHAR2(30),
  cargo VARCHAR2(30),
  email VARCHAR2(20),

  MEMBER PROCEDURE exibir_dados_coord (SELF tp_coordTecnico),
  MAP MEMBER FUNCTION coordMat RETURN NUMBER
	
);
/

CREATE OR REPLACE TYPE BODY tp_coordTecnico AS 

    MEMBER PROCEDURE exibir_dados_coord(SELF tp_coordTecnico) IS

    BEGIN
        DBMS_OUTPUT.PUT_LINE('Dados do Coordenador');
        DBMS_OUTPUT.PUT_LINE('Matricula' || TO_CHAR(matricula));
        DBMS_OUTPUT.PUT_LINE('Nome' || TO_CHAR(nome));
 DBMS_OUTPUT.PUT_LINE('Cargo' || TO_CHAR(cargo));
 DBMS_OUTPUT.PUT_LINE('email' || TO_CHAR(email));

    END;
    MAP MEMBER FUNCTION coordMat RETURN NUMBER IS
    BEGIN
        RETURN matricula;
    END;
END;
/






/*
Script para criar o projeto
*/
CREATE OR REPLACE TYPE tp_projeto AS OBJECT(
	cod_projeto NUMBER,
	nome VARCHAR2(15),
	recursos VARCHAR2(30),
	cod_coord_tecnico NUMBER,
	plano_trabalho VARCHAR2(200),

 MEMBER PROCEDURE exibir_dados_projeto (SELF tp_projeto)
    
);
/

CREATE OR REPLACE TYPE BODY tp_projeto AS 

    MEMBER PROCEDURE exibir_dados_projeto(SELF tp_projeto) IS

    BEGIN
        DBMS_OUTPUT.PUT_LINE('Dados do Projeto');
        DBMS_OUTPUT.PUT_LINE('Codigo' || TO_CHAR(cod_projeto));
        DBMS_OUTPUT.PUT_LINE('Nome' || TO_CHAR(nome));
 DBMS_OUTPUT.PUT_LINE('Matricula do Coord Técnico' || TO_CHAR(cod_coord_tecnico));
 DBMS_OUTPUT.PUT_LINE('Recursos' || TO_CHAR(recursos));
 DBMS_OUTPUT.PUT_LINE('Plano de Trabalho' || TO_CHAR(plano_trabalho));

    END;
END;
/



/*
TIPO TA e BODY TA
*/
create or replace TYPE tp_TA AS OBJECT(
    cod_TA NUMBER,
	numContrato NUMBER,
	cod_projeto REF tp_projeto,
	prazo_meses INTEGER,
	termosRescisao VARCHAR2(200),
    valor NUMBER,

    ORDER MEMBER FUNCTION SORT (t tp_TA) RETURN INTEGER,

    CONSTRUCTOR FUNCTION tp_TA(numContrato NUMBER, cod_projeto REF tp_projeto, prazo_meses INTEGER, termosRescisao VARCHAR2, valor NUMBER) RETURN SELF AS RESULT);
/


CREATE OR REPLACE TYPE BODY tp_TA AS

CONSTRUCTOR FUNCTION tp_TA(numContrato NUMBER, cod_projeto REF tp_projeto, prazo_meses INTEGER, termosRescisao VARCHAR2, valor NUMBER) RETURN SELF AS RESULT IS 
BEGIN
		self.numContrato := numContrato;
		self.cod_projeto := cod_projeto;
		self.prazo_meses := prazo_meses;
		self.termosRescisao := termosRescisao;
		self.valor := valor;
	RETURN;
END;



ORDER MEMBER FUNCTION SORT (t tp_TA) RETURN INTEGER IS
BEGIN
IF valor < t.valor THEN
RETURN -1;

   ELSIF valor > t.valor THEN
RETURN 1;

   ELSE
RETURN 0;

   END IF;
END;
END;
/





/* ##################### CRIAÇÃO DE TABELAS ################### */



/* Criei a tabela gerente */
CREATE TABLE tb_gerente OF tp_gerente (
  PRIMARY KEY (matricula)) NESTED TABLE fones_gerente STORE AS tb_list_fone;



CREATE TABLE tb_contrato OF tp_contrato (
  PRIMARY KEY (numContrato),
  FOREIGN KEY (matriculaGerente) REFERENCES tb_gerente(matricula));

/

/*Criei as tabelas para o tipo convenente e conveniada */

CREATE TABLE tb_Convenente OF tp_convenente (
  PRIMARY KEY (CNPJ));

CREATE TABLE tb_Conveniada OF tp_conveniada (
  PRIMARY KEY (CNPJ));
/



/* Criei a tabela para o objeto do tipo do relacionamento firma */

CREATE TABLE tb_rel_firma OF tp_rel_firma (
  PRIMARY KEY (CNPJConvenente, CNPJConveniada, NumContrato),
  FOREIGN KEY (CNPJConvenente) REFERENCES tb_convenente(CNPJ),
  FOREIGN KEY (CNPJConveniada) REFERENCES tb_conveniada(CNPJ),
  FOREIGN KEY (NumContrato) REFERENCES tb_contrato(numContrato));

/


CREATE TABLE tb_coordTecnico OF tp_coordTecnico (
  PRIMARY KEY (matricula));

/


/* tabela de telefones do coord */

CREATE TABLE tb_fonesCoord(
  matricula NUMBER,
  fones tp_fones,
  PRIMARY KEY (matricula),
  FOREIGN KEY (matricula) REFERENCES tb_coordTecnico(matricula),
  CHECK (fones IS NOT NULL)
   ENABLE

  );

/




/*
Script para criar a tabela projeto
*/
CREATE TABLE tb_projeto OF tp_projeto (
  PRIMARY KEY (cod_projeto),
  FOREIGN KEY (cod_coord_tecnico) REFERENCES tb_coordTecnico(matricula));

/






 /* 
TABELA DE TA
*/
CREATE TABLE tb_TA OF tp_TA(
    PRIMARY KEY(cod_TA),
    cod_projeto SCOPE IS TB_PROJETO,
    FOREIGN KEY (numContrato) REFERENCES tb_contrato(numContrato)
);
/










