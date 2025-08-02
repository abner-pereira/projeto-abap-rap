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

    DELETE FROM: zalp_activity,
                 zalp_outsourcing,
                 zalp_employee,
                 zalp_customer.

    COMMIT WORK.

    INSERT zalp_employee FROM TABLE @(
      VALUE #( ( employee_uuid         = 1000315
                 employee_id           = 315
                 first_name            = 'Sônia'
                 last_name             = 'Nobrega'
                 hired_date            = '20230917'
                 fired_date            = '99991231'
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
                 created_by            = 'Julio'
                 created_at            = cl_abap_context_info=>get_system_date( ) && cl_abap_context_info=>get_system_time( )
                 last_changed_by       = 'Julio'
                 last_changed_at       = cl_abap_context_info=>get_system_date( ) && cl_abap_context_info=>get_system_time( )
                 local_last_changed_at = cl_abap_context_info=>get_system_date( ) && cl_abap_context_info=>get_system_time( )
               ) ) ).

    INSERT zalp_customer FROM TABLE @(
      VALUE #( ( customer_uuid         = 55000100
                 customer_id           = 100
                 descricao             = 'NIO'
                 ativo                 = 'X'
                 last_changed_by       = 'Julio'
                 last_changed_at       = cl_abap_context_info=>get_system_date( ) && cl_abap_context_info=>get_system_time( )
                 local_last_changed_at = cl_abap_context_info=>get_system_date( ) && cl_abap_context_info=>get_system_time( )
               )
               ( customer_uuid         = 55000200
                 customer_id           = 200
                 descricao             = 'TIM'
                 ativo                 = 'X'
                 last_changed_by       = 'Julio'
                 last_changed_at       = cl_abap_context_info=>get_system_date( ) && cl_abap_context_info=>get_system_time( )
                 local_last_changed_at = cl_abap_context_info=>get_system_date( ) && cl_abap_context_info=>get_system_time( )
               )
               ( customer_uuid         = 55000300
                 customer_id           = 300
                 descricao             = 'CLARO'
                 ativo                 = 'X'
                 last_changed_by       = 'Andre'
                 last_changed_at       = cl_abap_context_info=>get_system_date( ) && cl_abap_context_info=>get_system_time( )
                 local_last_changed_at = cl_abap_context_info=>get_system_date( ) && cl_abap_context_info=>get_system_time( )
               ) ) ).

    INSERT zalp_outsourcing FROM TABLE @(
      VALUE #( ( outsource_uuid = 995000100
                 date_beg       = '20250105'
                 date_end       = '20250331'
                 employee_uuid  = 1000315
                 customer_uuid  = 55000200
               )
               ( outsource_uuid = 995000105
                 date_beg       = '20250105'
                 date_end       = '20250331'
                 employee_uuid  = 1000298
                 customer_uuid  = 55000200
               )
               ( outsource_uuid = 995000110
                 date_beg       = '20250401'
                 date_end       = '20250915'
                 employee_uuid  = 1000315
                 customer_uuid  = 55000100
               )
               ( outsource_uuid = 995000115
                 date_beg       = '20250401'
                 date_end       = '20251025'
                 employee_uuid  = 1000298
                 customer_uuid  = 55000300
               ) ) ).

    INSERT zalp_activity FROM TABLE @(
      VALUE #( ( activity_uuid         = 997500100
                 date_activ            = '20250105'
                 time_activ            = '080000'
                 descricao             = 'Mapeamento de Necessidades'
                 last_changed_by       = 'Sônia'
                 last_changed_at       = cl_abap_context_info=>get_system_date( ) && cl_abap_context_info=>get_system_time( )
                 local_last_changed_at = cl_abap_context_info=>get_system_date( ) && cl_abap_context_info=>get_system_time( )
                 outsource_uuid        = 995000100
               )
               ( activity_uuid         = 997500101
                 date_activ            = '20250105'
                 time_activ            = '080000'
                 descricao             = 'Mapeamento de Necessidades'
                 last_changed_by       = 'Ricardo'
                 last_changed_at       = cl_abap_context_info=>get_system_date( ) && cl_abap_context_info=>get_system_time( )
                 local_last_changed_at = cl_abap_context_info=>get_system_date( ) && cl_abap_context_info=>get_system_time( )
                 outsource_uuid        = 995000105
               )
               ( activity_uuid         = 997500102
                 date_activ            = '20250401'
                 time_activ            = '080000'
                 descricao             = 'Inicio do Projeto'
                 last_changed_by       = 'Sônia'
                 last_changed_at       = cl_abap_context_info=>get_system_date( ) && cl_abap_context_info=>get_system_time( )
                 local_last_changed_at = cl_abap_context_info=>get_system_date( ) && cl_abap_context_info=>get_system_time( )
                 outsource_uuid        = 995000110
               )
               ( activity_uuid         = 997500103
                 date_activ            = '20251025'
                 time_activ            = '080000'
                 descricao             = 'Entrega Final do Projeto'
                 last_changed_by       = 'Ricardo'
                 last_changed_at       = cl_abap_context_info=>get_system_date( ) && cl_abap_context_info=>get_system_time( )
                 local_last_changed_at = cl_abap_context_info=>get_system_date( ) && cl_abap_context_info=>get_system_time( )
                 outsource_uuid        = 995000115
               ) ) ).

    COMMIT WORK.

    out->write( |Dados inseridos com sucesso!| ).

  ENDMETHOD.
ENDCLASS.
