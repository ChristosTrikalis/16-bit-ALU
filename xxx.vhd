--structural code
library IEEE, work;
use IEEE.std_logic_1164.all;
USE ieee.std_logic_arith.all ; 
USE ieee.std_logic_unsigned.all ;
use ieee.std_logic_textio.all;  
use ieee.numeric_std.all;
use work.declarations.all;

entity xxx is
	port (inA,inB,Ainvert,Binvert,cin: in std_logic;
			Op: in std_logic_vector(1 downto 0);
	overflow,final_result,cout: out std_logic);
end xxx; --- metablites


architecture structural of xxx is
component port_And
            port (out1, out2: in std_logic; 
				result_and: out std_logic);
     end component;
     -- or declaration
	  component port_Or
           
           port (out1, out2: in std_logic; 
			  result_or: out std_logic);
     end component;
	  -- xor declaration
	  component port_Xor
		port(out1,out2: in std_logic;
			result_xor: out std_logic);
		end component;
		
		-- adder component
		component port_Adder
			port(out1,out2,cin : in std_logic;
					
					result_sum,cout,overflow : out std_logic);
		end component;
		-- alu A
		component alu_A
			port (inA,Ainvert: in std_logic;
				out1: out std_logic);
			end component;
			
			-- alu B 
				component alu_B
			port (inB,Binvert: in std_logic;
				out2: out std_logic);
			end component;
			--alu 4 inp
		component alu_4inp
			port (result_and,result_or,result_sum,result_xor: in std_logic;
					Op : in std_logic_vector(1 downto 0);
					final_result: out std_logic);	
		end component;
	
--Signals
	signal s1, s2, s3, s4, s5,s7,s8: STD_LOGIC;
	--signal s9 : std_logic_vector(1 downto 0);
	
	
	begin
		uo: alu_A port map  ( inA,Ainvert,s1);
		u1: alu_B port map (inB,Binvert,s2);
		u2: port_And port map (s1,s2,s3);
		u3: port_Or port map (s1,s2,s4);
		u4: port_Adder port map (s1,s2,cin,s5,cout,s7);
		u5: port_xor port map (s1,s2,s8);
		u6: alu_4inp port map (s3,s4,s5,s8,Op,final_result);
end structural;
	
		
		
		