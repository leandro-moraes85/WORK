--UPDATE DISCOUNT % ON PAYMENT

UPDATE pcplpag
SET pertxfim = CASE
                   WHEN pertxfim = -3 THEN -2
                   WHEN pertxfim = -2.5 THEN -1.8
                   WHEN pertxfim = -1.85 THEN -1.5
                   WHEN pertxfim = -1.25 THEN -1
                   WHEN pertxfim = -0.65 THEN -0.5
                   ELSE pertxfim
               END
WHERE descricao like '%ATACADO%';