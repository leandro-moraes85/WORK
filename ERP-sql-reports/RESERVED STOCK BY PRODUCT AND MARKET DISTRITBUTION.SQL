-- RESERVED STOCK BY PRODUCT AND MARKET DISTRIBUTION


SELECT CODPROD,
       SUM (ESTOQUE_RESERVADO) AS ESTOQUE_RESERVADO,
           SUM (RESERVADO_VAREJO) AS RESERVADO_VAREJO,
               SUM (RESERVADO_ATACAREJO) AS RESERVADO_ATACAREJO,
                   SUM (RESERVADO_ATACADO) AS RESERVADO_ATACADO,
                       SUM (RESERVADO_MAISON) AS RESERVADO_MAISON,
                           SUM (RESERVADO_SILVIA) AS RESERVADO_SILVIA,
                               SUM (RESERVADO_CAROLINA) AS RESERVADO_CAROLINA
FROM
  (SELECT *
   FROM
     (SELECT CODPROD,
             SUM (QT) AS ESTOQUE_RESERVADO,
                 SUM (QT*0) AS RESERVADO_VAREJO,
                     SUM (QT*0) AS RESERVADO_ATACAREJO,
                         SUM (QT*0) AS RESERVADO_ATACADO,
                             SUM (QT*0) AS RESERVADO_MAISON,
                                 SUM (QT*0) AS RESERVADO_SILVIA,
                                     SUM (QT*0) AS RESERVADO_CAROLINA
      FROM
        (SELECT codprod,
                codfilialretira,
                QT,
                pcpedia.codusur,
                pcusuaria.codsupervisor
         FROM
           (SELECT codprod,
                   qt,
                   codfilialretira,
                   DATA,
                   pcpedi.codusur
            FROM pcpedi
            WHERE posicao not in ('F',
                                  'C')
              AND pcpedi.codfilialretira in ('53',
                                             '66',
                                             '3')) pcpedia,

           (SELECT codsupervisor,
                   codusur
            FROM pcusuari) pcusuaria
         WHERE pcpedia.codusur = pcusuaria.codusur) VENDA_P_SUPERV
      GROUP BY CODPROD
      ORDER BY CODPROD) ESTOQUE_RESERVADO
   UNION ALL SELECT *
   FROM
     (SELECT CODPROD,
             SUM (QT*0) AS ESTOQUE_RESERVADO,
                 SUM (QT) AS RESERVADO_VAREJO,
                     SUM (QT*0) AS RESERVADO_ATACAREJO,
                         SUM (QT*0) AS RESERVADO_ATACADO,
                             SUM (QT*0) AS RESERVADO_MAISON,
                                 SUM (QT*0) AS RESERVADO_SILVIA,
                                     SUM (QT*0) AS RESERVADO_CAROLINA
      FROM
        (SELECT codprod,
                codfilialretira,
                QT,
                pcpedia.codusur,
                pcusuaria.codsupervisor
         FROM
           (SELECT codprod,
                   qt,
                   codfilialretira,
                   DATA,
                   pcpedi.codusur
            FROM pcpedi
            WHERE posicao not in ('F',
                                  'C')
              AND pcpedi.codfilialretira in ('53',
                                             '66',
                                             '3')) pcpedia,

           (SELECT codsupervisor,
                   codusur
            FROM pcusuari
            WHERE CODSUPERVISOR IN '2') pcusuaria
         WHERE pcpedia.codusur = pcusuaria.codusur) VENDA_P_SUPERV
      GROUP BY CODPROD
      ORDER BY CODPROD) RESERVADO_VAREJO
   UNION ALL SELECT *
   FROM
     (SELECT CODPROD,
             SUM (QT*0) AS ESTOQUE_RESERVADO,
                 SUM (QT*0) AS RESERVADO_VAREJO,
                     SUM (QT) AS RESERVADO_ATACAREJO,
                         SUM (QT*0) AS RESERVADO_ATACADO,
                             SUM (QT*0) AS RESERVADO_MAISON,
                                 SUM (QT*0) AS RESERVADO_SILVIA,
                                     SUM (QT*0) AS RESERVADO_CAROLINA
      FROM
        (SELECT codprod,
                codfilialretira,
                QT,
                pcpedia.codusur,
                pcusuaria.codsupervisor
         FROM
           (SELECT codprod,
                   qt,
                   codfilialretira,
                   DATA,
                   pcpedi.codusur
            FROM pcpedi
            WHERE posicao not in ('F',
                                  'C')
              AND pcpedi.codfilialretira in ('53',
                                             '66',
                                             '3')) pcpedia,

           (SELECT codsupervisor,
                   codusur
            FROM pcusuari
            WHERE CODSUPERVISOR IN '18') pcusuaria
         WHERE pcpedia.codusur = pcusuaria.codusur) VENDA_P_SUPERV
      GROUP BY CODPROD
      ORDER BY CODPROD) RESERVADO_ATACAREJO
   UNION ALL SELECT *
   FROM
     (SELECT CODPROD,
             SUM (QT*0) AS ESTOQUE_RESERVADO,
                 SUM (QT*0) AS RESERVADO_VAREJO,
                     SUM (QT*0) AS RESERVADO_ATACAREJO,
                         SUM (QT) AS RESERVADO_ATACADO,
                             SUM (QT*0) AS RESERVADO_MAISON,
                                 SUM (QT*0) AS RESERVADO_SILVIA,
                                     SUM (QT*0) AS RESERVADO_CAROLINA
      FROM
        (SELECT codprod,
                codfilialretira,
                QT,
                pcpedia.codusur,
                pcusuaria.codsupervisor
         FROM
           (SELECT codprod,
                   qt,
                   codfilialretira,
                   DATA,
                   pcpedi.codusur
            FROM pcpedi
            WHERE posicao not in ('F',
                                  'C')
              AND pcpedi.codfilialretira in ('53',
                                             '66',
                                             '3')) pcpedia,

           (SELECT codsupervisor,
                   codusur
            FROM pcusuari
            WHERE CODSUPERVISOR IN '15') pcusuaria
         WHERE pcpedia.codusur = pcusuaria.codusur) VENDA_P_SUPERV
      GROUP BY CODPROD
      ORDER BY CODPROD) RESERVADO_ATACADO
   UNION ALL SELECT *
   FROM
     (SELECT CODPROD,
             SUM (QT*0) AS ESTOQUE_RESERVADO,
                 SUM (QT*0) AS RESERVADO_VAREJO,
                     SUM (QT*0) AS RESERVADO_ATACAREJO,
                         SUM (QT*0) AS RESERVADO_ATACADO,
                             SUM (QT) AS RESERVADO_MAISON,
                                 SUM (QT*0) AS RESERVADO_SILVIA,
                                     SUM (QT*0) AS RESERVADO_CAROLINA
      FROM
        (SELECT codprod,
                codfilialretira,
                QT,
                pcpedia.codusur,
                pcusuaria.codsupervisor
         FROM
           (SELECT codprod,
                   qt,
                   codfilialretira,
                   DATA,
                   pcpedi.codusur
            FROM pcpedi
            WHERE posicao not in ('F',
                                  'C')
              AND pcpedi.codfilialretira in ('53',
                                             '66',
                                             '3')) pcpedia,

           (SELECT codsupervisor,
                   codusur
            FROM pcusuari
            WHERE CODSUPERVISOR IN '6') pcusuaria
         WHERE pcpedia.codusur = pcusuaria.codusur) VENDA_P_SUPERV
      GROUP BY CODPROD
      ORDER BY CODPROD) RESERVADO_MAISON
   UNION ALL SELECT *
   FROM
     (SELECT CODPROD,
             SUM (QT*0) AS ESTOQUE_RESERVADO,
                 SUM (QT*0) AS RESERVADO_VAREJO,
                     SUM (QT*0) AS RESERVADO_ATACAREJO,
                         SUM (QT*0) AS RESERVADO_ATACADO,
                             SUM (QT*0) AS RESERVADO_MAISON,
                                 SUM (QT) AS RESERVADO_SILVIA,
                                     SUM (QT*0) AS RESERVADO_CAROLINA
      FROM
        (SELECT codprod,
                codfilialretira,
                QT,
                pcpedia.codusur,
                pcusuaria.codsupervisor
         FROM
           (SELECT codprod,
                   qt,
                   codfilialretira,
                   DATA,
                   pcpedi.codusur
            FROM pcpedi
            WHERE posicao not in ('F',
                                  'C')
              AND pcpedi.codfilialretira in ('53',
                                             '66',
                                             '3')) pcpedia,

           (SELECT codsupervisor,
                   codusur
            FROM pcusuari
            WHERE CODSUPERVISOR IN '12') pcusuaria
         WHERE pcpedia.codusur = pcusuaria.codusur) VENDA_P_SUPERV
      GROUP BY CODPROD
      ORDER BY CODPROD) RESERVADO_SILVIA
   UNION ALL SELECT *
   FROM
     (SELECT CODPROD,
             SUM (QT*0) AS ESTOQUE_RESERVADO,
                 SUM (QT*0) AS RESERVADO_VAREJO,
                     SUM (QT*0) AS RESERVADO_ATACAREJO,
                         SUM (QT*0) AS RESERVADO_ATACADO,
                             SUM (QT*0) AS RESERVADO_MAISON,
                                 SUM (QT*0) AS RESERVADO_SILVIA,
                                     SUM (QT) AS RESERVADO_CAROLINA
      FROM
        (SELECT codprod,
                codfilialretira,
                QT,
                pcpedia.codusur,
                pcusuaria.codsupervisor
         FROM
           (SELECT codprod,
                   qt,
                   codfilialretira,
                   DATA,
                   pcpedi.codusur
            FROM pcpedi
            WHERE posicao not in ('F',
                                  'C')
              AND pcpedi.codfilialretira in ('53',
                                             '66',
                                             '3')) pcpedia,

           (SELECT codsupervisor,
                   codusur
            FROM pcusuari
            WHERE CODSUPERVISOR IN '19') pcusuaria
         WHERE pcpedia.codusur = pcusuaria.codusur) VENDA_P_SUPERV
      GROUP BY CODPROD
      ORDER BY CODPROD) RESERVADO_CAROLINA)
GROUP BY CODPROD