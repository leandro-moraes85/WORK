SELECT codfilial,
       dtmov,
       numnota,
       descricao,
       pcproduta.codprod,
       embalagem,
       qt,
       punit,
       qt*punit,
       ((qt*punit)/100)*(nvl(0, pcomint1)),
       ((qt*punit)/100)*(nvl(0, pcomext1)),
       ((qt*punit)/100)*(nvl(0, pcomrep1)),
       pcmova.numtransvenda
FROM
  (SELECT codfilial,
          dtmov,
          codprod,
          numnota,
          qt,
          punit,
          numtransvenda
   FROM pcmov) pcmova,

  (SELECT codprod,
          descricao,
          embalagem,
          pcprodut.pcomint1,
          pcprodut.pcomext1,
          pcprodut.pcomrep1
   FROM pcprodut) pcproduta,

  (SELECT distinct(numtransvenda)
   FROM pcprest
   WHERE duplic not in
       (SELECT pcprest.numtransvenda
        FROM pcprest
        WHERE vpago IS NULL )
   GROUP BY numtransvenda) pcpresta
WHERE pcmova.codprod = pcproduta.codprod
  AND pcmova.numtransvenda = pcpresta.numtransvenda
ORDER BY pcmova.numtransvenda DESC