	component unsaved is
		port (
			clk_clk                           : in  std_logic                    := 'X';             -- clk
			reset_reset_n                     : in  std_logic                    := 'X';             -- reset_n
			sortie_external_connection_export : out std_logic_vector(7 downto 0);                    -- export
			entree_external_connection_export : in  std_logic_vector(7 downto 0) := (others => 'X')  -- export
		);
	end component unsaved;

	u0 : component unsaved
		port map (
			clk_clk                           => CONNECTED_TO_clk_clk,                           --                        clk.clk
			reset_reset_n                     => CONNECTED_TO_reset_reset_n,                     --                      reset.reset_n
			sortie_external_connection_export => CONNECTED_TO_sortie_external_connection_export, -- sortie_external_connection.export
			entree_external_connection_export => CONNECTED_TO_entree_external_connection_export  -- entree_external_connection.export
		);

