--

SELECT CODCLIPRINCA, --VENDA_P_CLIENT,
TICKET,
                                       TICKET_MEDIO,
                                       VENDA_P_CLIENT,
                                        tbclientb.dtcadastro --TICKET
FROM
  (SELECT codcliprinca,
          SUM (qt*punit) AS venda_p_client,
              COUNT(DISTINCT NUMNOTA) AS TICKET,
              round (((SUM (QT* PUNIT))/(COUNT(DISTINCT NUMNOTA))),2) AS TICKET_MEDIO --, dtcadastro
FROM  tbmov,

     (SELECT codcli,
             nvl(codcli, codcliprinc) AS codcliprinca,
             dtcadastro
      FROM  tbclient)  tbclienta
   WHERE  tbmov.codcli =  tbclienta.codcli
     AND  tbmov.codfilial in ('53',
                             '3',
                             '66',
                             '12')
     AND codoper in 'S'
     AND  tbmov.custofin IS NOT NULL --AND PCMOV.DTMOV > '25-JUL-2017'
AND dtmov BETWEEN '01-01-2022' AND '31-12-2022'
     AND  tbmov.CODCLI NOT IN (19045,
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
                              574100)
   GROUP BY  tbclienta.codcliprinca --, client.dtcadastro
--order by  tbclienta.codcliprinca desc
) analisea,

  (SELECT codcli,
          dtcadastro
   FROM  tbclient)  tbclientb
WHERE analisea.codcliprinca =  tbclientb.codcli -- group by  (to_char (dtcadastro ,'yyyy'))

ORDER BY TICKET_MEDIO DESC