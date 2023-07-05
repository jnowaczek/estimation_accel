# This script segment is generated automatically by AutoPilot

# clear list
if {${::AESL::PGuard_autoexp_gen}} {
    cg_default_interface_gen_dc_begin
    cg_default_interface_gen_bundle_begin
    AESL_LIB_XILADAPTER::native_axis_begin
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 20 \
    name split_out_0 \
    type fifo \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_split_out_0 \
    op interface \
    ports { split_out_0_dout { I 8 vector } split_out_0_empty_n { I 1 bit } split_out_0_read { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 21 \
    name merge_in_0 \
    type fifo \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_merge_in_0 \
    op interface \
    ports { merge_in_0_din { O 8 vector } merge_in_0_full_n { I 1 bit } merge_in_0_write { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 22 \
    name split_out_1 \
    type fifo \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_split_out_1 \
    op interface \
    ports { split_out_1_dout { I 8 vector } split_out_1_empty_n { I 1 bit } split_out_1_read { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 23 \
    name merge_in_1 \
    type fifo \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_merge_in_1 \
    op interface \
    ports { merge_in_1_din { O 8 vector } merge_in_1_full_n { I 1 bit } merge_in_1_write { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 24 \
    name split_out_2 \
    type fifo \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_split_out_2 \
    op interface \
    ports { split_out_2_dout { I 8 vector } split_out_2_empty_n { I 1 bit } split_out_2_read { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 25 \
    name merge_in_2 \
    type fifo \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_merge_in_2 \
    op interface \
    ports { merge_in_2_din { O 8 vector } merge_in_2_full_n { I 1 bit } merge_in_2_write { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 26 \
    name split_out_3 \
    type fifo \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_split_out_3 \
    op interface \
    ports { split_out_3_dout { I 8 vector } split_out_3_empty_n { I 1 bit } split_out_3_read { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 27 \
    name merge_in_3 \
    type fifo \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_merge_in_3 \
    op interface \
    ports { merge_in_3_din { O 8 vector } merge_in_3_full_n { I 1 bit } merge_in_3_write { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 28 \
    name split_out_4 \
    type fifo \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_split_out_4 \
    op interface \
    ports { split_out_4_dout { I 8 vector } split_out_4_empty_n { I 1 bit } split_out_4_read { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 29 \
    name merge_in_4 \
    type fifo \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_merge_in_4 \
    op interface \
    ports { merge_in_4_din { O 8 vector } merge_in_4_full_n { I 1 bit } merge_in_4_write { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 30 \
    name split_out_5 \
    type fifo \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_split_out_5 \
    op interface \
    ports { split_out_5_dout { I 8 vector } split_out_5_empty_n { I 1 bit } split_out_5_read { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 31 \
    name merge_in_5 \
    type fifo \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_merge_in_5 \
    op interface \
    ports { merge_in_5_din { O 8 vector } merge_in_5_full_n { I 1 bit } merge_in_5_write { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 32 \
    name split_out_6 \
    type fifo \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_split_out_6 \
    op interface \
    ports { split_out_6_dout { I 8 vector } split_out_6_empty_n { I 1 bit } split_out_6_read { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 33 \
    name merge_in_6 \
    type fifo \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_merge_in_6 \
    op interface \
    ports { merge_in_6_din { O 8 vector } merge_in_6_full_n { I 1 bit } merge_in_6_write { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 34 \
    name split_out_7 \
    type fifo \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_split_out_7 \
    op interface \
    ports { split_out_7_dout { I 8 vector } split_out_7_empty_n { I 1 bit } split_out_7_read { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 35 \
    name merge_in_7 \
    type fifo \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_merge_in_7 \
    op interface \
    ports { merge_in_7_din { O 8 vector } merge_in_7_full_n { I 1 bit } merge_in_7_write { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id -1 \
    name ap_ctrl \
    type ap_ctrl \
    reset_level 1 \
    sync_rst true \
    corename ap_ctrl \
    op interface \
    ports { ap_ready { O 1 bit } } \
} "
}


# Adapter definition:
set PortName ap_clk
set DataWd 1 
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc cg_default_interface_gen_clock] == "cg_default_interface_gen_clock"} {
eval "cg_default_interface_gen_clock { \
    id -2 \
    name ${PortName} \
    reset_level 1 \
    sync_rst true \
    corename apif_ap_clk \
    data_wd ${DataWd} \
    op interface \
}"
} else {
puts "@W \[IMPL-113\] Cannot find bus interface model in the library. Ignored generation of bus interface for '${PortName}'"
}
}


# Adapter definition:
set PortName ap_rst
set DataWd 1 
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc cg_default_interface_gen_reset] == "cg_default_interface_gen_reset"} {
eval "cg_default_interface_gen_reset { \
    id -3 \
    name ${PortName} \
    reset_level 1 \
    sync_rst true \
    corename apif_ap_rst \
    data_wd ${DataWd} \
    op interface \
}"
} else {
puts "@W \[IMPL-114\] Cannot find bus interface model in the library. Ignored generation of bus interface for '${PortName}'"
}
}



# merge
if {${::AESL::PGuard_autoexp_gen}} {
    cg_default_interface_gen_dc_end
    cg_default_interface_gen_bundle_end
    AESL_LIB_XILADAPTER::native_axis_end
}


