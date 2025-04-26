class zcl_query_prov_c311_t100578 definition
  public
  final
  create public .

  public section.

        interfaces: if_rap_query_provider.
  protected section.
  private section.
endclass.

class zcl_query_prov_c311_t100578 implementation.
      method if_rap_query_provider~select.
            data: lt_results type table of zi_cds_20_c311_t100578.

            try.
                if io_request->is_data_requested( ).
                    data(lv_top) = io_request->get_paging(  )->get_page_size( ).
                    data(lv_offset) = io_request->get_paging( )->get_offset( ).

                    select from /dmo/travel
                        fields travel_id, agency_id, customer_id
                    order by travel_id ascending
                        into table @lt_results
                    offset @lv_offset
                    up to @lv_top rows.

                    if sy-subrc = 0.        "Exitoso
                        io_response->set_total_number_of_records( lines( lt_results ) ).
                        io_response->set_data( lt_results ).
                    endif.

                endif.
            catch cx_rap_query_response_set_twic into data(lx_excepcion).
            endtry.

      endmethod.

endclass.
