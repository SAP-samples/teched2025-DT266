CLASS lhc_zr_dt266_carr_038 DEFINITION INHERITING FROM cl_abap_behavior_handler.
  PRIVATE SECTION.
    METHODS:
      get_global_authorizations FOR GLOBAL AUTHORIZATION
        IMPORTING
        REQUEST requested_authorizations FOR Carrier
        RESULT result,
      validateAirLineName FOR VALIDATE ON SAVE
        IMPORTING keys FOR Carrier~validateAirLineName.
ENDCLASS.

CLASS lhc_zr_dt266_carr_038 IMPLEMENTATION.
  METHOD get_global_authorizations.
  ENDMETHOD.


  METHOD validateAirLineName.

    READ ENTITIES OF zr_dt266_carr_038 IN LOCAL MODE
      ENTITY Carrier
      ALL FIELDS WITH CORRESPONDING #( keys )
      RESULT DATA(carriers).


    LOOP AT carriers INTO DATA(carrier).

      APPEND VALUE #(  %tky = carrier-%tky
                        %state_area = 'VALIDATE_AIRLINE'
                    ) TO reported-carrier.

" Exercise 3.2: Correction 1
*      IF carrier-Name IS INITIAL.

        APPEND VALUE #(  %tky = carrier-%tky
                          %state_area = 'VALIDATE_AIRLINE'
                          %element-name = if_abap_behv=>mk-on
                          %msg = new_message_with_text( severity = if_abap_behv_message=>severity-error
                                                        text     = 'Airline Name should not be initial.' )
                      ) TO reported-carrier.

        APPEND VALUE  #( %tky = carrier-%tky ) TO failed-carrier.

" Exercise 3.2: Correction 1
*      ENDIF.

    ENDLOOP.
  ENDMETHOD.

ENDCLASS.
