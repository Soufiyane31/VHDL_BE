library 	ieee;
USE ieee.std_logic_1164.all;

ENTITY animometre IS 
PORT (
		CLK_50M :		IN STD_logic;
		raz_n   :		IN Std_logic;
		in_freq_anemometre:  		IN STD_logic;
		continu :		IN std_logic;
		start_stop: 	IN std_logic;
		data_valid: 	OUT STD_logic;
		data_anemometre: OuT	STD_LOGIC_VECTOR(7 downto 0) := (others => '0')
		
		);
		END animometre;
		
		architecture archi_animo of animometre is
		signal reset : std_logic := '1';
		signal diviseur_out : std_logic;
		signal counter_out : STD_LOGIC_VECTOR(7 downto 0) := (others => '0');
		signal counter_1s : STD_LOGIC_VECTOR(7 downto 0) := (others => '0');
type etat is(etat0,etat1,etat2,etat3,etat4,etat5);
signal etat_present,etat_future : etat := etat0;
		begin 
		diviseur: entity work.divider
		generic map (32)
		port map(
			 clock => CLK_50M,
          rst_n => raz_n,
          subCLK => diviseur_out,
			 prescaler => X"02FAF080"
          );
		cmp_div: entity work.counter
		generic map(8)
      Port map( 
		     clk =>diviseur_out,
           rst_n => not reset,
           count => counter_1s
           );	 
			 
		cmp: entity work.counter
		generic map(8)
      Port map( 
		     clk =>in_freq_anemometre,
           rst_n => not reset,
           count => counter_out
           );
	

	Getat : process(clk_50M)
	begin
	if clk_50M'event and clk_50M ='1' then
		case etat_present is
		when  etat0 => if continu ='1'or (continu='0' and start_stop='1') then 
				etat_future <= etat1;
				else
				etat_future <= etat0;
				end if;
				
		when etat1 => if counter_1s =X"01" then 
				etat_future <= etat2;
				else
				etat_future <= etat1;
				end if;
				
		when etat2 => if continu ='1' then
				etat_future <= etat3;
				elsif continu='0' and start_stop ='1' then
				etat_future <= etat5;
				elsif start_stop = '0' and continu='0' then
				etat_future <= etat4;
				else
				etat_future <= etat2;
				end if;
		when etat3 => etat_future <= etat1;
		
		when etat5 => if start_stop ='0' then
				etat_future <= etat4;
				else
				etat_future <= etat5;
				end if;
		when etat4 => etat_future <= etat0;
				
		end case;
	end if;
	end process Getat;
	
	sequentiel : process (clk_50M,raz_n)
	begin
	if raz_n ='0' then 
	etat_present <= etat0;
	elsif clk_50M'event and clk_50M ='1' then
	etat_present <= etat_future;
	end if;
	end process sequentiel;
	
	
	combinatoire : process (etat_present)
	begin
	if raz_n ='0' then 
		data_valid <= '0'; 
		data_anemometre <= X"00";
	elsif clk_50M'event and clk_50M ='1' then
		case etat_present is
		when etat0 => data_valid <= '0'; 
		when etat1 => 
			data_valid <= '0'; 
			reset <='0';
		when etat2 => 
			data_valid <= '1'; 
			data_anemometre <= counter_out;
		when etat3 =>
				data_valid <= '0'; 
				reset <='1';
		when etat4 => 
		data_valid <= '0';
		reset <='1';
		when etat5 => data_valid <= '0'; 

		end case;
	end if;
	end process combinatoire;
	
	END archi_animo;
