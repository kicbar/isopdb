create or replace PROCEDURE r_update_facture_value 
(p_id_facture IN FACTURE.ID_FACTURE%TYPE) 
AS v_temp_value INTEGER;

BEGIN
SELECT sum(VALUE_COST) INTO v_temp_value
FROM POSITION
WHERE id_facture = p_id_facture;

IF v_temp_value > 0 THEN
UPDATE facture
SET value = v_temp_value
WHERE id_facture = p_id_facture;
ELSE 
UPDATE facture
SET value = 'BrakDanych'
WHERE id_facture = p_id_facture;
END IF;
COMMIT;

END r_update_facture_value;