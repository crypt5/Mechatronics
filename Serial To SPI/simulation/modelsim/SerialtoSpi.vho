-- Copyright (C) 1991-2015 Altera Corporation. All rights reserved.
-- Your use of Altera Corporation's design tools, logic functions 
-- and other software and tools, and its AMPP partner logic 
-- functions, and any output files from any of the foregoing 
-- (including device programming or simulation files), and any 
-- associated documentation or information are expressly subject 
-- to the terms and conditions of the Altera Program License 
-- Subscription Agreement, the Altera Quartus Prime License Agreement,
-- the Altera MegaCore Function License Agreement, or other 
-- applicable license agreement, including, without limitation, 
-- that your use is for the sole purpose of programming logic 
-- devices manufactured by Altera and sold by Altera or its 
-- authorized distributors.  Please refer to the applicable 
-- agreement for further details.

-- VENDOR "Altera"
-- PROGRAM "Quartus Prime"
-- VERSION "Version 15.1.0 Build 185 10/21/2015 SJ Lite Edition"

-- DATE "03/19/2016 23:06:43"

-- 
-- Device: Altera EP4CE22F17C6 Package FBGA256
-- 

-- 
-- This VHDL file should be used for ModelSim-Altera (VHDL) only
-- 

LIBRARY ALTERA;
LIBRARY CYCLONEIVE;
LIBRARY IEEE;
USE ALTERA.ALTERA_PRIMITIVES_COMPONENTS.ALL;
USE CYCLONEIVE.CYCLONEIVE_COMPONENTS.ALL;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY 	UART_IN IS
    PORT (
	clk : IN std_logic;
	newclk : OUT std_logic;
	TX_D : IN std_logic;
	RTS : IN std_logic;
	CTS : OUT std_logic;
	BYTEOUT : OUT std_logic_vector(7 DOWNTO 0);
	load : OUT std_logic
	);
END UART_IN;

-- Design Ports Information
-- newclk	=>  Location: PIN_E9,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- RTS	=>  Location: PIN_D11,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- CTS	=>  Location: PIN_B11,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- BYTEOUT[0]	=>  Location: PIN_A15,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- BYTEOUT[1]	=>  Location: PIN_A13,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- BYTEOUT[2]	=>  Location: PIN_B13,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- BYTEOUT[3]	=>  Location: PIN_A11,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- BYTEOUT[4]	=>  Location: PIN_D1,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- BYTEOUT[5]	=>  Location: PIN_F3,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- BYTEOUT[6]	=>  Location: PIN_B1,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- BYTEOUT[7]	=>  Location: PIN_L3,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- load	=>  Location: PIN_E11,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- clk	=>  Location: PIN_T8,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- TX_D	=>  Location: PIN_B12,	 I/O Standard: 2.5 V,	 Current Strength: Default


