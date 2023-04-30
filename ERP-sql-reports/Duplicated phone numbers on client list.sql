-- shows clients with duplicated phone number, to proove they are the same
SELECT *
FROM
  (SELECT COUNT (telcob_ok) AS qt_vezes_repete,
                telcob_ok
   FROM
     (SELECT REPLACE (telcob_convert,
                      ' ',
                      '') AS telcob_ok,
                     telcob,
                     codcli
      FROM
        (SELECT telcob,
                regexp_replace(telcob, '[-/().R,]', '') AS telcob_convert,
                codcli
         FROM  tbclient) telcob_s_strings) telcob_convertido
   GROUP BY telcob_ok
   ORDER BY count(telcob_ok) DESC) telcob_mais_freq,

  (SELECT *
   FROM
     (SELECT telcob_ok,
             codcli,
             cliente,
             cgcent,
             endercob,
             cepcob
      FROM
        (SELECT REPLACE (telcob_convert,
                         ' ',
                         '') AS telcob_ok,
                        telcob,
                        codcli,
                        cliente,
                        cgcent,
                        endercob,
                        cepcob
         FROM
           (SELECT telcob,
                   REGEXP_REPLACE (telcob,
                                   '[-/().R,]',
                                   '') AS telcob_convert,
                                  codcli,
                                  cliente,
                                  cgcent,
                                  endercob,
                                  cepcob
            FROM  tbclient) telcob_s_strings))) telcob_base
WHERE telcob_base.telcob_ok = telcob_mais_freq.telcob_ok