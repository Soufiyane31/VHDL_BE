
module SOPC_Anemo (
	animo_0_data_animometre_new_signal,
	animo_0_in_freq_anemometre_new_signal,
	boutonp_0_bp_babord_new_signal,
	boutonp_0_bp_stby_new_signal,
	boutonp_0_bp_tribord_new_signal,
	boutonp_0_ledbabord_new_signal,
	boutonp_0_ledstby_new_signal,
	boutonp_0_ledtribord_new_signal,
	boutonp_0_out_bip_new_signal,
	clk_clk,
	entree_external_connection_export,
	pwm_0_pwm_out_new_signal,
	reset_reset_n,
	sortie_external_connection_export);	

	output	[7:0]	animo_0_data_animometre_new_signal;
	input		animo_0_in_freq_anemometre_new_signal;
	input		boutonp_0_bp_babord_new_signal;
	input		boutonp_0_bp_stby_new_signal;
	input		boutonp_0_bp_tribord_new_signal;
	output		boutonp_0_ledbabord_new_signal;
	output		boutonp_0_ledstby_new_signal;
	output		boutonp_0_ledtribord_new_signal;
	output		boutonp_0_out_bip_new_signal;
	input		clk_clk;
	input	[7:0]	entree_external_connection_export;
	output		pwm_0_pwm_out_new_signal;
	input		reset_reset_n;
	output	[7:0]	sortie_external_connection_export;
endmodule
