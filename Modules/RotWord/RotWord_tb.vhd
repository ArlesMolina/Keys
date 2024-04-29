----------------------------------------------------------------------------------
-- Company:        ITESM - Campus Qro.
-- Engineer:       Emanuel Vega
-- 
-- Create Date:    07:05:34 04/18/2024 
-- Design Name: 
-- Module Name:    RotWord 
-- Project Name: 	 AES
-- Target Devices: 
-- Tool versions: 
-- Description:    Module rotWord for the first step of the key schedule
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------

library IEEE;
use IEEE.std_logic_1164.all;


entity RotWord is
	port(	-- Column to be rotated, each 8 bits represent a different row
			column			: in std_logic_vector(31 downto 0);
			rotatedWord		: out std_logic_vector(31 downto 0)
	);
end RotWord;

<<<<<<< HEAD

architecture behaveRot of RotWord is
begin
    rotation : process(column)
    begin
        rotatedWord <= column(23 downto 0) & column(31 downto 24);
    end process rotation;
end architecture behaveRot;
=======
     -- Component declaration for DUT (Device Under Test)
    component RotWord
        Port (
            input_port_1 : in std_logic;
            input_port_2 : in std_logic;
            output_port_1 : out std_logic;
            output_port_2 : out std_logic
        );
    end component;

    -- Signals declaration
    signal input_port_1_tb : std_logic := '0';  -- Test input signals
    signal input_port_2_tb : std_logic := '0';
    signal output_port_1_tb : std_logic;  -- Test output signals
    signal output_port_2_tb : std_logic;
	 
	 -- Constants declaration
    constant CLK_PERIOD : time := 10 ns;  -- Clock period (adjust as needed)

	-- Instantiate the DUT
    begin
        dut: RotWord
            port map (
                input_port_1 => input_port_1_tb,
                input_port_2 => input_port_2_tb,
                output_port_1 => output_port_1_tb,
                output_port_2 => output_port_2_tb
            );
	 
    -- Clock process
	process
	begin
		 while now < 1000 ns loop  -- Simulate for 1000 ns
			  wait for CLK_PERIOD / 2;
			  input_port_1_tb <= not input_port_1_tb;  -- Toggle the clock
		 end loop;
		 wait;
	end process;



    -- Stimulus process
    process
    begin
        -- Stimulus generation here
        -- You can write test vectors or any stimuli for your inputs here
        -- Example:
        input_port_2_tb <= '0';
        wait for 20 ns;
        input_port_2_tb <= '1';
        wait for 40 ns;
        input_port_2_tb <= '0';
        wait;
    end process;

    
end architecture tb_architecture;
>>>>>>> 2aee67831dd48df040af750de15a9102604b3e4c
