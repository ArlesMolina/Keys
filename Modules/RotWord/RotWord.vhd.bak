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


entity rotWord is
	port(	-- Column to be rotated, each 8 bits represent a different row
			column			: in std_logic_vector(31 downto 0);
			rotatedWord		: out std_logic_vector(31 downto 0)
	);
end rotWord;


architecture behaveRot of rotWord is
begin
    rotation : process(column)
    begin
        rotatedWord <= column(23 downto 0) & column(31 downto 24);
    end process rotation;
end architecture behaveRot;