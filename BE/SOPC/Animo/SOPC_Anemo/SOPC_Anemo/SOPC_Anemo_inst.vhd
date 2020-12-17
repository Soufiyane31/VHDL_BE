	component SOPC_Anemo is
		port (
			animo_0_data_animometre_new_signal    : out std_logic_vector(7 downto 0);                    -- new_signal
			animo_0_in_freq_anemometre_new_signal : in  std_logic                    := 'X';             -- new_signal
			boutonp_0_bp_babord_new_signal        : in  std_logic                    := 'X';             -- new_signal
			boutonp_0_bp_stby_new_signal          : in  std_logic                    := 'X';             -- new_signal
			boutonp_0_bp_tribord_new_signal       : in  std_logic                    := 'X';             -- new_signal
			boutonp_0_ledbabord_new_signal        : out std_logic;                                       -- new_signal
			boutonp_0_ledstby_new_signal          : out std_logic;                                       -- new_signal
			boutonp_0_ledtribord_new_signal       : out std_logic;                                       -- new_signal
			boutonp_0_out_bip_new_signal          : out std_logic;                                       -- new_signal
			clk_clk                               : in  std_logic                    := 'X';             -- clk
			entree_external_connection_export     : in  std_logic_vector(7 downto 0) := (others => 'X'); -- export
			pwm_0_pwm_out_new_signal              : out std_logic;                                       -- new_signal
			reset_reset_n                         : in  std_logic                    := 'X';             -- reset_n
			sortie_external_connection_export     : out std_logic_vector(7 downto 0)                     -- export
		);
	end component SOPC_Anemo;

	u0 : component SOPC_Anemo
		port map (
			animo_0_data_animometre_new_signal    => CONNECTED_TO_animo_0_data_animometre_new_signal,    --    animo_0_data_animometre.new_signal
			animo_0_in_freq_anemometre_new_signal => CONNECTED_TO_animo_0_in_freq_anemometre_new_signal, -- animo_0_in_freq_anemometre.new_signal
			boutonp_0_bp_babord_new_signal        => CONNECTED_TO_boutonp_0_bp_babord_new_signal,        --        boutonp_0_bp_babord.new_signal
			boutonp_0_bp_stby_new_signal          => CONNECTED_TO_boutonp_0_bp_stby_new_signal,          --          boutonp_0_bp_stby.new_signal
			boutonp_0_bp_tribord_new_signal       => CONNECTED_TO_boutonp_0_bp_tribord_new_signal,       --       boutonp_0_bp_tribord.new_signal
			boutonp_0_ledbabord_new_signal        => CONNECTED_TO_boutonp_0_ledbabord_new_signal,        --        boutonp_0_ledbabord.new_signal
			boutonp_0_ledstby_new_signal          => CONNECTED_TO_boutonp_0_ledstby_new_signal,          --          boutonp_0_ledstby.new_signal
			boutonp_0_ledtribord_new_signal       => CONNECTED_TO_boutonp_0_ledtribord_new_signal,       --       boutonp_0_ledtribord.new_signal
			boutonp_0_out_bip_new_signal          => CONNECTED_TO_boutonp_0_out_bip_new_signal,          --          boutonp_0_out_bip.new_signal
			clk_clk                               => CONNECTED_TO_clk_clk,                               --                        clk.clk
			entree_external_connection_export     => CONNECTED_TO_entree_external_connection_export,     -- entree_external_connection.export
			pwm_0_pwm_out_new_signal              => CONNECTED_TO_pwm_0_pwm_out_new_signal,              --              pwm_0_pwm_out.new_signal
			reset_reset_n                         => CONNECTED_TO_reset_reset_n,                         --                      reset.reset_n
			sortie_external_connection_export     => CONNECTED_TO_sortie_external_connection_export      -- sortie_external_connection.export
		);

