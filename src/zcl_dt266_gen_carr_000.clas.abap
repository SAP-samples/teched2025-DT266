CLASS zcl_dt266_gen_carr_000 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZCL_DT266_GEN_CARR_000 IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.
    DATA:
      group_id   TYPE string VALUE '000',
      table_name TYPE tabname,
      i          TYPE i.


    i = 0.
    DO 1 TIMES.
    group_id = i.

   table_name = |zdt266_carr_00{ group_id }|.


      DELETE FROM (table_name).

      "insert travel demo data
      INSERT (table_name)  FROM (
          SELECT
            FROM /dmo/carrier AS carr
            FIELDS
              carr~carrier_id AS carrier_id,
              carr~name AS name,
              carr~currency_code AS currency_code,
              carr~local_created_by  AS local_created_by,
              carr~local_created_at        AS local_created_at,
              carr~local_last_changed_by    AS local_last_changed_by,
              carr~local_last_changed_at    AS local_last_changed_at,
              carr~last_changed_at   AS last_changed_at
        ).
      COMMIT WORK.
      out->write( |[DT266] Demo data generated for table ZDT266_CARR_00{ group_id }. | ).

      i = i + 1.
    ENDDO.
  ENDMETHOD.
ENDCLASS.