ARCHITECTURE structure OF UART_IN IS
SIGNAL gnd : std_logic := '0';
SIGNAL vcc : std_logic := '1';
SIGNAL unknown : std_logic := 'X';
SIGNAL devoe : std_logic := '1';
SIGNAL devclrn : std_logic := '1';
SIGNAL devpor : std_logic := '1';
SIGNAL ww_devoe : std_logic;
SIGNAL ww_devclrn : std_logic;
SIGNAL ww_devpor : std_logic;
SIGNAL ww_clk : std_logic;
SIGNAL ww_newclk : std_logic;
SIGNAL ww_TX_D : std_logic;
SIGNAL ww_RTS : std_logic;
SIGNAL ww_CTS : std_logic;
SIGNAL ww_BYTEOUT : std_logic_vector(7 DOWNTO 0);
SIGNAL ww_load : std_logic;
SIGNAL \change_CLK|newclk~clkctrl_INCLK_bus\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \clk~inputclkctrl_INCLK_bus\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \RTS~input_o\ : std_logic;
SIGNAL \newclk~output_o\ : std_logic;
SIGNAL \CTS~output_o\ : std_logic;
SIGNAL \BYTEOUT[0]~output_o\ : std_logic;
SIGNAL \BYTEOUT[1]~output_o\ : std_logic;
SIGNAL \BYTEOUT[2]~output_o\ : std_logic;
SIGNAL \BYTEOUT[3]~output_o\ : std_logic;
SIGNAL \BYTEOUT[4]~output_o\ : std_logic;
SIGNAL \BYTEOUT[5]~output_o\ : std_logic;
SIGNAL \BYTEOUT[6]~output_o\ : std_logic;
SIGNAL \BYTEOUT[7]~output_o\ : std_logic;
SIGNAL \load~output_o\ : std_logic;
SIGNAL \clk~input_o\ : std_logic;
SIGNAL \clk~inputclkctrl_outclk\ : std_logic;
SIGNAL \change_CLK|Add0~0_combout\ : std_logic;
SIGNAL \change_CLK|Add0~1\ : std_logic;
SIGNAL \change_CLK|Add0~2_combout\ : std_logic;
SIGNAL \change_CLK|Add0~3\ : std_logic;
SIGNAL \change_CLK|Add0~4_combout\ : std_logic;
SIGNAL \change_CLK|count~2_combout\ : std_logic;
SIGNAL \change_CLK|Add0~5\ : std_logic;
SIGNAL \change_CLK|Add0~6_combout\ : std_logic;
SIGNAL \change_CLK|count~7_combout\ : std_logic;
SIGNAL \change_CLK|Add0~7\ : std_logic;
SIGNAL \change_CLK|Add0~8_combout\ : std_logic;
SIGNAL \change_CLK|count~4_combout\ : std_logic;
SIGNAL \change_CLK|Add0~9\ : std_logic;
SIGNAL \change_CLK|Add0~10_combout\ : std_logic;
SIGNAL \change_CLK|count~6_combout\ : std_logic;
SIGNAL \change_CLK|Add0~11\ : std_logic;
SIGNAL \change_CLK|Add0~12_combout\ : std_logic;
SIGNAL \change_CLK|count~1_combout\ : std_logic;
SIGNAL \change_CLK|newclk~2_combout\ : std_logic;
SIGNAL \change_CLK|Add0~19\ : std_logic;
SIGNAL \change_CLK|Add0~20_combout\ : std_logic;
SIGNAL \change_CLK|count~8_combout\ : std_logic;
SIGNAL \change_CLK|Add0~21\ : std_logic;
SIGNAL \change_CLK|Add0~22_combout\ : std_logic;
SIGNAL \change_CLK|count~10_combout\ : std_logic;
SIGNAL \change_CLK|Add0~23\ : std_logic;
SIGNAL \change_CLK|Add0~24_combout\ : std_logic;
SIGNAL \change_CLK|count~0_combout\ : std_logic;
SIGNAL \change_CLK|newclk~clkctrl_outclk\ : std_logic;
SIGNAL \TX_D~input_o\ : std_logic;
SIGNAL \count[0]~3_combout\ : std_logic;
SIGNAL \count[0]~0_combout\ : std_logic;
SIGNAL \Add0~1_combout\ : std_logic;
SIGNAL \count[3]~4_combout\ : std_logic;
SIGNAL \always0~0_combout\ : std_logic;
SIGNAL \always0~1_combout\ : std_logic;
SIGNAL \count[1]~2_combout\ : std_logic;
SIGNAL \Add0~0_combout\ : std_logic;
SIGNAL \count[2]~1_combout\ : std_logic;
SIGNAL \change~0_combout\ : std_logic;
SIGNAL \change~q\ : std_logic;
SIGNAL \change_CLK|newclk~3_combout\ : std_logic;
SIGNAL \change_CLK|Add0~13\ : std_logic;
SIGNAL \change_CLK|Add0~14_combout\ : std_logic;
SIGNAL \change_CLK|count~5_combout\ : std_logic;
SIGNAL \change_CLK|Add0~15\ : std_logic;
SIGNAL \change_CLK|Add0~16_combout\ : std_logic;
SIGNAL \change_CLK|count~3_combout\ : std_logic;
SIGNAL \change_CLK|Add0~17\ : std_logic;
SIGNAL \change_CLK|Add0~18_combout\ : std_logic;
SIGNAL \change_CLK|count~9_combout\ : std_logic;
SIGNAL \change_CLK|newclk~5_combout\ : std_logic;
SIGNAL \change_CLK|newclk~4_combout\ : std_logic;
SIGNAL \change_CLK|newclk~7_combout\ : std_logic;
SIGNAL \change_CLK|Add0~25\ : std_logic;
SIGNAL \change_CLK|Add0~26_combout\ : std_logic;
SIGNAL \change_CLK|count~11_combout\ : std_logic;
SIGNAL \change_CLK|Add0~27\ : std_logic;
SIGNAL \change_CLK|Add0~28_combout\ : std_logic;
SIGNAL \change_CLK|count~12_combout\ : std_logic;
SIGNAL \change_CLK|Add0~29\ : std_logic;
SIGNAL \change_CLK|Add0~30_combout\ : std_logic;
SIGNAL \change_CLK|count~13_combout\ : std_logic;
SIGNAL \change_CLK|newclk~6_combout\ : std_logic;
SIGNAL \change_CLK|newclk~8_combout\ : std_logic;
SIGNAL \change_CLK|newclk~q\ : std_logic;
SIGNAL \change_CLK|count\ : std_logic_vector(15 DOWNTO 0);
SIGNAL count : std_logic_vector(3 DOWNTO 0);

BEGIN

ww_clk <= clk;
newclk <= ww_newclk;
ww_TX_D <= TX_D;
ww_RTS <= RTS;
CTS <= ww_CTS;
BYTEOUT <= ww_BYTEOUT;
load <= ww_load;
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;

\change_CLK|newclk~clkctrl_INCLK_bus\ <= (vcc & vcc & vcc & \change_CLK|newclk~q\);

\clk~inputclkctrl_INCLK_bus\ <= (vcc & vcc & vcc & \clk~input_o\);

-- Location: IOOBUF_X29_Y34_N16
\newclk~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \change_CLK|newclk~q\,
	devoe => ww_devoe,
	o => \newclk~output_o\);

-- Location: IOOBUF_X40_Y34_N9
\CTS~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => VCC,
	devoe => ww_devoe,
	o => \CTS~output_o\);

-- Location: IOOBUF_X38_Y34_N16
\BYTEOUT[0]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => VCC,
	devoe => ww_devoe,
	o => \BYTEOUT[0]~output_o\);

