SELECT pcpresta.duplic,
       pcpresta.prest,
       pcpresta.numcar,
       pcpresta.dtfecha,
       codfilial,
       pcpresta.codcli,
       pcclienta.cliente,
       pcpresta.codcob,
       pccoba.cobranca,
       pcpresta.dtvenc,
       pcpresta.dtvenc-pcpresta.dtemissao AS prazo,
       pcpresta.valor --       pcpresta.*

FROM
  (SELECT pcprest.*
   FROM pcprest) pcpresta,

  (SELECT codcli,
          cliente
   FROM pcclient) pcclienta,

  (SELECT codcob,
          cobranca
   FROM pccob) pccoba
WHERE pcpresta.codcli = pcclienta.codcli
  AND pcpresta.codcob = pccoba.codcob
  AND pcpresta.codcli not in (19045,
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
  AND pcpresta.vpago IS NULL
  AND DTVENC BETWEEN :DTINICIAL AND :DTFINAL
  AND CODFILIAL IN (:CODFILIAL)
ORDER BY pcpresta.dtemissao