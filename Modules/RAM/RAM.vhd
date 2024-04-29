-----------------------------------------------------------------
-- Company: ITESM - Campus Qro.
-- Author:  Kevin Alejandro Ramírez Luna 
-- Date:    24-Abril-2024
-- Design:  ROM 16 x 4
-- Descripiton: Implementarion a Single Port ROM Size 16 x 4
-- Tool Version: Altera Quartus Lite v21.2 build 842
-- Targer Device: DE10-Lite (Terasic.com)
-- Version: 1.0
-----------------------------------------------------------------

-- Library and Packages usage definition
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;

entity RAM is
    generic (
        -- Tamaño de la RAM
        SIZE : integer := 10
    );
    port (
        Clk           : in std_logic;                  -- Reloj
        Addr          : in integer range 0 to SIZE-1;  -- Dirección
		  Write_R       : in std_logic;                   -- Señal de escritura
        Data_in       : in std_logic_vector(127 downto 0) := (others => '0'); -- Datos de entrada (128 bits)
        Data_out      : out std_logic_vector(127 downto 0)); -- Datos de salida (128 bits) 
end RAM;

architecture RAM_ARCH of RAM is

    -- Definición de la memoria RAM como un array de vectores de 128 bits
	 --                       memory locations                    size of each location
    type   RAM_memory is array (0 to SIZE-1) of std_logic_vector(127 downto 0);
    signal memory : RAM_memory;

begin
  -- Instance the RAM
  -- Write operations/Read operations
    Write_RAM : process(Clk)
    begin
        if (rising_edge(clk)) then
            if (Write_R  = '1') then
                memory(conv_integer(Addr)) <= Data_in; --Writting in memory
            else
                -- Lectura de la memoria
                Data_out <= memory(conv_integer(Addr));
            end if;
        end if;
    end process Write_RAM;	 
end architecture RAM_ARCH;