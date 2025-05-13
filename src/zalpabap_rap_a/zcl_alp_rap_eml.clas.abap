CLASS zcl_alp_rap_eml DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun .

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.

CLASS zcl_alp_rap_eml IMPLEMENTATION.
  METHOD if_oo_adt_classrun~main.

    CONSTANTS lc_uline TYPE string
        VALUE '**********************************************************************'.

    "Step 1 - READ
    READ ENTITIES OF ZI_ALP_RAP_Travel
        ENTITY Travel
        FROM VALUE #( ( TravelUUID = '05C551E329B791571900FDE605BA7F5C' ) )
        RESULT DATA(t_travel_1).

    out->write( t_travel_1 ).

    out->write( lc_uline ).

    "Step 2 - READ with Fields
    READ ENTITIES OF ZI_ALP_RAP_Travel
       ENTITY Travel
       FIELDS ( AgencyID CustomerID )
       WITH VALUE #( ( TravelUUID = '05C551E329B791571900FDE605BA7F5C' ) )
       RESULT DATA(t_travel_2).

    out->write( t_travel_2 ).

    out->write( lc_uline ).

    "Step 3 - READ with All Fields
    READ ENTITIES OF ZI_ALP_RAP_Travel
        ENTITY Travel
        ALL FIELDS WITH VALUE #( ( TravelUUID = '05C551E329B791571900FDE605BA7F5C' ) )
        RESULT DATA(t_travel_3).

    out->write( t_travel_3 ).

    out->write( lc_uline ).

    "Step 4 - READ By Association
    READ ENTITIES OF ZI_ALP_RAP_Travel
        ENTITY Travel BY \_Booking
        ALL FIELDS WITH VALUE #( ( TravelUUID = '05C551E329B791571900FDE605BA7F5C' ) )
        RESULT DATA(t_travel_book).

    out->write( t_travel_book ).

    out->write( lc_uline ).

    "Step 5 - Unsuccessful READ
    READ ENTITIES OF ZI_ALP_RAP_Travel
        ENTITY Travel
        ALL FIELDS WITH VALUE #( ( TravelUUID = '01C999E999B999999900FDE605BA7F9C' ) )
        RESULT DATA(t_travel_4)
        FAILED DATA(s_failed_1)
        REPORTED DATA(s_reported_1).

    out->write( t_travel_4 ).
    out->write( s_failed_1-travel ).   "Log por Entidade
    out->write( s_reported_1-travel ). "Log por Entidade

    out->write( lc_uline ).

    "Step 6 - MODIFY Update
    "De: 'Visiting to dubai lock'
    "Para: 'Visiting to Rio de Janeiro'
    MODIFY ENTITIES OF ZI_ALP_RAP_Travel
        ENTITY Travel
        UPDATE SET FIELDS WITH VALUE #( ( TravelUUID = '05C551E329B791571900FDE605BA7F5C'
                                          Description = 'Visiting to Rio de Janeiro' ) )
        FAILED DATA(s_failed_2)
        REPORTED DATA(s_reported_2).

    out->write( s_failed_2-travel ).   "Log por Entidade
    out->write( s_reported_2-travel ). "Log por Entidade

    out->write( lc_uline ).

    "Step 6b - Commit Entities
    COMMIT ENTITIES RESPONSE OF ZI_ALP_RAP_Travel
       FAILED DATA(s_failed_3)
       REPORTED DATA(s_reported_3).

    out->write( s_failed_3-travel ).   "Log por Entidade
    out->write( s_reported_3-travel ). "Log por Entidade

    out->write( lc_uline ).

    "Step 7 - MODIFY Create
    MODIFY ENTITIES OF ZI_ALP_RAP_Travel
        ENTITY Travel
        CREATE SET FIELDS WITH VALUE #( ( %cid        = 'ID_208'
                                          AgencyID    = '70012'
                                          CustomerID  = '14'
                                          BeginDate   = cl_abap_context_info=>get_system_date( )
                                          EndDate     = cl_abap_context_info=>get_system_date( ) + 10
                                          Description = 'I like RAP@openSAP' ) )
        MAPPED DATA(t_travel_5)
        FAILED DATA(s_failed_4)
        REPORTED DATA(s_reported_4).

    out->write( t_travel_5 ).

    out->write( lc_uline ).

    COMMIT ENTITIES RESPONSE OF ZI_ALP_RAP_Travel
        FAILED DATA(s_failed_5)
        REPORTED DATA(s_reported_5).

    out->write( s_failed_5-travel ).   "Log por Entidade
    out->write( s_reported_5-travel ). "Log por Entidade

    out->write( lc_uline ).

    "Step 8 - MODIFY Delete
    MODIFY ENTITIES OF ZI_ALP_RAP_Travel
        ENTITY Travel
        "DELETE FROM VALUE #( ( TravelUUID = '05C551E329B791571900FDE605BA7F5C' ) )
        DELETE FROM VALUE #( ( TravelUUID = t_travel_5-travel[ 1 ]-TravelUUID ) )
        FAILED DATA(s_failed_6)
        REPORTED DATA(s_reported_6).

    out->write( s_failed_6-travel ).   "Log por Entidade
    out->write( s_reported_6-travel ). "Log por Entidade

    out->write( lc_uline ).

    COMMIT ENTITIES RESPONSE OF ZI_ALP_RAP_Travel
        FAILED DATA(s_failed_7)
        REPORTED DATA(s_reported_7).

    out->write( s_failed_7-travel ).   "Log por Entidade
    out->write( s_reported_7-travel ). "Log por Entidade

    out->write( lc_uline ).

  ENDMETHOD.
ENDCLASS.