-- Location: IOOBUF_X49_Y34_N2
\BYTEOUT[1]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => VCC,
	devoe => ww_devoe,
	o => \BYTEOUT[1]~output_o\);

-- Location: IOOBUF_X49_Y34_N9
\BYTEOUT[2]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \BYTEOUT[2]~output_o\);

-- Location: IOOBUF_X40_Y34_N2
\BYTEOUT[3]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \BYTEOUT[3]~output_o\);

-- Location: IOOBUF_X0_Y25_N9
\BYTEOUT[4]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \BYTEOUT[4]~output_o\);

-- Location: IOOBUF_X0_Y26_N16
\BYTEOUT[5]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \BYTEOUT[5]~output_o\);

-- Location: IOOBUF_X0_Y28_N9
\BYTEOUT[6]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => VCC,
	devoe => ww_devoe,
	o => \BYTEOUT[6]~output_o\);

-- Location: IOOBUF_X0_Y10_N23
\BYTEOUT[7]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => VCC,
	devoe => ww_devoe,
	o => \BYTEOUT[7]~output_o\);

-- Location: IOOBUF_X45_Y34_N9
\load~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \load~output_o\);

-- Location: IOIBUF_X27_Y0_N15
\clk~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_clk,
	o => \clk~input_o\);

-- Location: CLKCTRL_G19
\clk~inputclkctrl\ : cycloneive_clkctrl
-- pragma translate_off
GENERIC MAP (
	clock_type => "global clock",
	ena_register_mode => "none")
-- pragma translate_on
PORT MAP (
	inclk => \clk~inputclkctrl_INCLK_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	outclk => \clk~inputclkctrl_outclk\);

-- Location: LCCOMB_X34_Y32_N0
\change_CLK|Add0~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \change_CLK|Add0~0_combout\ = \change_CLK|count\(0) $ (VCC)
-- \change_CLK|Add0~1\ = CARRY(\change_CLK|count\(0))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011001111001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \change_CLK|count\(0),
	datad => VCC,
	combout => \change_CLK|Add0~0_combout\,
	cout => \change_CLK|Add0~1\);

-- Location: FF_X34_Y32_N1
\change_CLK|count[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \change_CLK|Add0~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \change_CLK|count\(0));

-- Location: LCCOMB_X34_Y32_N2
\change_CLK|Add0~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \change_CLK|Add0~2_combout\ = (\change_CLK|count\(1) & (!\change_CLK|Add0~1\)) # (!\change_CLK|count\(1) & ((\change_CLK|Add0~1\) # (GND)))
-- \change_CLK|Add0~3\ = CARRY((!\change_CLK|Add0~1\) # (!\change_CLK|count\(1)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \change_CLK|count\(1),
	datad => VCC,
	cin => \change_CLK|Add0~1\,
	combout => \change_CLK|Add0~2_combout\,
	cout => \change_CLK|Add0~3\);

-- Location: FF_X34_Y32_N3
\change_CLK|count[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \change_CLK|Add0~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \change_CLK|count\(1));

