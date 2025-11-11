CLASS zcl_dt266_gen_cust_000 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

      INTERFACES if_oo_adt_classrun.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZCL_DT266_GEN_CUST_000 IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.
    DATA:
      group_id   TYPE string VALUE '000'.


*   clear data
    DELETE FROM zdt266_cst_d_000.
    DELETE FROM zdt266_cust_000.

    "insert travel demo data
    INSERT zdt266_cust_000  FROM (
        SELECT
          FROM /dmo/customer AS cust
          FIELDS
            cust~customer_id AS customer_id,
            cust~first_name AS first_name,
            cust~last_name AS last_name,
            cust~street AS street,
            cust~postal_code AS postal_code,
            cust~city AS city,
            cust~country_code AS country_code,
            cust~local_created_by  AS local_created_by,
            cust~local_created_at        AS local_created_at,
            cust~local_last_changed_by    AS local_last_changed_by,
            cust~local_last_changed_at    AS local_last_changed_at,
            cust~last_changed_at   AS last_changed_at
            ORDER BY customer_id UP TO 30 ROWS
      ).
    COMMIT WORK.
    out->write( |[DT266] Demo data generated for table ZDT266_CUST_{ group_id }. | ).
  ENDMETHOD.
ENDCLASS.
