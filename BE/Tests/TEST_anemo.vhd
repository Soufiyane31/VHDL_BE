library 	ieee;
USE ieee.std_logic_1164.all;

ENTITY test_anemo IS 
PORT (
		CLK_50M :		IN STD_logic;
		raz_n   :		IN Std_logic;
		--in_freq_anemometre:  		IN STD_logic;
		BT1 : IN STD_logic;
		
		data_anemometre: OuT	STD_LOGIC_VECTOR(7 downto 0) := (others => '0')
		
		);
		END test_anemo;
		
      architecture archi_animo of test_anemo is
		signal in_freq_anemometre: STD_logic;
		signal start_stop : std_logic;
		signal continu : std_logic;
		signal chose :	STD_LOGIC_VECTOR(7 downto 0) := (others => '0');
		type etat is(etat0,etat1,etat2,etat3);
		signal etat_present,etat_future : etat := etat0;
		begin 
		
		pwm1: entity work.pwm
	Port map( CLK_50M,
				raz_n,
			  X"0190", -- freq: 400 //250Hz
           X"00C8", -- duty: 200 
           in_freq_anemometre,
			  X"01F3" -- prescaler : 500-1
			  );
		
		anemo: entity work.animometre
		port map(
			 CLK_50M => CLK_50M,
			raz_n    => raz_n,
			in_freq_anemometre => in_freq_anemometre,
			continu => '1',
		start_stop => '0',
		data_anemometre => data_anemometre);
 
		p_BT1 : process(CLK_50M) 
		begin
		case etat_present is
		when  etat0 => if BT1 ='0' then 
			etat_future <= etat1;
			else
			etat_future <= etat0;
			end if;
			
	when etat1 => if BT1 ='1' then 
			etat_future <= etat2;
			else
			etat_future <= etat1;
			end if;
			
	when etat2 => if BT1 ='0' then
			etat_future <= etat3;
			else
			etat_future <= etat2;
			end if;
	when etat3 => if BT1 ='1' then 
			etat_future <= etat0;
			else
			etat_future <= etat3;
			end if;
	end case;
	end process;
	
	sequentiel : process (clk_50M)
	begin
	if clk_50M'event and clk_50M ='1' then
		etat_present <= etat_future;
	end if;
	end process sequentiel;
	
	
	combinatoire : process (etat_present)
	begin
	case etat_present is
	when etat0 => continu <= '1';
						start_stop <= '0';
			--			data_anemometre(7) <= '0';
						
	when etat1 =>  start_stop <= '0';
	
	when etat2 => start_stop <= '1'; 
						continu <= '0';
		--				data_anemometre(7) <= '1';
						
	when etat3 => continu <= '0'; 

	end case;
	end process combinatoire;
	
	--data_anemometre(6 downto 0) <= chose(6 downto 0);
	
	
	END archi_animo;
		