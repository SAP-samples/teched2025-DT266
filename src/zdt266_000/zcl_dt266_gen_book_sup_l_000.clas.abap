CLASS zcl_dt266_gen_book_sup_l_000 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

      INTERFACES if_oo_adt_classrun.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZCL_DT266_GEN_BOOK_SUP_L_000 IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.




    DATA:
      group_id   TYPE string VALUE '000',
      id         TYPE int4.

*   clear data
*    DELETE FROM zdt266_bo_su_000.
    id = 8000.
    DO 10 TIMES.
          DO 2000 TIMES.

    INSERT zdt266_bo_su_000  FROM (
        SELECT
          FROM /dmo/book_suppl AS suppl
          FIELDS
          suppl~travel_id AS travel_id,
          suppl~booking_id AS booking_id,
          suppl~booking_supplement_id AS booking_supplement_id,
          @id AS id,
          suppl~supplement_id AS supplement_id,
          suppl~price AS price,
          suppl~currency_code AS currency_code
          ).
          id = id + 1.
          ENDDO.
    COMMIT WORK.
    ENDDO.
    out->write( |[DT266] Demo data generated for table ZDT266_BO_SU_{ group_id }. | ).
  ENDMETHOD.
ENDCLASS.
