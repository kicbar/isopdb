CREATE OR REPLACE VIEW v_client_info
AS
  SELECT k.FNAME,
         k.lname,
         c.EMAIL,
         c.TEL_1,
         a.CITY,
         a.STREET,
         a.HNUMBER
    FROM contact c
         JOIN client k
           ON c.id_client = k.id_client
         JOIN address a
           ON a.id_client = k.id_client 
	WITH READ ONLY CONSTRAINT v_client_info_ro;
	
	
CREATE OR REPLACE VIEW v_users_details
AS
  SELECT uf.fname,
         uf.lname,
         uf.firm_name,
         uf.post_code,
         uf.city,
         uf.ADDRESS,
         u.email
    FROM users u
         JOIN users_firm uf
           ON u.id_user = uf.id_user 
         with read only; 


CREATE OR REPLACE VIEW V_POSITION_DETAILS
AS
SELECT rownum as p_number,
       f.facture_name,
       pr.product_name,
       p.amount,
       p.value_cost,
       f.id_facture,
       f.id_user
  FROM facture f
       JOIN position p
         ON f.id_facture = p.id_facture
            AND f.status = 1
            AND p.status = 1
       JOIN client c
         ON c.id_client = f.id_client
            AND c.status = 1
       JOIN product pr
         ON pr.id_product = p.id_product
            AND pr.status = 1
            with read only; 


CREATE OR REPLACE VIEW v_facture_details
AS
SELECT rownum as nrumber,
       f.facture_name,
       c.fname
        || ' '
        || c.lname AS client,
       f.value,
       f.date_add,
       f.id_facture,
       f.id_user
  FROM facture f
       JOIN client c
         ON c.id_client = f.id_client
            AND c.status = 1
            with read only; 
            

  CREATE OR REPLACE VIEW V_WORKER_CONTRACT
  AS
  SELECT w.fname,
        w.lname,
        w.pesel,
        ct.CONTRACT_NAME,
        c.start_date,
        c.end_date,
        c.salary
    FROM worker w
    join contract c
    on w.id_worker = c.id_worker
    and w.status = 1
    and c.status = 1
    join contract_type ct
    on ct.id_contract_type = c.id_contract_type
    and ct.status = 1
    WITH READ ONLY ;