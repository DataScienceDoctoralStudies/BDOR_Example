/* Select com In */

select * from tb_gerente where nome in ('Anderson Silva', 'Josemário Sousa');


/* select com any - seleciona o nome dos projetos com valor maior que 50mil */

SELECT p.nome FROM tb_projeto p WHERE p.cod_projeto = ANY (SELECT cod_projeto FROM tb_ta WHERE valor > 50000);


/* SELECT COM ALL - seleciona todos os nomes de projetos que custam mais que a média de todos os projtos  - Não retorna nada pq ainda não tem*/

SELECT p.nome FROM tb_projeto p WHERE p.cod_projeto = ALL (SELECT cod_projeto FROM tb_ta WHERE valor > (SELECT avg(valor) from tb_ta));

/*SELECT COM LIKE - SELECIONA TODOS OS GERENTES QUE COMEÇAM COM C */
select * from tb_gerente where nome LIKE ('C%');


/* SELECT COM NOT NULL - SELECIONA TODOS OS GERENTES COM NOME NÃO NULO*/

SELECT * FROM tb_gerente where nome is not null

/* SELECT COM UNION - SELECIONA TODOS OS CONTRATOS QUE POSSUEM TA*/
select numcontrato from tb_contrato
UNION
select numcontrato from tb_ta;

/* SELECT COM INTERSECT - SELECIONA TODOS OS CONTRATOS QUE POSSUEM TA*/
select numcontrato from tb_contrato
INTERSECT
select numcontrato from tb_ta

/* SELECT COM HAVING - FOI BASEADO NA VIEW qtd_contratos_convenentes*/
select nome_convenente, count(*)  AS QTD_CONTRATOS from convs_contrato_projeto
   group by nome_convenente
   having count(*) > 1
   order by QTD_CONTRATOS

/* INSERTE E DELETE - UM CONVENENTE É  ADICIONADO E DEPOIS REMOVIDO*/
Insert into TB_CONVENENTE (CNPJ,NOME,ENDERECO,NATJUR) values ('99.999.999/9999-99','DELETE IND.','Rua DELETE - n 45','S/A');

DELETE FROM TB_CONVENENTE
WHERE CNPJ = '99.999.999/9999-99';


/* CLAUSULA VALUE */

SET SERVEROUTPUT ON
DECLARE

mb tp_contrato;

BEGIN
SELECT VALUE(c) INTO mb FROM tb_contrato c WHERE c.numcontrato = 5;
mb.exibir_dados_contrato();
END;
/


/* Iselect rowid - UM CONVENENTE É  ADICIONADO E DEPOIS REMOVIDO*/
select rowid, cnpj from tb_convenente where cnpj = '50.307.590/0001-78'

select * from tb_convenente where rowid = 'AABWaXAAHAAAARPAAA'


/* DEREF */
SELECT DEREF(t.cod_projeto) FROM TB_TA T WHERE T.COD_TA=2;


