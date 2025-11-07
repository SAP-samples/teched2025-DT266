CLASS lhc_Carrier DEFINITION INHERITING FROM cl_abap_behavior_handler.
  PRIVATE SECTION.

    METHODS zzdefault_currency FOR DETERMINE ON SAVE
      IMPORTING keys FOR Carrier~zzdefault_currency.

ENDCLASS.

CLASS lhc_Carrier IMPLEMENTATION.

  METHOD zzdefault_currency.

   READ ENTITIES OF zr_dt266_carr_023 IN LOCAL MODE
        ENTITY Carrier
        ALL FIELDS WITH CORRESPONDING #( keys )
    RESULT DATA(carriers).


    " Exercise 3.3: Comment this section
    DELETE carriers WHERE CurrencyCode IS INITIAL.

    MODIFY ENTITIES OF zr_dt266_carr_023 IN LOCAL MODE
        ENTITY Carrier
        UPDATE FIELDS ( CurrencyCode )
        WITH VALUE #( FOR carrier IN carriers ( %tky = carrier-%tky
                                                CurrencyCode = '' ) ).

    " Exercise 3.3: Uncomment this section
*    DELETE carriers WHERE CurrencyCode IS NOT INITIAL.
*
*    MODIFY ENTITIES OF zr_dt266_carr_023 IN LOCAL MODE
*        ENTITY Carrier
*        UPDATE FIELDS ( CurrencyCode )
*        WITH VALUE #( FOR carrier IN carriers ( %tky = carrier-%tky
*                                                CurrencyCode = 'EUR' ) ).

  ENDMETHOD.

ENDCLASS.
