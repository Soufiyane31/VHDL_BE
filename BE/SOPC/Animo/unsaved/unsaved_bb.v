
module unsaved (
	clk_clk,
	reset_reset_n,
	sortie_external_connection_export,
	entree_external_connection_export);	

	input		clk_clk;
	input		reset_reset_n;
	output	[7:0]	sortie_external_connection_export;
	input	[7:0]	entree_external_connection_export;
endmodule
