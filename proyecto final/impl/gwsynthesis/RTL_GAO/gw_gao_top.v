module gw_gao(
    \presente[3] ,
    \presente[2] ,
    \presente[1] ,
    \presente[0] ,
    \heroe_seleccionado[2] ,
    \heroe_seleccionado[1] ,
    \heroe_seleccionado[0] ,
    \heroe[2] ,
    \heroe[1] ,
    \heroe[0] ,
    \disp_obs[20] ,
    \disp_obs[19] ,
    \disp_obs[18] ,
    \disp_obs[17] ,
    \disp_obs[16] ,
    \disp_obs[15] ,
    \disp_obs[14] ,
    \disp_obs[13] ,
    \disp_obs[12] ,
    \disp_obs[11] ,
    \disp_obs[10] ,
    \disp_obs[9] ,
    \disp_obs[8] ,
    \disp_obs[7] ,
    \disp_obs[6] ,
    \disp_obs[5] ,
    \disp_obs[4] ,
    \disp_obs[3] ,
    \disp_obs[2] ,
    \disp_obs[1] ,
    \disp_obs[0] ,
    \v_d[1] ,
    \v_d[0] ,
    \fsm/futuro[3] ,
    \fsm/futuro[2] ,
    \fsm/futuro[1] ,
    \fsm/futuro[0] ,
    \fsm/timer_pass[2] ,
    \fsm/timer_pass[1] ,
    \fsm/timer_pass[0] ,
    \fsm/timer_reset[3] ,
    \fsm/timer_reset[2] ,
    \fsm/timer_reset[1] ,
    \fsm/timer_reset[0] ,
    clk,
    tms_pad_i,
    tck_pad_i,
    tdi_pad_i,
    tdo_pad_o
);

input \presente[3] ;
input \presente[2] ;
input \presente[1] ;
input \presente[0] ;
input \heroe_seleccionado[2] ;
input \heroe_seleccionado[1] ;
input \heroe_seleccionado[0] ;
input \heroe[2] ;
input \heroe[1] ;
input \heroe[0] ;
input \disp_obs[20] ;
input \disp_obs[19] ;
input \disp_obs[18] ;
input \disp_obs[17] ;
input \disp_obs[16] ;
input \disp_obs[15] ;
input \disp_obs[14] ;
input \disp_obs[13] ;
input \disp_obs[12] ;
input \disp_obs[11] ;
input \disp_obs[10] ;
input \disp_obs[9] ;
input \disp_obs[8] ;
input \disp_obs[7] ;
input \disp_obs[6] ;
input \disp_obs[5] ;
input \disp_obs[4] ;
input \disp_obs[3] ;
input \disp_obs[2] ;
input \disp_obs[1] ;
input \disp_obs[0] ;
input \v_d[1] ;
input \v_d[0] ;
input \fsm/futuro[3] ;
input \fsm/futuro[2] ;
input \fsm/futuro[1] ;
input \fsm/futuro[0] ;
input \fsm/timer_pass[2] ;
input \fsm/timer_pass[1] ;
input \fsm/timer_pass[0] ;
input \fsm/timer_reset[3] ;
input \fsm/timer_reset[2] ;
input \fsm/timer_reset[1] ;
input \fsm/timer_reset[0] ;
input clk;
input tms_pad_i;
input tck_pad_i;
input tdi_pad_i;
output tdo_pad_o;

wire \presente[3] ;
wire \presente[2] ;
wire \presente[1] ;
wire \presente[0] ;
wire \heroe_seleccionado[2] ;
wire \heroe_seleccionado[1] ;
wire \heroe_seleccionado[0] ;
wire \heroe[2] ;
wire \heroe[1] ;
wire \heroe[0] ;
wire \disp_obs[20] ;
wire \disp_obs[19] ;
wire \disp_obs[18] ;
wire \disp_obs[17] ;
wire \disp_obs[16] ;
wire \disp_obs[15] ;
wire \disp_obs[14] ;
wire \disp_obs[13] ;
wire \disp_obs[12] ;
wire \disp_obs[11] ;
wire \disp_obs[10] ;
wire \disp_obs[9] ;
wire \disp_obs[8] ;
wire \disp_obs[7] ;
wire \disp_obs[6] ;
wire \disp_obs[5] ;
wire \disp_obs[4] ;
wire \disp_obs[3] ;
wire \disp_obs[2] ;
wire \disp_obs[1] ;
wire \disp_obs[0] ;
wire \v_d[1] ;
wire \v_d[0] ;
wire \fsm/futuro[3] ;
wire \fsm/futuro[2] ;
wire \fsm/futuro[1] ;
wire \fsm/futuro[0] ;
wire \fsm/timer_pass[2] ;
wire \fsm/timer_pass[1] ;
wire \fsm/timer_pass[0] ;
wire \fsm/timer_reset[3] ;
wire \fsm/timer_reset[2] ;
wire \fsm/timer_reset[1] ;
wire \fsm/timer_reset[0] ;
wire clk;
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
    .data_i({\presente[3] ,\presente[2] ,\presente[1] ,\presente[0] ,\heroe_seleccionado[2] ,\heroe_seleccionado[1] ,\heroe_seleccionado[0] ,\heroe[2] ,\heroe[1] ,\heroe[0] ,\disp_obs[20] ,\disp_obs[19] ,\disp_obs[18] ,\disp_obs[17] ,\disp_obs[16] ,\disp_obs[15] ,\disp_obs[14] ,\disp_obs[13] ,\disp_obs[12] ,\disp_obs[11] ,\disp_obs[10] ,\disp_obs[9] ,\disp_obs[8] ,\disp_obs[7] ,\disp_obs[6] ,\disp_obs[5] ,\disp_obs[4] ,\disp_obs[3] ,\disp_obs[2] ,\disp_obs[1] ,\disp_obs[0] ,\v_d[1] ,\v_d[0] ,\fsm/futuro[3] ,\fsm/futuro[2] ,\fsm/futuro[1] ,\fsm/futuro[0] ,\fsm/timer_pass[2] ,\fsm/timer_pass[1] ,\fsm/timer_pass[0] ,\fsm/timer_reset[3] ,\fsm/timer_reset[2] ,\fsm/timer_reset[1] ,\fsm/timer_reset[0] }),
    .clk_i(clk)
);

endmodule
