CLASS zcl_alp_abap_rap DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.

CLASS zcl_alp_abap_rap IMPLEMENTATION.
  METHOD if_oo_adt_classrun~main.

    out->write( 'Olá ABAP RAP!' ).

  ENDMETHOD.
ENDCLASS.
