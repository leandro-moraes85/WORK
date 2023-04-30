SELECT *
FROM
  (SELECT PCMOVA.CODCLI,
          PCCLIENTA.CLIENTE,
          PCMOVA.codprod,
          PCPRODUTA.DESCRICAO,
          QT AS QUANTIDADE,
          PUNIT AS PRECO,
          SUM (PCMOVA.qt*PCMOVA.punit)AS VL_VENDIDO,
              TO_CHAR (PCMOVA.DTMOV,
                       'MM-YYYY') AS DATA
   FROM
     (SELECT CODCLI,
             CODPROD,
             QT,
             PUNIT,
             DTMOV
      FROM PCMOV
      WHERE CODCLI NOT IN (19045,
                           567378,
                           568632,
                           576664,
                           568342,
                           568343,
                           568344,
                           568345,
                           568346,
                           568349,
                           568350,
                           568352,
                           568348,
                           570218,
                           571599,
                           574810,
                           10372,
                           575313,
                           576190,
                           574100,
                           576616,
                           577751)
        AND CODOPER IN ('S',
                        'ED')
        AND CODFILIAL IN ('53',
                          '66',
                          '3')
        AND DTMOV > ((TO_DATE ('14-02-2019',
                               'dd-mm-yyyy'))-365)) pcmovA,

     (SELECT CODPROD,
             DESCRICAO
      FROM PCPRODUT
      WHERE pcprodut.dtultaltcom > ((TO_DATE ('14-02-2019',
                                              'dd-mm-yyyy'))-1095)) PCPRODUTA,

     (SELECT CODCLI,
             CLIENTE
      FROM PCCLIENT
      WHERE BLOQUEIODEFINITIVO NOT IN 'S'
        AND DTULTCOMP > ((TO_DATE ('14-02-2019',
                                   'dd-mm-yyyy'))-1095) ) PCCLIENTA
   WHERE PCMOVA.CODPROD = PCPRODUTA.CODPROD
     AND PCMOVA.CODCLI = PCCLIENTA.CODCLI --AND codcli in 277
AND QT <> 0
   GROUP BY PCMOVA.CODCLI,
            CLIENTE,
            PCMOVA.CODPROD,
            PCMOVA.QT,
            PCMOVA.PUNIT,
            PCPRODUTA.DESCRICAO,
            TO_CHAR (PCMOVA.dtmov,
                     'MM-YYYY'))
ORDER BY TO_DATE (DATA,
                  'MM/YYYY'), CODCLI,
                              CODPROD