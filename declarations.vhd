
Library IEEE;
Use IEEE.STD_LOGIC_1164.all;
Use IEEE.STD_LOGIC_unsigned.all;
use ieee.numeric_std.all;

-- Package declaration
package declarations is
     -- AND declaration
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
		
		-- alu A component
		component alu_A
			port (inA,Ainvert: in std_logic;
				out1: out std_logic);
			end component;
			
			-- alu B  component 
		component alu_B
			port (inB,Binvert: in std_logic;
				out2: out std_logic);
			end component;
			
		-- alu 4 inputs 
		component alu_4inp
			port (result_and,result_or,result_sum,result_xor: in std_logic;
					Op : in std_logic_vector(1 downto 0);
					final_result: out std_logic);	
		end component;
end package declarations;
 
-- Package body declarations
library ieee;
use ieee.std_logic_1164.all;
--package body basic_func is
     -- 2 input AND gate
     entity port_And is
           
           port (out1, out2: in std_logic; 
			  result_and: out std_logic);
     end port_And;
     
	  architecture model_conc of port_And is
           begin
                
					 result_and <= out1 and out2;
     end model_conc;
	  -- 2 input OR gate
library ieee;
use ieee.std_logic_1164.all;
	  entity port_Or is
           
           port (out1, out2: in std_logic; 
			  result_or: out std_logic);
     end port_Or;
	  
     architecture model_conc2 of port_Or is
           begin
                
					 result_or <= out1 or out2;
     end model_conc2;
	  -- 2 input XOR gate
library ieee;
use ieee.std_logic_1164.all;
	  entity port_Xor is
           
           port (out1,out2: in std_logic; 
			  result_xor: out std_logic);
     end port_Xor;
	  
     architecture model_conc3 of port_Xor is
           begin
                
					 result_xor <= out1 xor out2;
     end model_conc3;
	  
library IEEE;
 use IEEE.std_logic_1164.all;
	 entity port_Adder is
		port(out1,out2,cin : in std_logic;
				result_sum,cout,overflow : out std_logic);
	end port_Adder;

	
	architecture model_conc4 of port_Adder  is
	
		begin 
		
		result_sum <= out1 xor out2 xor cin;
		cout<= (out1 and out2) or (out2 and cin) or (cin and out1);
		--- leipei overflow 
		--sum <= ('0' & out1) + out2 + cin;
		--result_sum<= sum(1);
		--cout<= sum(2);
		--overflow<=sum(2) xor out1(1) xor out2(1) xor sum(1);
		
		
		
	end model_conc4;
library IEEE;
use IEEE.std_LOGIC_1164.all;
	entity alu_A is
		port (inA,Ainvert: in std_logic;
				out1: out std_logic);
		end alu_A;
	architecture model_conc5 of alu_A is
		begin 
		with Ainvert select
			 out1<= inA when '0' ,
			 not inA when '1',
			null when others ;	
end model_conc5;
			
library IEEE;
use IEEE.std_LOGIC_1164.all;
	entity alu_B is
		port (inB,Binvert: in std_logic;
				out2: out std_logic);
		end alu_B;
	architecture model_conc6 of alu_B is
		begin 
			with Binvert select
			 out2<= inB when '0' ,
			 not inB when '1',
			 null when others ;	
end model_conc6;

library IEEE;
use IEEE.std_LOGIC_1164.all;
	entity alu_4inp is
		port ( result_and,result_or,result_sum,result_xor: in std_logic;
				Op: in std_logic_vector(1 downto 0);
				 final_result : out std_logic);
		end alu_4inp;
	architecture model_conc7 of alu_4inp is
		begin 
		with Op select
			final_result<=result_and when "00" ,
			result_or when "01",
			result_sum when "10",
			result_xor when "11",
			null when others ;	
end model_conc7;
		
		
		
		
--end package body basic_func;


	
