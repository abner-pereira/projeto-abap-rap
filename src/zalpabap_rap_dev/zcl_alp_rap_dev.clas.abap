CLASS zcl_alp_rap_dev DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    METHODS: insert_dado IMPORTING out TYPE REF TO if_oo_adt_classrun_out.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.

CLASS zcl_alp_rap_dev IMPLEMENTATION.
  METHOD if_oo_adt_classrun~main.

    "Inserção dos Dados
    insert_dado( out ).

  ENDMETHOD.
  METHOD insert_dado.

    DELETE FROM zalp_employee.

    INSERT zalp_employee FROM TABLE @(
      VALUE #( ( employee_uuid         = 1000315
                 employee_id           = 315
                 first_name            = 'Sônia'
                 last_name             = 'Nobrega'
                 hired_date            = '20230917'
                 fired_date            = '99991231'
                 status                = 'A'
                 created_by            = 'Andre'
                 created_at            = cl_abap_context_info=>get_system_date( ) && cl_abap_context_info=>get_system_time( )
                 last_changed_by       = 'Andre'
                 last_changed_at       = cl_abap_context_info=>get_system_date( ) && cl_abap_context_info=>get_system_time( )
                 local_last_changed_at = cl_abap_context_info=>get_system_date( ) && cl_abap_context_info=>get_system_time( )
               )
               ( employee_uuid         = 1000298
                 employee_id           = 298
                 first_name            = 'Ricardo'
                 last_name             = 'Palmeira'
                 hired_date            = '20221206'
                 fired_date            = '99991231'
                 status                = 'A'
                 created_by            = 'Julio'
                 created_at            = cl_abap_context_info=>get_system_date( ) && cl_abap_context_info=>get_system_time( )
                 last_changed_by       = 'Julio'
                 last_changed_at       = cl_abap_context_info=>get_system_date( ) && cl_abap_context_info=>get_system_time( )
                 local_last_changed_at = cl_abap_context_info=>get_system_date( ) && cl_abap_context_info=>get_system_time( )
               ) ) ).

    COMMIT WORK.

    DELETE FROM zalp_customer.

    INSERT zalp_customer FROM TABLE @(
      VALUE #( ( customer_id = 100 descricao = 'NIO'   date_beg = '20250101' date_end = '20250531' )
               ( customer_id = 200 descricao = 'TIM'   date_beg = '20250101' date_end = '20250531' )
               ( customer_id = 300 descricao = 'CLARO' date_beg = '20250101' date_end = '20251130' )
               ( customer_id = 400 descricao = 'VIVO'  date_beg = '20250101' date_end = '20251130' ) ) ).

    COMMIT WORK.

    DELETE FROM zalp_activity.

    COMMIT WORK.

    out->write( |Dados inseridos com sucesso!| ).

  ENDMETHOD.
ENDCLASS.
