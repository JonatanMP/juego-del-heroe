module gw_gao(
    \fsm/presente[3] ,
    \fsm/presente[2] ,
    \fsm/presente[1] ,
    \fsm/presente[0] ,
    \fsm/estados[1] ,
    \fsm/estados[0] ,
    \fsm/futuro[3] ,
    \fsm/futuro[2] ,
    \fsm/futuro[1] ,
    \fsm/futuro[0] ,
    \menu/presente[3] ,
    \menu/presente[2] ,
    \menu/presente[1] ,
    \menu/presente[0] ,
    clk,
    encendido,
    \menu/cambio ,
    tms_pad_i,
    tck_pad_i,
    tdi_pad_i,
    tdo_pad_o
);

input \fsm/presente[3] ;
input \fsm/presente[2] ;
input \fsm/presente[1] ;
input \fsm/presente[0] ;
input \fsm/estados[1] ;
input \fsm/estados[0] ;
input \fsm/futuro[3] ;
input \fsm/futuro[2] ;
input \fsm/futuro[1] ;
input \fsm/futuro[0] ;
input \menu/presente[3] ;
input \menu/presente[2] ;
input \menu/presente[1] ;
input \menu/presente[0] ;
input clk;
input encendido;
input \menu/cambio ;
input tms_pad_i;
input tck_pad_i;
input tdi_pad_i;
output tdo_pad_o;

wire \fsm/presente[3] ;
wire \fsm/presente[2] ;
wire \fsm/presente[1] ;
wire \fsm/presente[0] ;
wire \fsm/estados[1] ;
wire \fsm/estados[0] ;
wire \fsm/futuro[3] ;
wire \fsm/futuro[2] ;
wire \fsm/futuro[1] ;
wire \fsm/futuro[0] ;
wire \menu/presente[3] ;
wire \menu/presente[2] ;
wire \menu/presente[1] ;
wire \menu/presente[0] ;
wire clk;
wire encendido;
wire \menu/cambio ;
wire tms_pad_i;
wire tck_pad_i;
wire tdi_pad_i;
wire tdo_pad_o;
wire tms_i_c;
wire tck_i_c;
wire tdi_i_c;
wire tdo_o_c;
wire [9:0] control0;
wire gao_jtag_tck;
wire gao_jtag_reset;
wire run_test_idle_er1;
wire run_test_idle_er2;
wire shift_dr_capture_dr;
wire update_dr;
wire pause_dr;
wire enable_er1;
wire enable_er2;
wire gao_jtag_tdi;
wire tdo_er1;

IBUF tms_ibuf (
    .I(tms_pad_i),
    .O(tms_i_c)
);

IBUF tck_ibuf (
    .I(tck_pad_i),
    .O(tck_i_c)
);

IBUF tdi_ibuf (
    .I(tdi_pad_i),
    .O(tdi_i_c)
);

OBUF tdo_obuf (
    .I(tdo_o_c),
    .O(tdo_pad_o)
);

GW_JTAG  u_gw_jtag(
    .tms_pad_i(tms_i_c),
    .tck_pad_i(tck_i_c),
    .tdi_pad_i(tdi_i_c),
    .tdo_pad_o(tdo_o_c),
    .tck_o(gao_jtag_tck),
    .test_logic_reset_o(gao_jtag_reset),
    .run_test_idle_er1_o(run_test_idle_er1),
    .run_test_idle_er2_o(run_test_idle_er2),
    .shift_dr_capture_dr_o(shift_dr_capture_dr),
    .update_dr_o(update_dr),
    .pause_dr_o(pause_dr),
    .enable_er1_o(enable_er1),
    .enable_er2_o(enable_er2),
    .tdi_o(gao_jtag_tdi),
    .tdo_er1_i(tdo_er1),
    .tdo_er2_i(1'b0)
);

gw_con_top  u_icon_top(
    .tck_i(gao_jtag_tck),
    .tdi_i(gao_jtag_tdi),
    .tdo_o(tdo_er1),
    .rst_i(gao_jtag_reset),
    .control0(control0[9:0]),
    .enable_i(enable_er1),
    .shift_dr_capture_dr_i(shift_dr_capture_dr),
    .update_dr_i(update_dr)
);

ao_top u_ao_top(
    .control(control0[9:0]),
    .data_i({\fsm/presente[3] ,\fsm/presente[2] ,\fsm/presente[1] ,\fsm/presente[0] ,\fsm/estados[1] ,\fsm/estados[0] ,\fsm/futuro[3] ,\fsm/futuro[2] ,\fsm/futuro[1] ,\fsm/futuro[0] ,\menu/presente[3] ,\menu/presente[2] ,\menu/presente[1] ,\menu/presente[0] ,clk,encendido,\menu/cambio }),
    .clk_i(clk)
);

endmodule
