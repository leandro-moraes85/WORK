SELECT PCPEDCA.CODCLI,
       CLIENTE,
       PCPEDCA.CODSUPERVISOR AS COD_SUPERVISOR,
       PCSUPERVA.NOME AS SUPERVISOR,
       CODEMITENTE AS COD_EMITENTE,
       PCEMPRA.NOME AS EMITENTE,
       PCUSUARIA.CODUSUR AS RCA_DO_PEDIDO,
       PCUSUARIA.NOME AS RCA,
       NUMPED AS NUMERO_PEDIDO,
       VLTOTAL AS VALOR_PEDIDO,
       DATA,
       HORA_DE_EMISSAO
FROM
  (SELECT codcli,
          cliente
   FROM pcclient) pcclienta,

  (SELECT PCSUPERV.CODSUPERVISOR,
          PCSUPERV.NOME
   FROM PCSUPERV) PCSUPERVA,

  (SELECT numped,
          codcli,
          codfilial,
          codsupervisor,
          codusur,
          codemitente,
          vltotal,
          numnota,
          DATA,
          pcpedc.hora ||':'|| pcpedc.minuto AS Hora_de_emissao
   FROM pcpedc
   WHERE codfilial in ('66',
                       '53',
                       '3')
     AND VLTOTAL > 0
     AND DATA BETWEEN '01-MAY-2019' AND '31-MAY-019') pcpedca,

  (SELECT CODUSUR,
          PCUSUARI.NOME
   FROM PCUSUARI) PCUSUARIA,

  (SELECT PCEMPR.MATRICULA,
          PCEMPR.NOME
   FROM PCEMPR) PCEMPRA
WHERE pcpedca.codcli = pcclienta.codcli
  AND PCPEDCA.CODSUPERVISOR = PCSUPERVA.CODSUPERVISOR
  AND PCPEDCA.CODUSUR = PCUSUARIA.CODUSUR
  AND PCPEDCA.CODEMITENTE = PCEMPRA.MATRICULA
ORDER BY PCPEDCA.DATA,
         HORA_DE_EMISSAO