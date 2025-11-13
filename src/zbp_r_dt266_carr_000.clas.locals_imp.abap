CLASS LHC_ZR_DT266_CARR_000 DEFINITION INHERITING FROM CL_ABAP_BEHAVIOR_HANDLER.
  PRIVATE SECTION.
    METHODS:
      GET_GLOBAL_AUTHORIZATIONS FOR GLOBAL AUTHORIZATION
        IMPORTING
           REQUEST requested_authorizations FOR Carrier
        RESULT result,
      validateAirLineName FOR VALIDATE ON SAVE
            IMPORTING keys FOR Carrier~validateAirLineName.
ENDCLASS.

CLASS LHC_ZR_DT266_CARR_000 IMPLEMENTATION.
  METHOD GET_GLOBAL_AUTHORIZATIONS.
  ENDMETHOD.


  METHOD validateAirLineName.

    READ ENTITIES OF zr_dt266_carr_000 in local mode
     ENTITY Carrier
     ALL FIELDS WITH CORRESPONDING #( keys )
     RESULT DATA(carriers).


    LOOP AT carriers INTO DATA(carrier).

      APPEND VALUE #(  %tky = carrier-%tky
                        %state_area = 'VALIDATE_AIRLINE'
                    ) TO reported-carrier.

*      IF carrier-Name IS INITIAL.

        APPEND VALUE #(  %tky = carrier-%tky
                          %state_area = 'VALIDATE_AIRLINE'
                          %element-name = if_abap_behv=>mk-on
                          %msg = new_message_with_text( severity = if_abap_behv_message=>severity-error
                                                        text     = 'Airline Name should not be initial.' )
                      ) TO reported-carrier.

        APPEND VALUE  #( %tky = carrier-%tky ) TO failed-carrier.

*     ENDIF.

    ENDLOOP.

  ENDMETHOD.

ENDCLASS.