-- Location: LCCOMB_X34_Y32_N4
\change_CLK|Add0~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \change_CLK|Add0~4_combout\ = (\change_CLK|count\(2) & (\change_CLK|Add0~3\ $ (GND))) # (!\change_CLK|count\(2) & (!\change_CLK|Add0~3\ & VCC))
-- \change_CLK|Add0~5\ = CARRY((\change_CLK|count\(2) & !\change_CLK|Add0~3\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \change_CLK|count\(2),
	datad => VCC,
	cin => \change_CLK|Add0~3\,
	combout => \change_CLK|Add0~4_combout\,
	cout => \change_CLK|Add0~5\);

-- Location: LCCOMB_X36_Y32_N10
\change_CLK|count~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \change_CLK|count~2_combout\ = (\change_CLK|Add0~4_combout\ & ((!\change_CLK|newclk~3_combout\) # (!\change_CLK|newclk~7_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0010001010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \change_CLK|Add0~4_combout\,
	datab => \change_CLK|newclk~7_combout\,
	datad => \change_CLK|newclk~3_combout\,
	combout => \change_CLK|count~2_combout\);

-- Location: FF_X36_Y32_N11
\change_CLK|count[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \change_CLK|count~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \change_CLK|count\(2));

-- Location: LCCOMB_X34_Y32_N6
\change_CLK|Add0~6\ : cycloneive_lcell_comb
-- Equation(s):
-- \change_CLK|Add0~6_combout\ = (\change_CLK|count\(3) & (!\change_CLK|Add0~5\)) # (!\change_CLK|count\(3) & ((\change_CLK|Add0~5\) # (GND)))
-- \change_CLK|Add0~7\ = CARRY((!\change_CLK|Add0~5\) # (!\change_CLK|count\(3)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \change_CLK|count\(3),
	datad => VCC,
	cin => \change_CLK|Add0~5\,
	combout => \change_CLK|Add0~6_combout\,
	cout => \change_CLK|Add0~7\);

-- Location: LCCOMB_X35_Y32_N20
\change_CLK|count~7\ : cycloneive_lcell_comb
-- Equation(s):
-- \change_CLK|count~7_combout\ = (\change_CLK|Add0~6_combout\ & ((!\change_CLK|newclk~3_combout\) # (!\change_CLK|newclk~7_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \change_CLK|newclk~7_combout\,
	datac => \change_CLK|Add0~6_combout\,
	datad => \change_CLK|newclk~3_combout\,
	combout => \change_CLK|count~7_combout\);

-- Location: FF_X35_Y32_N21
\change_CLK|count[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \change_CLK|count~7_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \change_CLK|count\(3));

-- Location: LCCOMB_X34_Y32_N8
\change_CLK|Add0~8\ : cycloneive_lcell_comb
-- Equation(s):
-- \change_CLK|Add0~8_combout\ = (\change_CLK|count\(4) & (\change_CLK|Add0~7\ $ (GND))) # (!\change_CLK|count\(4) & (!\change_CLK|Add0~7\ & VCC))
-- \change_CLK|Add0~9\ = CARRY((\change_CLK|count\(4) & !\change_CLK|Add0~7\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \change_CLK|count\(4),
	datad => VCC,
	cin => \change_CLK|Add0~7\,
	combout => \change_CLK|Add0~8_combout\,
	cout => \change_CLK|Add0~9\);

-- Location: LCCOMB_X36_Y32_N24
\change_CLK|count~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \change_CLK|count~4_combout\ = (\change_CLK|Add0~8_combout\ & ((!\change_CLK|newclk~3_combout\) # (!\change_CLK|newclk~7_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \change_CLK|newclk~7_combout\,
	datac => \change_CLK|Add0~8_combout\,
	datad => \change_CLK|newclk~3_combout\,
	combout => \change_CLK|count~4_combout\);

-- Location: FF_X36_Y32_N25
\change_CLK|count[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \change_CLK|count~4_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \change_CLK|count\(4));

-- Location: LCCOMB_X34_Y32_N10
\change_CLK|Add0~10\ : cycloneive_lcell_comb
-- Equation(s):
-- \change_CLK|Add0~10_combout\ = (\change_CLK|count\(5) & (!\change_CLK|Add0~9\)) # (!\change_CLK|count\(5) & ((\change_CLK|Add0~9\) # (GND)))
-- \change_CLK|Add0~11\ = CARRY((!\change_CLK|Add0~9\) # (!\change_CLK|count\(5)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \change_CLK|count\(5),
	datad => VCC,
	cin => \change_CLK|Add0~9\,
	combout => \change_CLK|Add0~10_combout\,
	cout => \change_CLK|Add0~11\);

-- Location: LCCOMB_X35_Y32_N18
\change_CLK|count~6\ : cycloneive_lcell_comb
-- Equation(s):
-- \change_CLK|count~6_combout\ = (\change_CLK|Add0~10_combout\ & ((!\change_CLK|newclk~3_combout\) # (!\change_CLK|newclk~7_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0010001010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \change_CLK|Add0~10_combout\,
	datab => \change_CLK|newclk~7_combout\,
	datad => \change_CLK|newclk~3_combout\,
	combout => \change_CLK|count~6_combout\);

-- Location: FF_X35_Y32_N19
\change_CLK|count[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \change_CLK|count~6_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \change_CLK|count\(5));

-- Location: LCCOMB_X34_Y32_N12
\change_CLK|Add0~12\ : cycloneive_lcell_comb
-- Equation(s):
-- \change_CLK|Add0~12_combout\ = (\change_CLK|count\(6) & (\change_CLK|Add0~11\ $ (GND))) # (!\change_CLK|count\(6) & (!\change_CLK|Add0~11\ & VCC))
-- \change_CLK|Add0~13\ = CARRY((\change_CLK|count\(6) & !\change_CLK|Add0~11\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \change_CLK|count\(6),
	datad => VCC,
	cin => \change_CLK|Add0~11\,
	combout => \change_CLK|Add0~12_combout\,
	cout => \change_CLK|Add0~13\);

-- Location: LCCOMB_X36_Y32_N12
\change_CLK|count~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \change_CLK|count~1_combout\ = (\change_CLK|Add0~12_combout\ & ((!\change_CLK|newclk~3_combout\) # (!\change_CLK|newclk~7_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \change_CLK|newclk~7_combout\,
	datac => \change_CLK|Add0~12_combout\,
	datad => \change_CLK|newclk~3_combout\,
	combout => \change_CLK|count~1_combout\);

-- Location: FF_X36_Y32_N13
\change_CLK|count[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \change_CLK|count~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \change_CLK|count\(6));

-- Location: LCCOMB_X35_Y32_N12
\change_CLK|newclk~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \change_CLK|newclk~2_combout\ = (\change_CLK|count\(6) & (!\change_CLK|count\(8) & !\change_CLK|count\(2))) # (!\change_CLK|count\(6) & (\change_CLK|count\(8) & \change_CLK|count\(2)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011000000001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \change_CLK|count\(6),
	datac => \change_CLK|count\(8),
	datad => \change_CLK|count\(2),
	combout => \change_CLK|newclk~2_combout\);

-- Location: LCCOMB_X34_Y32_N18
\change_CLK|Add0~18\ : cycloneive_lcell_comb
-- Equation(s):
-- \change_CLK|Add0~18_combout\ = (\change_CLK|count\(9) & (!\change_CLK|Add0~17\)) # (!\change_CLK|count\(9) & ((\change_CLK|Add0~17\) # (GND)))
-- \change_CLK|Add0~19\ = CARRY((!\change_CLK|Add0~17\) # (!\change_CLK|count\(9)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \change_CLK|count\(9),
	datad => VCC,
	cin => \change_CLK|Add0~17\,
	combout => \change_CLK|Add0~18_combout\,
	cout => \change_CLK|Add0~19\);

-- Location: LCCOMB_X34_Y32_N20
\change_CLK|Add0~20\ : cycloneive_lcell_comb
-- Equation(s):
-- \change_CLK|Add0~20_combout\ = (\change_CLK|count\(10) & (\change_CLK|Add0~19\ $ (GND))) # (!\change_CLK|count\(10) & (!\change_CLK|Add0~19\ & VCC))
-- \change_CLK|Add0~21\ = CARRY((\change_CLK|count\(10) & !\change_CLK|Add0~19\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \change_CLK|count\(10),
	datad => VCC,
	cin => \change_CLK|Add0~19\,
	combout => \change_CLK|Add0~20_combout\,
	cout => \change_CLK|Add0~21\);

-- Location: LCCOMB_X35_Y32_N4
\change_CLK|count~8\ : cycloneive_lcell_comb
-- Equation(s):
-- \change_CLK|count~8_combout\ = (\change_CLK|Add0~20_combout\ & ((!\change_CLK|newclk~3_combout\) # (!\change_CLK|newclk~7_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000110011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \change_CLK|Add0~20_combout\,
	datac => \change_CLK|newclk~7_combout\,
	datad => \change_CLK|newclk~3_combout\,
	combout => \change_CLK|count~8_combout\);

-- Location: FF_X35_Y32_N5
\change_CLK|count[10]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \change_CLK|count~8_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \change_CLK|count\(10));

-- Location: LCCOMB_X34_Y32_N22
\change_CLK|Add0~22\ : cycloneive_lcell_comb
-- Equation(s):
-- \change_CLK|Add0~22_combout\ = (\change_CLK|count\(11) & (!\change_CLK|Add0~21\)) # (!\change_CLK|count\(11) & ((\change_CLK|Add0~21\) # (GND)))
-- \change_CLK|Add0~23\ = CARRY((!\change_CLK|Add0~21\) # (!\change_CLK|count\(11)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \change_CLK|count\(11),
	datad => VCC,
	cin => \change_CLK|Add0~21\,
	combout => \change_CLK|Add0~22_combout\,
	cout => \change_CLK|Add0~23\);

-- Location: LCCOMB_X35_Y32_N2
\change_CLK|count~10\ : cycloneive_lcell_comb
-- Equation(s):
-- \change_CLK|count~10_combout\ = (\change_CLK|Add0~22_combout\ & ((!\change_CLK|newclk~3_combout\) # (!\change_CLK|newclk~7_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \change_CLK|newclk~7_combout\,
	datac => \change_CLK|Add0~22_combout\,
	datad => \change_CLK|newclk~3_combout\,
	combout => \change_CLK|count~10_combout\);

-- Location: FF_X35_Y32_N3
\change_CLK|count[11]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \change_CLK|count~10_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \change_CLK|count\(11));

-- Location: LCCOMB_X34_Y32_N24
\change_CLK|Add0~24\ : cycloneive_lcell_comb
-- Equation(s):
-- \change_CLK|Add0~24_combout\ = (\change_CLK|count\(12) & (\change_CLK|Add0~23\ $ (GND))) # (!\change_CLK|count\(12) & (!\change_CLK|Add0~23\ & VCC))
-- \change_CLK|Add0~25\ = CARRY((\change_CLK|count\(12) & !\change_CLK|Add0~23\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \change_CLK|count\(12),
	datad => VCC,
	cin => \change_CLK|Add0~23\,
	combout => \change_CLK|Add0~24_combout\,
	cout => \change_CLK|Add0~25\);

-- Location: LCCOMB_X36_Y32_N28
\change_CLK|count~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \change_CLK|count~0_combout\ = (\change_CLK|Add0~24_combout\ & ((!\change_CLK|newclk~7_combout\) # (!\change_CLK|newclk~3_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \change_CLK|newclk~3_combout\,
	datac => \change_CLK|newclk~7_combout\,
	datad => \change_CLK|Add0~24_combout\,
	combout => \change_CLK|count~0_combout\);

-- Location: FF_X36_Y32_N29
\change_CLK|count[12]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \change_CLK|count~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \change_CLK|count\(12));

-- Location: CLKCTRL_G14
\change_CLK|newclk~clkctrl\ : cycloneive_clkctrl
-- pragma translate_off
GENERIC MAP (
	clock_type => "global clock",
	ena_register_mode => "none")
-- pragma translate_on
PORT MAP (
	inclk => \change_CLK|newclk~clkctrl_INCLK_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	outclk => \change_CLK|newclk~clkctrl_outclk\);

-- Location: IOIBUF_X43_Y34_N22
\TX_D~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_TX_D,
	o => \TX_D~input_o\);

-- Location: LCCOMB_X36_Y32_N30
\count[0]~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \count[0]~3_combout\ = count(0) $ (((\change~q\) # (!\TX_D~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000001111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \change~q\,
	datac => count(0),
	datad => \TX_D~input_o\,
	combout => \count[0]~3_combout\);

-- Location: FF_X36_Y32_N31
\count[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \change_CLK|newclk~clkctrl_outclk\,
	d => \count[0]~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => count(0));

-- Location: LCCOMB_X36_Y32_N16
\count[0]~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \count[0]~0_combout\ = (\TX_D~input_o\ & !\change~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \TX_D~input_o\,
	datad => \change~q\,
	combout => \count[0]~0_combout\);

-- Location: LCCOMB_X37_Y32_N2
\Add0~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add0~1_combout\ = count(3) $ (((count(1) & (count(2) & count(0)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110101010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => count(3),
	datab => count(1),
	datac => count(2),
	datad => count(0),
	combout => \Add0~1_combout\);

-- Location: LCCOMB_X37_Y32_N8
\count[3]~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \count[3]~4_combout\ = (\count[0]~0_combout\ & (((count(3))))) # (!\count[0]~0_combout\ & ((\Add0~1_combout\) # ((\always0~1_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111010111100100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \count[0]~0_combout\,
	datab => \Add0~1_combout\,
	datac => count(3),
	datad => \always0~1_combout\,
	combout => \count[3]~4_combout\);

-- Location: FF_X37_Y32_N9
\count[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \change_CLK|newclk~clkctrl_outclk\,
	d => \count[3]~4_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => count(3));

-- Location: LCCOMB_X36_Y32_N2
\always0~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \always0~0_combout\ = (!count(0) & (count(1) & ((\change~q\) # (!\TX_D~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000110100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \TX_D~input_o\,
	datab => \change~q\,
	datac => count(0),
	datad => count(1),
	combout => \always0~0_combout\);

-- Location: LCCOMB_X36_Y32_N14
\always0~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \always0~1_combout\ = (!count(2) & (count(3) & \always0~0_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => count(2),
	datac => count(3),
	datad => \always0~0_combout\,
	combout => \always0~1_combout\);

-- Location: LCCOMB_X36_Y32_N20
\count[1]~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \count[1]~2_combout\ = (\count[0]~0_combout\ & (((count(1))))) # (!\count[0]~0_combout\ & ((\always0~1_combout\) # (count(0) $ (count(1)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111001111010010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => count(0),
	datab => \count[0]~0_combout\,
	datac => count(1),
	datad => \always0~1_combout\,
	combout => \count[1]~2_combout\);

-- Location: FF_X36_Y32_N21
\count[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \change_CLK|newclk~clkctrl_outclk\,
	d => \count[1]~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => count(1));

-- Location: LCCOMB_X36_Y32_N22
\Add0~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add0~0_combout\ = count(2) $ (((count(0) & count(1))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => count(0),
	datac => count(2),
	datad => count(1),
	combout => \Add0~0_combout\);

-- Location: LCCOMB_X36_Y32_N26
\count[2]~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \count[2]~1_combout\ = (\count[0]~0_combout\ & (((count(2))))) # (!\count[0]~0_combout\ & (\Add0~0_combout\ & ((!\always0~1_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100000011100010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Add0~0_combout\,
	datab => \count[0]~0_combout\,
	datac => count(2),
	datad => \always0~1_combout\,
	combout => \count[2]~1_combout\);

-- Location: FF_X36_Y32_N27
\count[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \change_CLK|newclk~clkctrl_outclk\,
	d => \count[2]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => count(2));

-- Location: LCCOMB_X36_Y32_N0
\change~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \change~0_combout\ = \count[0]~0_combout\ $ (((count(2)) # ((!\always0~0_combout\) # (!count(3)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110001100110011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => count(2),
	datab => \count[0]~0_combout\,
	datac => count(3),
	datad => \always0~0_combout\,
	combout => \change~0_combout\);

-- Location: FF_X36_Y32_N1
change : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \change_CLK|newclk~clkctrl_outclk\,
	d => \change~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \change~q\);

-- Location: LCCOMB_X36_Y32_N18
\change_CLK|newclk~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \change_CLK|newclk~3_combout\ = (\change_CLK|newclk~2_combout\ & ((\change_CLK|count\(12) & (\change_CLK|count\(6) & \change~q\)) # (!\change_CLK|count\(12) & (!\change_CLK|count\(6) & !\change~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000000000010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \change_CLK|newclk~2_combout\,
	datab => \change_CLK|count\(12),
	datac => \change_CLK|count\(6),
	datad => \change~q\,
	combout => \change_CLK|newclk~3_combout\);

-- Location: LCCOMB_X34_Y32_N14
\change_CLK|Add0~14\ : cycloneive_lcell_comb
-- Equation(s):
-- \change_CLK|Add0~14_combout\ = (\change_CLK|count\(7) & (!\change_CLK|Add0~13\)) # (!\change_CLK|count\(7) & ((\change_CLK|Add0~13\) # (GND)))
-- \change_CLK|Add0~15\ = CARRY((!\change_CLK|Add0~13\) # (!\change_CLK|count\(7)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \change_CLK|count\(7),
	datad => VCC,
	cin => \change_CLK|Add0~13\,
	combout => \change_CLK|Add0~14_combout\,
	cout => \change_CLK|Add0~15\);

-- Location: LCCOMB_X36_Y32_N4
\change_CLK|count~5\ : cycloneive_lcell_comb
-- Equation(s):
-- \change_CLK|count~5_combout\ = (\change_CLK|Add0~14_combout\ & ((!\change_CLK|newclk~7_combout\) # (!\change_CLK|newclk~3_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \change_CLK|newclk~3_combout\,
	datac => \change_CLK|newclk~7_combout\,
	datad => \change_CLK|Add0~14_combout\,
	combout => \change_CLK|count~5_combout\);

-- Location: FF_X36_Y32_N5
\change_CLK|count[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \change_CLK|count~5_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \change_CLK|count\(7));

-- Location: LCCOMB_X34_Y32_N16
\change_CLK|Add0~16\ : cycloneive_lcell_comb
-- Equation(s):
-- \change_CLK|Add0~16_combout\ = (\change_CLK|count\(8) & (\change_CLK|Add0~15\ $ (GND))) # (!\change_CLK|count\(8) & (!\change_CLK|Add0~15\ & VCC))
-- \change_CLK|Add0~17\ = CARRY((\change_CLK|count\(8) & !\change_CLK|Add0~15\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \change_CLK|count\(8),
	datad => VCC,
	cin => \change_CLK|Add0~15\,
	combout => \change_CLK|Add0~16_combout\,
	cout => \change_CLK|Add0~17\);

-- Location: LCCOMB_X36_Y32_N6
\change_CLK|count~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \change_CLK|count~3_combout\ = (\change_CLK|Add0~16_combout\ & ((!\change_CLK|newclk~3_combout\) # (!\change_CLK|newclk~7_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \change_CLK|newclk~7_combout\,
	datac => \change_CLK|Add0~16_combout\,
	datad => \change_CLK|newclk~3_combout\,
	combout => \change_CLK|count~3_combout\);

-- Location: FF_X36_Y32_N7
\change_CLK|count[8]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \change_CLK|count~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \change_CLK|count\(8));

-- Location: LCCOMB_X35_Y32_N22
\change_CLK|count~9\ : cycloneive_lcell_comb
-- Equation(s):
-- \change_CLK|count~9_combout\ = (\change_CLK|Add0~18_combout\ & ((!\change_CLK|newclk~3_combout\) # (!\change_CLK|newclk~7_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000110011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \change_CLK|Add0~18_combout\,
	datac => \change_CLK|newclk~7_combout\,
	datad => \change_CLK|newclk~3_combout\,
	combout => \change_CLK|count~9_combout\);

-- Location: FF_X35_Y32_N23
\change_CLK|count[9]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \change_CLK|count~9_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \change_CLK|count\(9));

-- Location: LCCOMB_X35_Y32_N16
\change_CLK|newclk~5\ : cycloneive_lcell_comb
-- Equation(s):
-- \change_CLK|newclk~5_combout\ = (!\change_CLK|count\(9) & (\change_CLK|count\(10) & (!\change_CLK|count\(0) & !\change_CLK|count\(1))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \change_CLK|count\(9),
	datab => \change_CLK|count\(10),
	datac => \change_CLK|count\(0),
	datad => \change_CLK|count\(1),
	combout => \change_CLK|newclk~5_combout\);

-- Location: LCCOMB_X35_Y32_N6
\change_CLK|newclk~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \change_CLK|newclk~4_combout\ = (!\change_CLK|count\(5) & (!\change_CLK|count\(3) & (!\change_CLK|count\(7) & \change_CLK|count\(4))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \change_CLK|count\(5),
	datab => \change_CLK|count\(3),
	datac => \change_CLK|count\(7),
	datad => \change_CLK|count\(4),
	combout => \change_CLK|newclk~4_combout\);

-- Location: LCCOMB_X35_Y32_N28
\change_CLK|newclk~7\ : cycloneive_lcell_comb
-- Equation(s):
-- \change_CLK|newclk~7_combout\ = (\change_CLK|newclk~5_combout\ & (\change_CLK|newclk~6_combout\ & \change_CLK|newclk~4_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \change_CLK|newclk~5_combout\,
	datac => \change_CLK|newclk~6_combout\,
	datad => \change_CLK|newclk~4_combout\,
	combout => \change_CLK|newclk~7_combout\);

-- Location: LCCOMB_X34_Y32_N26
\change_CLK|Add0~26\ : cycloneive_lcell_comb
-- Equation(s):
-- \change_CLK|Add0~26_combout\ = (\change_CLK|count\(13) & (!\change_CLK|Add0~25\)) # (!\change_CLK|count\(13) & ((\change_CLK|Add0~25\) # (GND)))
-- \change_CLK|Add0~27\ = CARRY((!\change_CLK|Add0~25\) # (!\change_CLK|count\(13)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \change_CLK|count\(13),
	datad => VCC,
	cin => \change_CLK|Add0~25\,
	combout => \change_CLK|Add0~26_combout\,
	cout => \change_CLK|Add0~27\);

-- Location: LCCOMB_X35_Y32_N0
\change_CLK|count~11\ : cycloneive_lcell_comb
-- Equation(s):
-- \change_CLK|count~11_combout\ = (\change_CLK|Add0~26_combout\ & ((!\change_CLK|newclk~3_combout\) # (!\change_CLK|newclk~7_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \change_CLK|newclk~7_combout\,
	datac => \change_CLK|Add0~26_combout\,
	datad => \change_CLK|newclk~3_combout\,
	combout => \change_CLK|count~11_combout\);

-- Location: FF_X35_Y32_N1
\change_CLK|count[13]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \change_CLK|count~11_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \change_CLK|count\(13));

-- Location: LCCOMB_X34_Y32_N28
\change_CLK|Add0~28\ : cycloneive_lcell_comb
-- Equation(s):
-- \change_CLK|Add0~28_combout\ = (\change_CLK|count\(14) & (\change_CLK|Add0~27\ $ (GND))) # (!\change_CLK|count\(14) & (!\change_CLK|Add0~27\ & VCC))
-- \change_CLK|Add0~29\ = CARRY((\change_CLK|count\(14) & !\change_CLK|Add0~27\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \change_CLK|count\(14),
	datad => VCC,
	cin => \change_CLK|Add0~27\,
	combout => \change_CLK|Add0~28_combout\,
	cout => \change_CLK|Add0~29\);

-- Location: LCCOMB_X35_Y32_N10
\change_CLK|count~12\ : cycloneive_lcell_comb
-- Equation(s):
-- \change_CLK|count~12_combout\ = (\change_CLK|Add0~28_combout\ & ((!\change_CLK|newclk~3_combout\) # (!\change_CLK|newclk~7_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \change_CLK|newclk~7_combout\,
	datac => \change_CLK|Add0~28_combout\,
	datad => \change_CLK|newclk~3_combout\,
	combout => \change_CLK|count~12_combout\);

-- Location: FF_X35_Y32_N11
\change_CLK|count[14]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \change_CLK|count~12_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \change_CLK|count\(14));

-- Location: LCCOMB_X34_Y32_N30
\change_CLK|Add0~30\ : cycloneive_lcell_comb
-- Equation(s):
-- \change_CLK|Add0~30_combout\ = \change_CLK|Add0~29\ $ (\change_CLK|count\(15))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111111110000",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datad => \change_CLK|count\(15),
	cin => \change_CLK|Add0~29\,
	combout => \change_CLK|Add0~30_combout\);

-- Location: LCCOMB_X35_Y32_N24
\change_CLK|count~13\ : cycloneive_lcell_comb
-- Equation(s):
-- \change_CLK|count~13_combout\ = (\change_CLK|Add0~30_combout\ & ((!\change_CLK|newclk~7_combout\) # (!\change_CLK|newclk~3_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \change_CLK|newclk~3_combout\,
	datac => \change_CLK|newclk~7_combout\,
	datad => \change_CLK|Add0~30_combout\,
	combout => \change_CLK|count~13_combout\);

-- Location: FF_X35_Y32_N25
\change_CLK|count[15]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \change_CLK|count~13_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \change_CLK|count\(15));

-- Location: LCCOMB_X35_Y32_N26
\change_CLK|newclk~6\ : cycloneive_lcell_comb
-- Equation(s):
-- \change_CLK|newclk~6_combout\ = (!\change_CLK|count\(14) & (!\change_CLK|count\(15) & (!\change_CLK|count\(11) & !\change_CLK|count\(13))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \change_CLK|count\(14),
	datab => \change_CLK|count\(15),
	datac => \change_CLK|count\(11),
	datad => \change_CLK|count\(13),
	combout => \change_CLK|newclk~6_combout\);

-- Location: LCCOMB_X36_Y32_N8
\change_CLK|newclk~8\ : cycloneive_lcell_comb
-- Equation(s):
-- \change_CLK|newclk~8_combout\ = (\change_CLK|newclk~6_combout\ & (\change_CLK|newclk~4_combout\ & (\change_CLK|newclk~5_combout\ & \change_CLK|newclk~3_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \change_CLK|newclk~6_combout\,
	datab => \change_CLK|newclk~4_combout\,
	datac => \change_CLK|newclk~5_combout\,
	datad => \change_CLK|newclk~3_combout\,
	combout => \change_CLK|newclk~8_combout\);

-- Location: FF_X36_Y32_N9
\change_CLK|newclk\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \change_CLK|newclk~8_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \change_CLK|newclk~q\);

-- Location: IOIBUF_X51_Y34_N15
\RTS~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_RTS,
	o => \RTS~input_o\);

ww_newclk <= \newclk~output_o\;

ww_CTS <= \CTS~output_o\;

ww_BYTEOUT(0) <= \BYTEOUT[0]~output_o\;

ww_BYTEOUT(1) <= \BYTEOUT[1]~output_o\;

ww_BYTEOUT(2) <= \BYTEOUT[2]~output_o\;

ww_BYTEOUT(3) <= \BYTEOUT[3]~output_o\;

ww_BYTEOUT(4) <= \BYTEOUT[4]~output_o\;

ww_BYTEOUT(5) <= \BYTEOUT[5]~output_o\;

ww_BYTEOUT(6) <= \BYTEOUT[6]~output_o\;

ww_BYTEOUT(7) <= \BYTEOUT[7]~output_o\;

ww_load <= \load~output_o\;
END structure;


