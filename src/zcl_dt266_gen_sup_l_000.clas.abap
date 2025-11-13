CLASS zcl_dt266_gen_sup_l_000 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

      INTERFACES if_oo_adt_classrun.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZCL_DT266_GEN_SUP_L_000 IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.




    DATA:
      group_id   TYPE string VALUE '000',
      id         TYPE int4.

*   clear data
    DELETE FROM zdt266_sup_l_000.
    id = 0.
          DO 200000 TIMES.

    INSERT zdt266_sup_l_000  FROM (
        SELECT
          FROM /dmo/supplement AS suppl
          FIELDS
          suppl~supplement_id AS supplement_id,
          @id AS id,
          suppl~supplement_category AS supplement_category,
          suppl~price AS price,
          suppl~currency_code AS currency_code,
          suppl~local_created_by AS local_created_by,
          suppl~local_created_at AS local_created_at,
          suppl~local_last_changed_by AS local_last_changed_by,
          suppl~local_last_changed_at AS local_last_changed_at,
          suppl~last_changed_at AS last_changed_at
          ).
          id = id + 1.
          ENDDO.
    COMMIT WORK.
    out->write( |[DT266] Demo data generated for table ZDT266_SUP_L_{ group_id }. | ).
  ENDMETHOD.
ENDCLASS.
