----------------------------------------------------------------------------------
-- Company:				ITESM - IRS 2024
-- Engineers: 			Sebastián Castellanos, Diego Quezada and Eduardo Viveros
-- 
-- Create Date: 		16/04/2024
-- Design Name: 		Sub Bytes TestBench
-- Module Name:		Sub Bytes Module TestBench
-- Target Devices: 	DE10-Lite
-- Description: 		TestBench del módulo Sub Bytes
--
-- Version 0.0 - File Creation
-- Additional Comments: 
--
----------------------------------------------------------------------------------

--- Library and Packages usage definition
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;

-- Entity for the device that will be simulated
entity SubBytes_tb is
end SubBytes_tb;

-- Architecture for the device to be simulated
architecture SubBytes_tb_Arch of SubBytes_tb is
   -- Component that will be simulated is declared as a component
   component SubBytes_keys
		Port(
		 Start     		: in  std_logic;
		 Clk       		: in  std_logic;
		 rotatedWord	: in  std_logic_vector(31 downto 0);
		 suBytedWord	: out std_logic_vector(31 downto 0);
		 Finish    : out std_logic);
   end component;

   -- Embedded signals that will be used to establish a connection with the component
   -- to be simulated
   -- Inputs (Always Initialize Inputs)
   signal Start    		: std_logic						    	:= '0';
   signal Clk      		: std_logic                      := '0';
	signal rotatedWord	: std_logic_vector(31 downto 0):= (others => '0');
	-- Outputs
	signal suBytedWord	: std_logic_vector(31 downto 0);
	signal Finish   : std_logic;

   -- Clk Period
   constant Clk_period : time := 10 ns;	

begin
  -- Instantiate the component that will be simulated
  DUT: SubBytes_keys port map (
		Start   => Start,
		Clk     => Clk,
		Finish  => Finish,
		rotatedWord  => rotatedWord,
	   suBytedWord => suBytedWord);
		

   -- Clock process definitions
   Clk_process: process
   begin
		Clk <= '0';
		wait for Clk_period/2;
		Clk <= '1';
		wait for Clk_period/2;
	end process;
		
  -- Stimulus (Test cases) (Note: no sensitivity list)
  stim_process: process
  begin
    -- hold reset state for 100ns, always include the followint statement
	 wait for Clk_period;
	 
	 -- Test Case 1: First Round
	 Start   <= '1';
	 rotatedWord  <= x"6c76052a";
	 Clk     <= '1';
	 wait for 100 ns;
	 wait;
	 
	 
  end process;
		
end SubBytes_tb_Arch;