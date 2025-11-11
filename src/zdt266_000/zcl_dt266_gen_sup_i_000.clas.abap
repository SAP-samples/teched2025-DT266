CLASS zcl_dt266_gen_sup_i_000 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZCL_DT266_GEN_SUP_I_000 IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.




    DATA:
      group_id   TYPE string VALUE '000',
      id         TYPE int4,
      table_name TYPE tabname,
      i          TYPE i.


    i = 0.
    DO 10 TIMES.
      group_id = i.

*   clear data
      table_name = |zdt266_sup_i_00{ group_id }|.
      DELETE FROM (table_name).
      id = 0.
      DO 500 TIMES.
      if id < 10.
        INSERT (table_name)  FROM (
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
        ELSEIF id < 200.
             INSERT (table_name)  FROM (
            SELECT
              FROM /dmo/supplement AS suppl
              FIELDS
              suppl~supplement_id AS supplement_id,
              @id AS id,
              'ML' AS supplement_category,
              suppl~price AS price,
              suppl~currency_code AS currency_code,
              suppl~local_created_by AS local_created_by,
              suppl~local_created_at AS local_created_at,
              suppl~local_last_changed_by AS local_last_changed_by,
              suppl~local_last_changed_at AS local_last_changed_at,
              suppl~last_changed_at AS last_changed_at
              ).
        ELSE.
             INSERT (table_name)  FROM (
            SELECT
              FROM /dmo/supplement AS suppl
              FIELDS
              suppl~supplement_id AS supplement_id,
              @id AS id,
              'BV' AS supplement_category,
              suppl~price AS price,
              suppl~currency_code AS currency_code,
              suppl~local_created_by AS local_created_by,
              suppl~local_created_at AS local_created_at,
              suppl~local_last_changed_by AS local_last_changed_by,
              suppl~local_last_changed_at AS local_last_changed_at,
              suppl~last_changed_at AS last_changed_at
              ).

        ENDIF.
        id = id + 1.
      ENDDO.
      COMMIT WORK.
      out->write( |[DT266] Demo data generated for table { table_name }. | ).
      i = i + 1.
    ENDDO.
  ENDMETHOD.
ENDCLASS.
