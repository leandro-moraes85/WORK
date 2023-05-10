--DAYS OF OPERATION IN THE YEAR

SELECT count(distinct(to_date(dtmov, 'DD-MM-YYYY'))) AS DTMOVA
FROM pcmov
WHERE pcmov.custofin <> 0
  AND codfilial in ('53',
                    '4',
                    '66',
                    '3',
                    '12')
  AND dtmov BETWEEN '01-JAN-2015' AND '31-dec-2015'