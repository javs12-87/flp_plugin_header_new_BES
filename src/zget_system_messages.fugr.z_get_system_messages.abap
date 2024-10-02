FUNCTION z_get_system_messages.
*"----------------------------------------------------------------------
*"*"Local Interface:
*"  EXPORTING
*"     VALUE(MSG) TYPE  STRING
*"----------------------------------------------------------------------
  TRY.

      DATA:
        lt_messages TYPE STANDARD TABLE OF temsg with HEADER LINE.

      CALL FUNCTION 'SM02_READ_MESSAGES'  "
        TABLES
          messages = lt_messages
        .

    "add custom logic to define message extraction logic
    "sample use case: only 1 'global' message
    "customize as needed for handling client specific messages
    LOOP AT lt_messages.
        CONCATENATE msg lt_messages-emtext INTO msg SEPARATED BY SPACE.
    ENDLOOP.

    CONDENSE msg.

    CATCH cx_sca_remote_connection_error INTO DATA(lx_remote).
  ENDTRY.

ENDFUNCTION.
