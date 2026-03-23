/*
Module: reset_synchronizer

    This module converts an asynchronous reset into a reset synchronous
    with the provided clock. The reset asserts asynchronously but deasserts
    synchronously to dest_clk.
*/

module reset_synchronizer #(
    parameter DEPTH           = 3,
    parameter RST_ACTIVE_HIGH = 1
)(
    input       clk,
    input       arst,
    output      arst_sync
);

    xpm_cdc_async_rst
    #(
        .DEST_SYNC_FF    (DEPTH), // integer; range: 2-10
        .INIT_SYNC_FF    (1), // For simulation
        .RST_ACTIVE_HIGH (RST_ACTIVE_HIGH) // integer; 0=active low reset, 1=active high reset
    ) xpm_cdc_async_rst_inst
    (
        .src_arst   (arst),
        .dest_clk   (clk),
        .dest_arst  (arst_sync)
    );

endmodule : reset_synchronizer
