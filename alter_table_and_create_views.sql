


/* ADIÇÃO DE CONSTRAINT E CLAUSULA CHECK */

ALTER TABLE TB_CONVENIADA ADD CONSTRAINT check_name 
   CHECK (nome IS NOT NULL)
   ENABLE;


ALTER TABLE TB_CONVENENTE ADD CONSTRAINT check_name_convenente 
   CHECK (nome IS NOT NULL)
   ENABLE;



/* CRIANDO VIEWS */

/* OK*/
CREATE VIEW convs_contrato_projeto AS
SELECT n.nome AS NOME_CONVENENTE, n.CNPJ AS CNPJ_CONVENENTE, a.nome AS NOME_CONVENIADA, a.CNPJ AS CNPJ_CONVENIADA, ta.numcontrato, p.nome AS NOME_PROJETO
   FROM tb_convenente n, tb_conveniada a, tb_rel_firma r, tb_projeto p, tb_ta ta
   WHERE (r.numcontrato = ta.numcontrato AND r.CNPJconvenente = n.CNPJ AND p.cod_projeto = ta.cod_projeto.cod_projeto);



/* OK*/

/*VIEWS - A MESMA VIEW ANTERIOR USANDO INNER JOIN */
CREATE VIEW convs_contrato_projeto_INNER_JOIN AS
SELECT tb_convenente.nome AS NOME_CONVENENTE, tb_convenente.CNPJ AS CNPJ_CONVENENTE, tb_conveniada.nome AS NOME_CONVENIADA, tb_rel_firma.cnpjconveniada AS CNPJ_CONVENIADA, numcontrato, tb_projeto.nome AS NOME_PROJETO
   FROM tb_rel_firma
   INNER JOIN tb_conveniada ON tb_conveniada.cnpj = tb_rel_firma.cnpjconveniada
   INNER JOIN tb_convenente ON tb_convenente.cnpj = tb_rel_firma.cnpjconvenente
   INNER JOIN tb_ta USING(numcontrato)
   INNER JOIN tb_projeto ON tb_projeto.cod_projeto = tb_ta.cod_projeto.cod_projeto
   ORDER BY numcontrato;
/

/*OK */
CREATE VIEW qtd_contratos_convenentes AS
select nome_convenente, count(*)  AS QTD_CONTRATOS from convs_contrato_projeto
   group by nome_convenente
   order by QTD_CONTRATOS;

/*VIEWS - usada para calcular a média dos prazos por nome da convenente */

/* OK */
CREATE VIEW MEDIA_PRAZOS_CONVENENTES AS
select distinct nome, AVG(prazo_meses) OVER (PARTITION BY nome) AS avg_by_convenente from
(select c.nome, t.prazo_meses from tb_ta t, tb_rel_firma f, tb_convenente c
where t.numcontrato = f.numcontrato AND
    	f.cnpjconvenente = c.cnpj) order by avg_by_convenente;


/*OK*/
/*maior valor nos TAs */
CREATE VIEW menor_valor_ta AS
select min(t.valor) AS MENOR_VALOR from tb_ta t;
/

/*OK*/
/*menor valor nos TAs */
CREATE VIEW maior_valor_ta AS
select max(t.valor) AS MAIOR_VALOR from tb_ta t;
/

/* OK */
CREATE VIEW GERENTES_JUSTLEAGUE AS
SELECT * FROM tb_gerente WHERE nome in (
    SELECT g.nome FROM tb_gerente g, tb_contrato c, tb_rel_firma r, tb_convenente n WHERE(
        r.numcontrato = c.numcontrato AND c.matriculagerente = g.matricula AND r.cnpjconvenente = '18.781.013/0001-00'));







/* OK */
/* VIEW COSULTA_VARRAY */


SELECT c.nome AS NOME_COORD, c.matricula AS MATRICULA_COORD, f.fones AS TELEFONES_COORD, p.nome AS NOME_PROJETO, p.cod_projeto AS COD_PROJETO
   FROM tb_coordtecnico c, tb_projeto p, tb_fonescoord f
   WHERE (c.matricula = p.cod_coord_tecnico AND f.matricula = c.matricula) ORDER BY (c.nome);



