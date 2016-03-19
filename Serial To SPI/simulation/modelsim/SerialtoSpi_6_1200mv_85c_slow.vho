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

-- DATE "03/18/2016 20:11:20"

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
	TX_D : IN std_logic;
	RTS : IN std_logic;
	CTS : OUT std_logic;
	BYTEOUT : OUT std_logic_vector(7 DOWNTO 0);
	load : OUT std_logic
	);
END UART_IN;

-- Design Ports Information
-- CTS	=>  Location: PIN_B11,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- BYTEOUT[0]	=>  Location: PIN_A15,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- BYTEOUT[1]	=>  Location: PIN_A13,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- BYTEOUT[2]	=>  Location: PIN_B13,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- BYTEOUT[3]	=>  Location: PIN_A11,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- BYTEOUT[4]	=>  Location: PIN_D1,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- BYTEOUT[5]	=>  Location: PIN_F3,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- BYTEOUT[6]	=>  Location: PIN_B1,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- BYTEOUT[7]	=>  Location: PIN_L3,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- load	=>  Location: PIN_L2,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- RTS	=>  Location: PIN_D11,	 I/O Standard: 2.5 V,	 Current Strength: Default
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
SIGNAL ww_TX_D : std_logic;
SIGNAL ww_RTS : std_logic;
SIGNAL ww_CTS : std_logic;
SIGNAL ww_BYTEOUT : std_logic_vector(7 DOWNTO 0);
SIGNAL ww_load : std_logic;
SIGNAL \change_clk|newclk~clkctrl_INCLK_bus\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \clk~inputclkctrl_INCLK_bus\ : std_logic_vector(3 DOWNTO 0);
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
SIGNAL \change_clk|Add0~0_combout\ : std_logic;
SIGNAL \change_clk|count~33_combout\ : std_logic;
SIGNAL \change_clk|Add0~1\ : std_logic;
SIGNAL \change_clk|Add0~2_combout\ : std_logic;
SIGNAL \change_clk|Add0~3\ : std_logic;
SIGNAL \change_clk|Add0~4_combout\ : std_logic;
SIGNAL \change_clk|count~24_combout\ : std_logic;
SIGNAL \change_clk|Add0~5\ : std_logic;
SIGNAL \change_clk|Add0~6_combout\ : std_logic;
SIGNAL \change_clk|count~31_combout\ : std_logic;
SIGNAL \change_clk|Add0~7\ : std_logic;
SIGNAL \change_clk|Add0~8_combout\ : std_logic;
SIGNAL \change_clk|count~28_combout\ : std_logic;
SIGNAL \change_clk|Add0~9\ : std_logic;
SIGNAL \change_clk|Add0~10_combout\ : std_logic;
SIGNAL \change_clk|count~30_combout\ : std_logic;
SIGNAL \change_clk|Add0~11\ : std_logic;
SIGNAL \change_clk|Add0~12_combout\ : std_logic;
SIGNAL \change_clk|count~27_combout\ : std_logic;
SIGNAL \change_clk|Add0~13\ : std_logic;
SIGNAL \change_clk|Add0~14_combout\ : std_logic;
SIGNAL \change_clk|count~29_combout\ : std_logic;
SIGNAL \change_clk|Add0~15\ : std_logic;
SIGNAL \change_clk|Add0~16_combout\ : std_logic;
SIGNAL \change_clk|count~25_combout\ : std_logic;
SIGNAL \change_clk|Add0~17\ : std_logic;
SIGNAL \change_clk|Add0~18_combout\ : std_logic;
SIGNAL \change_clk|count~34_combout\ : std_logic;
SIGNAL \change_clk|Add0~19\ : std_logic;
SIGNAL \change_clk|Add0~20_combout\ : std_logic;
SIGNAL \change_clk|count~32_combout\ : std_logic;
SIGNAL \change_clk|Add0~21\ : std_logic;
SIGNAL \change_clk|Add0~22_combout\ : std_logic;
SIGNAL \change_clk|count~35_combout\ : std_logic;
SIGNAL \change_clk|Add0~23\ : std_logic;
SIGNAL \change_clk|Add0~24_combout\ : std_logic;
SIGNAL \change_clk|count~26_combout\ : std_logic;
SIGNAL \change_clk|newclk~0_combout\ : std_logic;
SIGNAL \RTS~input_o\ : std_logic;
SIGNAL \count~6_combout\ : std_logic;
SIGNAL \count~7_combout\ : std_logic;
SIGNAL \Add0~0_combout\ : std_logic;
SIGNAL \count~9_combout\ : std_logic;
SIGNAL \count~8_combout\ : std_logic;
SIGNAL \always0~0_combout\ : std_logic;
SIGNAL \change~q\ : std_logic;
SIGNAL \change_clk|newclk~1_combout\ : std_logic;
SIGNAL \change_clk|Add0~25\ : std_logic;
SIGNAL \change_clk|Add0~26_combout\ : std_logic;
SIGNAL \change_clk|count~36_combout\ : std_logic;
SIGNAL \change_clk|Add0~27\ : std_logic;
SIGNAL \change_clk|Add0~28_combout\ : std_logic;
SIGNAL \change_clk|count~37_combout\ : std_logic;
SIGNAL \change_clk|Add0~29\ : std_logic;
SIGNAL \change_clk|Add0~30_combout\ : std_logic;
SIGNAL \change_clk|count~38_combout\ : std_logic;
SIGNAL \change_clk|Add0~31\ : std_logic;
SIGNAL \change_clk|Add0~32_combout\ : std_logic;
SIGNAL \change_clk|count~39_combout\ : std_logic;
SIGNAL \change_clk|Add0~33\ : std_logic;
SIGNAL \change_clk|Add0~34_combout\ : std_logic;
SIGNAL \change_clk|count~40_combout\ : std_logic;
SIGNAL \change_clk|Add0~35\ : std_logic;
SIGNAL \change_clk|Add0~36_combout\ : std_logic;
SIGNAL \change_clk|count~41_combout\ : std_logic;
SIGNAL \change_clk|Add0~37\ : std_logic;
SIGNAL \change_clk|Add0~38_combout\ : std_logic;
SIGNAL \change_clk|count~42_combout\ : std_logic;
SIGNAL \change_clk|newclk~5_combout\ : std_logic;
SIGNAL \change_clk|newclk~3_combout\ : std_logic;
SIGNAL \change_clk|newclk~4_combout\ : std_logic;
SIGNAL \change_clk|newclk~2_combout\ : std_logic;
SIGNAL \change_clk|newclk~6_combout\ : std_logic;
SIGNAL \change_clk|Add0~39\ : std_logic;
SIGNAL \change_clk|Add0~40_combout\ : std_logic;
SIGNAL \change_clk|count~43_combout\ : std_logic;
SIGNAL \change_clk|Add0~41\ : std_logic;
SIGNAL \change_clk|Add0~42_combout\ : std_logic;
SIGNAL \change_clk|count~44_combout\ : std_logic;
SIGNAL \change_clk|Add0~43\ : std_logic;
SIGNAL \change_clk|Add0~44_combout\ : std_logic;
SIGNAL \change_clk|count~45_combout\ : std_logic;
SIGNAL \change_clk|Add0~45\ : std_logic;
SIGNAL \change_clk|Add0~46_combout\ : std_logic;
SIGNAL \change_clk|count~46_combout\ : std_logic;
SIGNAL \change_clk|Add0~47\ : std_logic;
SIGNAL \change_clk|Add0~48_combout\ : std_logic;
SIGNAL \change_clk|count~47_combout\ : std_logic;
SIGNAL \change_clk|Add0~49\ : std_logic;
SIGNAL \change_clk|Add0~50_combout\ : std_logic;
SIGNAL \change_clk|count~48_combout\ : std_logic;
SIGNAL \change_clk|Add0~51\ : std_logic;
SIGNAL \change_clk|Add0~52_combout\ : std_logic;
SIGNAL \change_clk|count~49_combout\ : std_logic;
SIGNAL \change_clk|Add0~53\ : std_logic;
SIGNAL \change_clk|Add0~54_combout\ : std_logic;
SIGNAL \change_clk|count~50_combout\ : std_logic;
SIGNAL \change_clk|newclk~8_combout\ : std_logic;
SIGNAL \change_clk|Add0~55\ : std_logic;
SIGNAL \change_clk|Add0~56_combout\ : std_logic;
SIGNAL \change_clk|count~51_combout\ : std_logic;
SIGNAL \change_clk|Add0~57\ : std_logic;
SIGNAL \change_clk|Add0~58_combout\ : std_logic;
SIGNAL \change_clk|count~52_combout\ : std_logic;
SIGNAL \change_clk|Add0~59\ : std_logic;
SIGNAL \change_clk|Add0~60_combout\ : std_logic;
SIGNAL \change_clk|count~53_combout\ : std_logic;
SIGNAL \change_clk|Add0~61\ : std_logic;
SIGNAL \change_clk|Add0~62_combout\ : std_logic;
SIGNAL \change_clk|count~54_combout\ : std_logic;
SIGNAL \change_clk|newclk~9_combout\ : std_logic;
SIGNAL \change_clk|newclk~7_combout\ : std_logic;
SIGNAL \change_clk|newclk~10_combout\ : std_logic;
SIGNAL \change_clk|newclk~11_combout\ : std_logic;
SIGNAL \change_clk|newclk~q\ : std_logic;
SIGNAL \change_clk|newclk~clkctrl_outclk\ : std_logic;
SIGNAL \CTS~reg0feeder_combout\ : std_logic;
SIGNAL \CTS~reg0_q\ : std_logic;
SIGNAL \TX_D~input_o\ : std_logic;
SIGNAL \data_in[0]~feeder_combout\ : std_logic;
SIGNAL \data_in[1]~feeder_combout\ : std_logic;
SIGNAL \data_in[5]~feeder_combout\ : std_logic;
SIGNAL \data_in[6]~feeder_combout\ : std_logic;
SIGNAL \data_in[7]~feeder_combout\ : std_logic;
SIGNAL \data_in[8]~feeder_combout\ : std_logic;
SIGNAL \data_in[9]~feeder_combout\ : std_logic;
SIGNAL \always0~1_combout\ : std_logic;
SIGNAL \BYTEOUT[0]~0_combout\ : std_logic;
SIGNAL \BYTEOUT[0]~reg0_q\ : std_logic;
SIGNAL \BYTEOUT[1]~1_combout\ : std_logic;
SIGNAL \BYTEOUT[1]~reg0_q\ : std_logic;
SIGNAL \BYTEOUT[2]~2_combout\ : std_logic;
SIGNAL \BYTEOUT[2]~reg0_q\ : std_logic;
SIGNAL \BYTEOUT[3]~3_combout\ : std_logic;
SIGNAL \BYTEOUT[3]~reg0_q\ : std_logic;
SIGNAL \BYTEOUT[4]~reg0_q\ : std_logic;
SIGNAL \BYTEOUT[5]~reg0feeder_combout\ : std_logic;
SIGNAL \BYTEOUT[5]~reg0_q\ : std_logic;
SIGNAL \BYTEOUT[6]~reg0feeder_combout\ : std_logic;
SIGNAL \BYTEOUT[6]~reg0_q\ : std_logic;
SIGNAL \BYTEOUT[7]~reg0feeder_combout\ : std_logic;
SIGNAL \BYTEOUT[7]~reg0_q\ : std_logic;
SIGNAL count : std_logic_vector(3 DOWNTO 0);
SIGNAL data_in : std_logic_vector(9 DOWNTO 0);
SIGNAL \change_clk|count\ : std_logic_vector(31 DOWNTO 0);
SIGNAL \change_clk|ALT_INV_newclk~clkctrl_outclk\ : std_logic;
SIGNAL \ALT_INV_always0~0_combout\ : std_logic;

BEGIN

ww_clk <= clk;
ww_TX_D <= TX_D;
ww_RTS <= RTS;
CTS <= ww_CTS;
BYTEOUT <= ww_BYTEOUT;
load <= ww_load;
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;

\change_clk|newclk~clkctrl_INCLK_bus\ <= (vcc & vcc & vcc & \change_clk|newclk~q\);

\clk~inputclkctrl_INCLK_bus\ <= (vcc & vcc & vcc & \clk~input_o\);
\change_clk|ALT_INV_newclk~clkctrl_outclk\ <= NOT \change_clk|newclk~clkctrl_outclk\;
\ALT_INV_always0~0_combout\ <= NOT \always0~0_combout\;

-- Location: IOOBUF_X40_Y34_N9
\CTS~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \CTS~reg0_q\,
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
	i => \BYTEOUT[0]~reg0_q\,
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
	i => \BYTEOUT[1]~reg0_q\,
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
	i => \BYTEOUT[2]~reg0_q\,
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
	i => \BYTEOUT[3]~reg0_q\,
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
	i => \BYTEOUT[4]~reg0_q\,
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
	i => \BYTEOUT[5]~reg0_q\,
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
	i => \BYTEOUT[6]~reg0_q\,
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
	i => \BYTEOUT[7]~reg0_q\,
	devoe => ww_devoe,
	o => \BYTEOUT[7]~output_o\);

-- Location: IOOBUF_X0_Y11_N2
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

-- Location: LCCOMB_X46_Y30_N0
\change_clk|Add0~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \change_clk|Add0~0_combout\ = \change_clk|count\(0) $ (VCC)
-- \change_clk|Add0~1\ = CARRY(\change_clk|count\(0))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011001111001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \change_clk|count\(0),
	datad => VCC,
	combout => \change_clk|Add0~0_combout\,
	cout => \change_clk|Add0~1\);

-- Location: LCCOMB_X45_Y30_N26
\change_clk|count~33\ : cycloneive_lcell_comb
-- Equation(s):
-- \change_clk|count~33_combout\ = \change_clk|Add0~0_combout\ $ (((\change_clk|newclk~6_combout\ & (\change_clk|newclk~10_combout\ & \change_clk|newclk~1_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0111100011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \change_clk|newclk~6_combout\,
	datab => \change_clk|newclk~10_combout\,
	datac => \change_clk|Add0~0_combout\,
	datad => \change_clk|newclk~1_combout\,
	combout => \change_clk|count~33_combout\);

-- Location: FF_X46_Y30_N29
\change_clk|count[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \change_clk|count~33_combout\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \change_clk|count\(0));

-- Location: LCCOMB_X46_Y30_N2
\change_clk|Add0~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \change_clk|Add0~2_combout\ = (\change_clk|count\(1) & (!\change_clk|Add0~1\)) # (!\change_clk|count\(1) & ((\change_clk|Add0~1\) # (GND)))
-- \change_clk|Add0~3\ = CARRY((!\change_clk|Add0~1\) # (!\change_clk|count\(1)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \change_clk|count\(1),
	datad => VCC,
	cin => \change_clk|Add0~1\,
	combout => \change_clk|Add0~2_combout\,
	cout => \change_clk|Add0~3\);

-- Location: FF_X46_Y30_N3
\change_clk|count[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \change_clk|Add0~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \change_clk|count\(1));

-- Location: LCCOMB_X46_Y30_N4
\change_clk|Add0~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \change_clk|Add0~4_combout\ = (\change_clk|count\(2) & (\change_clk|Add0~3\ $ (GND))) # (!\change_clk|count\(2) & (!\change_clk|Add0~3\ & VCC))
-- \change_clk|Add0~5\ = CARRY((\change_clk|count\(2) & !\change_clk|Add0~3\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \change_clk|count\(2),
	datad => VCC,
	cin => \change_clk|Add0~3\,
	combout => \change_clk|Add0~4_combout\,
	cout => \change_clk|Add0~5\);

-- Location: LCCOMB_X45_Y30_N16
\change_clk|count~24\ : cycloneive_lcell_comb
-- Equation(s):
-- \change_clk|count~24_combout\ = (\change_clk|Add0~4_combout\ & (((!\change_clk|newclk~1_combout\) # (!\change_clk|newclk~6_combout\)) # (!\change_clk|newclk~10_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0010101010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \change_clk|Add0~4_combout\,
	datab => \change_clk|newclk~10_combout\,
	datac => \change_clk|newclk~6_combout\,
	datad => \change_clk|newclk~1_combout\,
	combout => \change_clk|count~24_combout\);

-- Location: FF_X46_Y30_N27
\change_clk|count[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \change_clk|count~24_combout\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \change_clk|count\(2));

-- Location: LCCOMB_X46_Y30_N6
\change_clk|Add0~6\ : cycloneive_lcell_comb
-- Equation(s):
-- \change_clk|Add0~6_combout\ = (\change_clk|count\(3) & (!\change_clk|Add0~5\)) # (!\change_clk|count\(3) & ((\change_clk|Add0~5\) # (GND)))
-- \change_clk|Add0~7\ = CARRY((!\change_clk|Add0~5\) # (!\change_clk|count\(3)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \change_clk|count\(3),
	datad => VCC,
	cin => \change_clk|Add0~5\,
	combout => \change_clk|Add0~6_combout\,
	cout => \change_clk|Add0~7\);

-- Location: LCCOMB_X45_Y30_N4
\change_clk|count~31\ : cycloneive_lcell_comb
-- Equation(s):
-- \change_clk|count~31_combout\ = (\change_clk|Add0~6_combout\ & (((!\change_clk|newclk~1_combout\) # (!\change_clk|newclk~6_combout\)) # (!\change_clk|newclk~10_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0010101010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \change_clk|Add0~6_combout\,
	datab => \change_clk|newclk~10_combout\,
	datac => \change_clk|newclk~6_combout\,
	datad => \change_clk|newclk~1_combout\,
	combout => \change_clk|count~31_combout\);

-- Location: FF_X46_Y30_N23
\change_clk|count[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \change_clk|count~31_combout\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \change_clk|count\(3));

-- Location: LCCOMB_X46_Y30_N8
\change_clk|Add0~8\ : cycloneive_lcell_comb
-- Equation(s):
-- \change_clk|Add0~8_combout\ = (\change_clk|count\(4) & (\change_clk|Add0~7\ $ (GND))) # (!\change_clk|count\(4) & (!\change_clk|Add0~7\ & VCC))
-- \change_clk|Add0~9\ = CARRY((\change_clk|count\(4) & !\change_clk|Add0~7\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \change_clk|count\(4),
	datad => VCC,
	cin => \change_clk|Add0~7\,
	combout => \change_clk|Add0~8_combout\,
	cout => \change_clk|Add0~9\);

-- Location: LCCOMB_X45_Y30_N6
\change_clk|count~28\ : cycloneive_lcell_comb
-- Equation(s):
-- \change_clk|count~28_combout\ = (\change_clk|Add0~8_combout\ & (((!\change_clk|newclk~1_combout\) # (!\change_clk|newclk~10_combout\)) # (!\change_clk|newclk~6_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0111000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \change_clk|newclk~6_combout\,
	datab => \change_clk|newclk~10_combout\,
	datac => \change_clk|Add0~8_combout\,
	datad => \change_clk|newclk~1_combout\,
	combout => \change_clk|count~28_combout\);

-- Location: FF_X46_Y30_N1
\change_clk|count[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \change_clk|count~28_combout\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \change_clk|count\(4));

-- Location: LCCOMB_X46_Y30_N10
\change_clk|Add0~10\ : cycloneive_lcell_comb
-- Equation(s):
-- \change_clk|Add0~10_combout\ = (\change_clk|count\(5) & (!\change_clk|Add0~9\)) # (!\change_clk|count\(5) & ((\change_clk|Add0~9\) # (GND)))
-- \change_clk|Add0~11\ = CARRY((!\change_clk|Add0~9\) # (!\change_clk|count\(5)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \change_clk|count\(5),
	datad => VCC,
	cin => \change_clk|Add0~9\,
	combout => \change_clk|Add0~10_combout\,
	cout => \change_clk|Add0~11\);

-- Location: LCCOMB_X45_Y30_N0
\change_clk|count~30\ : cycloneive_lcell_comb
-- Equation(s):
-- \change_clk|count~30_combout\ = (\change_clk|Add0~10_combout\ & (((!\change_clk|newclk~1_combout\) # (!\change_clk|newclk~10_combout\)) # (!\change_clk|newclk~6_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0111000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \change_clk|newclk~6_combout\,
	datab => \change_clk|newclk~10_combout\,
	datac => \change_clk|Add0~10_combout\,
	datad => \change_clk|newclk~1_combout\,
	combout => \change_clk|count~30_combout\);

-- Location: FF_X45_Y30_N1
\change_clk|count[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \change_clk|count~30_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \change_clk|count\(5));

-- Location: LCCOMB_X46_Y30_N12
\change_clk|Add0~12\ : cycloneive_lcell_comb
-- Equation(s):
-- \change_clk|Add0~12_combout\ = (\change_clk|count\(6) & (\change_clk|Add0~11\ $ (GND))) # (!\change_clk|count\(6) & (!\change_clk|Add0~11\ & VCC))
-- \change_clk|Add0~13\ = CARRY((\change_clk|count\(6) & !\change_clk|Add0~11\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \change_clk|count\(6),
	datad => VCC,
	cin => \change_clk|Add0~11\,
	combout => \change_clk|Add0~12_combout\,
	cout => \change_clk|Add0~13\);

-- Location: LCCOMB_X45_Y30_N14
\change_clk|count~27\ : cycloneive_lcell_comb
-- Equation(s):
-- \change_clk|count~27_combout\ = (\change_clk|Add0~12_combout\ & (((!\change_clk|newclk~1_combout\) # (!\change_clk|newclk~10_combout\)) # (!\change_clk|newclk~6_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0111000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \change_clk|newclk~6_combout\,
	datab => \change_clk|newclk~10_combout\,
	datac => \change_clk|Add0~12_combout\,
	datad => \change_clk|newclk~1_combout\,
	combout => \change_clk|count~27_combout\);

-- Location: FF_X45_Y30_N15
\change_clk|count[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \change_clk|count~27_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \change_clk|count\(6));

-- Location: LCCOMB_X46_Y30_N14
\change_clk|Add0~14\ : cycloneive_lcell_comb
-- Equation(s):
-- \change_clk|Add0~14_combout\ = (\change_clk|count\(7) & (!\change_clk|Add0~13\)) # (!\change_clk|count\(7) & ((\change_clk|Add0~13\) # (GND)))
-- \change_clk|Add0~15\ = CARRY((!\change_clk|Add0~13\) # (!\change_clk|count\(7)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \change_clk|count\(7),
	datad => VCC,
	cin => \change_clk|Add0~13\,
	combout => \change_clk|Add0~14_combout\,
	cout => \change_clk|Add0~15\);

-- Location: LCCOMB_X45_Y30_N22
\change_clk|count~29\ : cycloneive_lcell_comb
-- Equation(s):
-- \change_clk|count~29_combout\ = (\change_clk|Add0~14_combout\ & (((!\change_clk|newclk~1_combout\) # (!\change_clk|newclk~10_combout\)) # (!\change_clk|newclk~6_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0111000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \change_clk|newclk~6_combout\,
	datab => \change_clk|newclk~10_combout\,
	datac => \change_clk|Add0~14_combout\,
	datad => \change_clk|newclk~1_combout\,
	combout => \change_clk|count~29_combout\);

-- Location: FF_X45_Y30_N23
\change_clk|count[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \change_clk|count~29_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \change_clk|count\(7));

-- Location: LCCOMB_X46_Y30_N16
\change_clk|Add0~16\ : cycloneive_lcell_comb
-- Equation(s):
-- \change_clk|Add0~16_combout\ = (\change_clk|count\(8) & (\change_clk|Add0~15\ $ (GND))) # (!\change_clk|count\(8) & (!\change_clk|Add0~15\ & VCC))
-- \change_clk|Add0~17\ = CARRY((\change_clk|count\(8) & !\change_clk|Add0~15\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \change_clk|count\(8),
	datad => VCC,
	cin => \change_clk|Add0~15\,
	combout => \change_clk|Add0~16_combout\,
	cout => \change_clk|Add0~17\);

-- Location: LCCOMB_X45_Y30_N18
\change_clk|count~25\ : cycloneive_lcell_comb
-- Equation(s):
-- \change_clk|count~25_combout\ = (\change_clk|Add0~16_combout\ & (((!\change_clk|newclk~1_combout\) # (!\change_clk|newclk~10_combout\)) # (!\change_clk|newclk~6_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \change_clk|newclk~6_combout\,
	datab => \change_clk|newclk~10_combout\,
	datac => \change_clk|newclk~1_combout\,
	datad => \change_clk|Add0~16_combout\,
	combout => \change_clk|count~25_combout\);

-- Location: FF_X45_Y30_N19
\change_clk|count[8]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \change_clk|count~25_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \change_clk|count\(8));

-- Location: LCCOMB_X46_Y30_N18
\change_clk|Add0~18\ : cycloneive_lcell_comb
-- Equation(s):
-- \change_clk|Add0~18_combout\ = (\change_clk|count\(9) & (!\change_clk|Add0~17\)) # (!\change_clk|count\(9) & ((\change_clk|Add0~17\) # (GND)))
-- \change_clk|Add0~19\ = CARRY((!\change_clk|Add0~17\) # (!\change_clk|count\(9)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \change_clk|count\(9),
	datad => VCC,
	cin => \change_clk|Add0~17\,
	combout => \change_clk|Add0~18_combout\,
	cout => \change_clk|Add0~19\);

-- Location: LCCOMB_X47_Y30_N6
\change_clk|count~34\ : cycloneive_lcell_comb
-- Equation(s):
-- \change_clk|count~34_combout\ = (\change_clk|Add0~18_combout\ & (((!\change_clk|newclk~10_combout\) # (!\change_clk|newclk~1_combout\)) # (!\change_clk|newclk~6_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0010101010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \change_clk|Add0~18_combout\,
	datab => \change_clk|newclk~6_combout\,
	datac => \change_clk|newclk~1_combout\,
	datad => \change_clk|newclk~10_combout\,
	combout => \change_clk|count~34_combout\);

-- Location: FF_X47_Y30_N7
\change_clk|count[9]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \change_clk|count~34_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \change_clk|count\(9));

-- Location: LCCOMB_X46_Y30_N20
\change_clk|Add0~20\ : cycloneive_lcell_comb
-- Equation(s):
-- \change_clk|Add0~20_combout\ = (\change_clk|count\(10) & (\change_clk|Add0~19\ $ (GND))) # (!\change_clk|count\(10) & (!\change_clk|Add0~19\ & VCC))
-- \change_clk|Add0~21\ = CARRY((\change_clk|count\(10) & !\change_clk|Add0~19\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \change_clk|count\(10),
	datad => VCC,
	cin => \change_clk|Add0~19\,
	combout => \change_clk|Add0~20_combout\,
	cout => \change_clk|Add0~21\);

-- Location: LCCOMB_X47_Y30_N20
\change_clk|count~32\ : cycloneive_lcell_comb
-- Equation(s):
-- \change_clk|count~32_combout\ = (\change_clk|Add0~20_combout\ & (((!\change_clk|newclk~6_combout\) # (!\change_clk|newclk~1_combout\)) # (!\change_clk|newclk~10_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0100110011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \change_clk|newclk~10_combout\,
	datab => \change_clk|Add0~20_combout\,
	datac => \change_clk|newclk~1_combout\,
	datad => \change_clk|newclk~6_combout\,
	combout => \change_clk|count~32_combout\);

-- Location: FF_X47_Y30_N21
\change_clk|count[10]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \change_clk|count~32_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \change_clk|count\(10));

-- Location: LCCOMB_X46_Y30_N22
\change_clk|Add0~22\ : cycloneive_lcell_comb
-- Equation(s):
-- \change_clk|Add0~22_combout\ = (\change_clk|count\(11) & (!\change_clk|Add0~21\)) # (!\change_clk|count\(11) & ((\change_clk|Add0~21\) # (GND)))
-- \change_clk|Add0~23\ = CARRY((!\change_clk|Add0~21\) # (!\change_clk|count\(11)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \change_clk|count\(11),
	datad => VCC,
	cin => \change_clk|Add0~21\,
	combout => \change_clk|Add0~22_combout\,
	cout => \change_clk|Add0~23\);

-- Location: LCCOMB_X47_Y30_N10
\change_clk|count~35\ : cycloneive_lcell_comb
-- Equation(s):
-- \change_clk|count~35_combout\ = (\change_clk|Add0~22_combout\ & (((!\change_clk|newclk~6_combout\) # (!\change_clk|newclk~1_combout\)) # (!\change_clk|newclk~10_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0100110011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \change_clk|newclk~10_combout\,
	datab => \change_clk|Add0~22_combout\,
	datac => \change_clk|newclk~1_combout\,
	datad => \change_clk|newclk~6_combout\,
	combout => \change_clk|count~35_combout\);

-- Location: FF_X47_Y30_N11
\change_clk|count[11]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \change_clk|count~35_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \change_clk|count\(11));

-- Location: LCCOMB_X46_Y30_N24
\change_clk|Add0~24\ : cycloneive_lcell_comb
-- Equation(s):
-- \change_clk|Add0~24_combout\ = (\change_clk|count\(12) & (\change_clk|Add0~23\ $ (GND))) # (!\change_clk|count\(12) & (!\change_clk|Add0~23\ & VCC))
-- \change_clk|Add0~25\ = CARRY((\change_clk|count\(12) & !\change_clk|Add0~23\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \change_clk|count\(12),
	datad => VCC,
	cin => \change_clk|Add0~23\,
	combout => \change_clk|Add0~24_combout\,
	cout => \change_clk|Add0~25\);

-- Location: LCCOMB_X45_Y30_N20
\change_clk|count~26\ : cycloneive_lcell_comb
-- Equation(s):
-- \change_clk|count~26_combout\ = (\change_clk|Add0~24_combout\ & (((!\change_clk|newclk~6_combout\) # (!\change_clk|newclk~10_combout\)) # (!\change_clk|newclk~1_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0111000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \change_clk|newclk~1_combout\,
	datab => \change_clk|newclk~10_combout\,
	datac => \change_clk|Add0~24_combout\,
	datad => \change_clk|newclk~6_combout\,
	combout => \change_clk|count~26_combout\);

-- Location: FF_X45_Y30_N21
\change_clk|count[12]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \change_clk|count~26_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \change_clk|count\(12));

-- Location: LCCOMB_X47_Y30_N24
\change_clk|newclk~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \change_clk|newclk~0_combout\ = (\change_clk|count\(6) & (!\change_clk|count\(8) & \change_clk|count\(12))) # (!\change_clk|count\(6) & (\change_clk|count\(8) & !\change_clk|count\(12)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000110000110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \change_clk|count\(6),
	datac => \change_clk|count\(8),
	datad => \change_clk|count\(12),
	combout => \change_clk|newclk~0_combout\);

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

-- Location: LCCOMB_X45_Y31_N28
\count~6\ : cycloneive_lcell_comb
-- Equation(s):
-- \count~6_combout\ = (\RTS~input_o\ & (!count(0) & ((!count(3)) # (!count(2)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000010000001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => count(2),
	datab => \RTS~input_o\,
	datac => count(0),
	datad => count(3),
	combout => \count~6_combout\);

-- Location: FF_X45_Y31_N29
\count[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \change_clk|ALT_INV_newclk~clkctrl_outclk\,
	d => \count~6_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => count(0));

-- Location: LCCOMB_X45_Y31_N30
\count~7\ : cycloneive_lcell_comb
-- Equation(s):
-- \count~7_combout\ = (\always0~0_combout\ & (count(0) $ (count(1))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => count(0),
	datac => count(1),
	datad => \always0~0_combout\,
	combout => \count~7_combout\);

-- Location: FF_X45_Y31_N31
\count[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \change_clk|ALT_INV_newclk~clkctrl_outclk\,
	d => \count~7_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => count(1));

-- Location: LCCOMB_X45_Y31_N8
\Add0~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add0~0_combout\ = (count(1) & count(0))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => count(1),
	datad => count(0),
	combout => \Add0~0_combout\);

-- Location: LCCOMB_X45_Y30_N2
\count~9\ : cycloneive_lcell_comb
-- Equation(s):
-- \count~9_combout\ = (\RTS~input_o\ & ((count(2) & (!count(3) & \Add0~0_combout\)) # (!count(2) & (count(3)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0010100000100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \RTS~input_o\,
	datab => count(2),
	datac => count(3),
	datad => \Add0~0_combout\,
	combout => \count~9_combout\);

-- Location: FF_X45_Y30_N3
\count[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \change_clk|ALT_INV_newclk~clkctrl_outclk\,
	d => \count~9_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => count(3));

-- Location: LCCOMB_X45_Y30_N8
\count~8\ : cycloneive_lcell_comb
-- Equation(s):
-- \count~8_combout\ = (\RTS~input_o\ & ((count(2) & (!count(3) & !\Add0~0_combout\)) # (!count(2) & ((\Add0~0_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000101000100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \RTS~input_o\,
	datab => count(3),
	datac => count(2),
	datad => \Add0~0_combout\,
	combout => \count~8_combout\);

-- Location: FF_X45_Y30_N9
\count[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \change_clk|ALT_INV_newclk~clkctrl_outclk\,
	d => \count~8_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => count(2));

-- Location: LCCOMB_X45_Y30_N28
\always0~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \always0~0_combout\ = (\RTS~input_o\ & ((!count(3)) # (!count(2))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000101010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \RTS~input_o\,
	datac => count(2),
	datad => count(3),
	combout => \always0~0_combout\);

-- Location: FF_X45_Y30_N29
change : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \change_clk|ALT_INV_newclk~clkctrl_outclk\,
	d => \always0~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \change~q\);

-- Location: LCCOMB_X45_Y30_N24
\change_clk|newclk~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \change_clk|newclk~1_combout\ = (\change_clk|newclk~0_combout\ & ((\change_clk|count\(8) & (\change_clk|count\(2) & !\change~q\)) # (!\change_clk|count\(8) & (!\change_clk|count\(2) & \change~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001000010000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \change_clk|count\(8),
	datab => \change_clk|count\(2),
	datac => \change_clk|newclk~0_combout\,
	datad => \change~q\,
	combout => \change_clk|newclk~1_combout\);

-- Location: LCCOMB_X46_Y30_N26
\change_clk|Add0~26\ : cycloneive_lcell_comb
-- Equation(s):
-- \change_clk|Add0~26_combout\ = (\change_clk|count\(13) & (!\change_clk|Add0~25\)) # (!\change_clk|count\(13) & ((\change_clk|Add0~25\) # (GND)))
-- \change_clk|Add0~27\ = CARRY((!\change_clk|Add0~25\) # (!\change_clk|count\(13)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \change_clk|count\(13),
	datad => VCC,
	cin => \change_clk|Add0~25\,
	combout => \change_clk|Add0~26_combout\,
	cout => \change_clk|Add0~27\);

-- Location: LCCOMB_X47_Y30_N0
\change_clk|count~36\ : cycloneive_lcell_comb
-- Equation(s):
-- \change_clk|count~36_combout\ = (\change_clk|Add0~26_combout\ & (((!\change_clk|newclk~1_combout\) # (!\change_clk|newclk~6_combout\)) # (!\change_clk|newclk~10_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \change_clk|newclk~10_combout\,
	datab => \change_clk|newclk~6_combout\,
	datac => \change_clk|newclk~1_combout\,
	datad => \change_clk|Add0~26_combout\,
	combout => \change_clk|count~36_combout\);

-- Location: FF_X47_Y30_N1
\change_clk|count[13]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \change_clk|count~36_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \change_clk|count\(13));

-- Location: LCCOMB_X46_Y30_N28
\change_clk|Add0~28\ : cycloneive_lcell_comb
-- Equation(s):
-- \change_clk|Add0~28_combout\ = (\change_clk|count\(14) & (\change_clk|Add0~27\ $ (GND))) # (!\change_clk|count\(14) & (!\change_clk|Add0~27\ & VCC))
-- \change_clk|Add0~29\ = CARRY((\change_clk|count\(14) & !\change_clk|Add0~27\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \change_clk|count\(14),
	datad => VCC,
	cin => \change_clk|Add0~27\,
	combout => \change_clk|Add0~28_combout\,
	cout => \change_clk|Add0~29\);

-- Location: LCCOMB_X47_Y30_N14
\change_clk|count~37\ : cycloneive_lcell_comb
-- Equation(s):
-- \change_clk|count~37_combout\ = (\change_clk|Add0~28_combout\ & (((!\change_clk|newclk~1_combout\) # (!\change_clk|newclk~6_combout\)) # (!\change_clk|newclk~10_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \change_clk|newclk~10_combout\,
	datab => \change_clk|newclk~6_combout\,
	datac => \change_clk|newclk~1_combout\,
	datad => \change_clk|Add0~28_combout\,
	combout => \change_clk|count~37_combout\);

-- Location: FF_X47_Y30_N15
\change_clk|count[14]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \change_clk|count~37_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \change_clk|count\(14));

-- Location: LCCOMB_X46_Y30_N30
\change_clk|Add0~30\ : cycloneive_lcell_comb
-- Equation(s):
-- \change_clk|Add0~30_combout\ = (\change_clk|count\(15) & (!\change_clk|Add0~29\)) # (!\change_clk|count\(15) & ((\change_clk|Add0~29\) # (GND)))
-- \change_clk|Add0~31\ = CARRY((!\change_clk|Add0~29\) # (!\change_clk|count\(15)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \change_clk|count\(15),
	datad => VCC,
	cin => \change_clk|Add0~29\,
	combout => \change_clk|Add0~30_combout\,
	cout => \change_clk|Add0~31\);

-- Location: LCCOMB_X47_Y30_N4
\change_clk|count~38\ : cycloneive_lcell_comb
-- Equation(s):
-- \change_clk|count~38_combout\ = (\change_clk|Add0~30_combout\ & (((!\change_clk|newclk~6_combout\) # (!\change_clk|newclk~1_combout\)) # (!\change_clk|newclk~10_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0100110011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \change_clk|newclk~10_combout\,
	datab => \change_clk|Add0~30_combout\,
	datac => \change_clk|newclk~1_combout\,
	datad => \change_clk|newclk~6_combout\,
	combout => \change_clk|count~38_combout\);

-- Location: FF_X47_Y30_N5
\change_clk|count[15]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \change_clk|count~38_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \change_clk|count\(15));

-- Location: LCCOMB_X46_Y29_N0
\change_clk|Add0~32\ : cycloneive_lcell_comb
-- Equation(s):
-- \change_clk|Add0~32_combout\ = (\change_clk|count\(16) & (\change_clk|Add0~31\ $ (GND))) # (!\change_clk|count\(16) & (!\change_clk|Add0~31\ & VCC))
-- \change_clk|Add0~33\ = CARRY((\change_clk|count\(16) & !\change_clk|Add0~31\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \change_clk|count\(16),
	datad => VCC,
	cin => \change_clk|Add0~31\,
	combout => \change_clk|Add0~32_combout\,
	cout => \change_clk|Add0~33\);

-- Location: LCCOMB_X47_Y30_N8
\change_clk|count~39\ : cycloneive_lcell_comb
-- Equation(s):
-- \change_clk|count~39_combout\ = (\change_clk|Add0~32_combout\ & (((!\change_clk|newclk~10_combout\) # (!\change_clk|newclk~1_combout\)) # (!\change_clk|newclk~6_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0010101010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \change_clk|Add0~32_combout\,
	datab => \change_clk|newclk~6_combout\,
	datac => \change_clk|newclk~1_combout\,
	datad => \change_clk|newclk~10_combout\,
	combout => \change_clk|count~39_combout\);

-- Location: FF_X47_Y30_N9
\change_clk|count[16]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \change_clk|count~39_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \change_clk|count\(16));

-- Location: LCCOMB_X46_Y29_N2
\change_clk|Add0~34\ : cycloneive_lcell_comb
-- Equation(s):
-- \change_clk|Add0~34_combout\ = (\change_clk|count\(17) & (!\change_clk|Add0~33\)) # (!\change_clk|count\(17) & ((\change_clk|Add0~33\) # (GND)))
-- \change_clk|Add0~35\ = CARRY((!\change_clk|Add0~33\) # (!\change_clk|count\(17)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \change_clk|count\(17),
	datad => VCC,
	cin => \change_clk|Add0~33\,
	combout => \change_clk|Add0~34_combout\,
	cout => \change_clk|Add0~35\);

-- Location: LCCOMB_X47_Y30_N22
\change_clk|count~40\ : cycloneive_lcell_comb
-- Equation(s):
-- \change_clk|count~40_combout\ = (\change_clk|Add0~34_combout\ & (((!\change_clk|newclk~1_combout\) # (!\change_clk|newclk~6_combout\)) # (!\change_clk|newclk~10_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \change_clk|newclk~10_combout\,
	datab => \change_clk|newclk~6_combout\,
	datac => \change_clk|newclk~1_combout\,
	datad => \change_clk|Add0~34_combout\,
	combout => \change_clk|count~40_combout\);

-- Location: FF_X47_Y30_N23
\change_clk|count[17]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \change_clk|count~40_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \change_clk|count\(17));

-- Location: LCCOMB_X46_Y29_N4
\change_clk|Add0~36\ : cycloneive_lcell_comb
-- Equation(s):
-- \change_clk|Add0~36_combout\ = (\change_clk|count\(18) & (\change_clk|Add0~35\ $ (GND))) # (!\change_clk|count\(18) & (!\change_clk|Add0~35\ & VCC))
-- \change_clk|Add0~37\ = CARRY((\change_clk|count\(18) & !\change_clk|Add0~35\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \change_clk|count\(18),
	datad => VCC,
	cin => \change_clk|Add0~35\,
	combout => \change_clk|Add0~36_combout\,
	cout => \change_clk|Add0~37\);

-- Location: LCCOMB_X47_Y30_N16
\change_clk|count~41\ : cycloneive_lcell_comb
-- Equation(s):
-- \change_clk|count~41_combout\ = (\change_clk|Add0~36_combout\ & (((!\change_clk|newclk~1_combout\) # (!\change_clk|newclk~6_combout\)) # (!\change_clk|newclk~10_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \change_clk|newclk~10_combout\,
	datab => \change_clk|newclk~6_combout\,
	datac => \change_clk|newclk~1_combout\,
	datad => \change_clk|Add0~36_combout\,
	combout => \change_clk|count~41_combout\);

-- Location: FF_X47_Y30_N17
\change_clk|count[18]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \change_clk|count~41_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \change_clk|count\(18));

-- Location: LCCOMB_X46_Y29_N6
\change_clk|Add0~38\ : cycloneive_lcell_comb
-- Equation(s):
-- \change_clk|Add0~38_combout\ = (\change_clk|count\(19) & (!\change_clk|Add0~37\)) # (!\change_clk|count\(19) & ((\change_clk|Add0~37\) # (GND)))
-- \change_clk|Add0~39\ = CARRY((!\change_clk|Add0~37\) # (!\change_clk|count\(19)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \change_clk|count\(19),
	datad => VCC,
	cin => \change_clk|Add0~37\,
	combout => \change_clk|Add0~38_combout\,
	cout => \change_clk|Add0~39\);

-- Location: LCCOMB_X47_Y30_N30
\change_clk|count~42\ : cycloneive_lcell_comb
-- Equation(s):
-- \change_clk|count~42_combout\ = (\change_clk|Add0~38_combout\ & (((!\change_clk|newclk~1_combout\) # (!\change_clk|newclk~6_combout\)) # (!\change_clk|newclk~10_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \change_clk|newclk~10_combout\,
	datab => \change_clk|newclk~6_combout\,
	datac => \change_clk|newclk~1_combout\,
	datad => \change_clk|Add0~38_combout\,
	combout => \change_clk|count~42_combout\);

-- Location: FF_X47_Y30_N31
\change_clk|count[19]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \change_clk|count~42_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \change_clk|count\(19));

-- Location: LCCOMB_X47_Y30_N12
\change_clk|newclk~5\ : cycloneive_lcell_comb
-- Equation(s):
-- \change_clk|newclk~5_combout\ = (!\change_clk|count\(19) & (!\change_clk|count\(16) & (!\change_clk|count\(17) & !\change_clk|count\(18))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \change_clk|count\(19),
	datab => \change_clk|count\(16),
	datac => \change_clk|count\(17),
	datad => \change_clk|count\(18),
	combout => \change_clk|newclk~5_combout\);

-- Location: LCCOMB_X47_Y30_N28
\change_clk|newclk~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \change_clk|newclk~3_combout\ = (!\change_clk|count\(9) & (\change_clk|count\(10) & (!\change_clk|count\(0) & !\change_clk|count\(1))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \change_clk|count\(9),
	datab => \change_clk|count\(10),
	datac => \change_clk|count\(0),
	datad => \change_clk|count\(1),
	combout => \change_clk|newclk~3_combout\);

-- Location: LCCOMB_X47_Y30_N26
\change_clk|newclk~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \change_clk|newclk~4_combout\ = (!\change_clk|count\(11) & (!\change_clk|count\(14) & (!\change_clk|count\(15) & !\change_clk|count\(13))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \change_clk|count\(11),
	datab => \change_clk|count\(14),
	datac => \change_clk|count\(15),
	datad => \change_clk|count\(13),
	combout => \change_clk|newclk~4_combout\);

-- Location: LCCOMB_X47_Y30_N2
\change_clk|newclk~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \change_clk|newclk~2_combout\ = (\change_clk|count\(4) & (!\change_clk|count\(3) & (!\change_clk|count\(7) & !\change_clk|count\(5))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \change_clk|count\(4),
	datab => \change_clk|count\(3),
	datac => \change_clk|count\(7),
	datad => \change_clk|count\(5),
	combout => \change_clk|newclk~2_combout\);

-- Location: LCCOMB_X47_Y30_N18
\change_clk|newclk~6\ : cycloneive_lcell_comb
-- Equation(s):
-- \change_clk|newclk~6_combout\ = (\change_clk|newclk~5_combout\ & (\change_clk|newclk~3_combout\ & (\change_clk|newclk~4_combout\ & \change_clk|newclk~2_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \change_clk|newclk~5_combout\,
	datab => \change_clk|newclk~3_combout\,
	datac => \change_clk|newclk~4_combout\,
	datad => \change_clk|newclk~2_combout\,
	combout => \change_clk|newclk~6_combout\);

-- Location: LCCOMB_X46_Y29_N8
\change_clk|Add0~40\ : cycloneive_lcell_comb
-- Equation(s):
-- \change_clk|Add0~40_combout\ = (\change_clk|count\(20) & (\change_clk|Add0~39\ $ (GND))) # (!\change_clk|count\(20) & (!\change_clk|Add0~39\ & VCC))
-- \change_clk|Add0~41\ = CARRY((\change_clk|count\(20) & !\change_clk|Add0~39\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \change_clk|count\(20),
	datad => VCC,
	cin => \change_clk|Add0~39\,
	combout => \change_clk|Add0~40_combout\,
	cout => \change_clk|Add0~41\);

-- Location: LCCOMB_X45_Y29_N16
\change_clk|count~43\ : cycloneive_lcell_comb
-- Equation(s):
-- \change_clk|count~43_combout\ = (\change_clk|Add0~40_combout\ & (((!\change_clk|newclk~1_combout\) # (!\change_clk|newclk~10_combout\)) # (!\change_clk|newclk~6_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \change_clk|newclk~6_combout\,
	datab => \change_clk|newclk~10_combout\,
	datac => \change_clk|newclk~1_combout\,
	datad => \change_clk|Add0~40_combout\,
	combout => \change_clk|count~43_combout\);

-- Location: FF_X45_Y29_N17
\change_clk|count[20]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \change_clk|count~43_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \change_clk|count\(20));

-- Location: LCCOMB_X46_Y29_N10
\change_clk|Add0~42\ : cycloneive_lcell_comb
-- Equation(s):
-- \change_clk|Add0~42_combout\ = (\change_clk|count\(21) & (!\change_clk|Add0~41\)) # (!\change_clk|count\(21) & ((\change_clk|Add0~41\) # (GND)))
-- \change_clk|Add0~43\ = CARRY((!\change_clk|Add0~41\) # (!\change_clk|count\(21)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \change_clk|count\(21),
	datad => VCC,
	cin => \change_clk|Add0~41\,
	combout => \change_clk|Add0~42_combout\,
	cout => \change_clk|Add0~43\);

-- Location: LCCOMB_X45_Y29_N6
\change_clk|count~44\ : cycloneive_lcell_comb
-- Equation(s):
-- \change_clk|count~44_combout\ = (\change_clk|Add0~42_combout\ & (((!\change_clk|newclk~1_combout\) # (!\change_clk|newclk~10_combout\)) # (!\change_clk|newclk~6_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \change_clk|newclk~6_combout\,
	datab => \change_clk|newclk~10_combout\,
	datac => \change_clk|newclk~1_combout\,
	datad => \change_clk|Add0~42_combout\,
	combout => \change_clk|count~44_combout\);

-- Location: FF_X45_Y29_N7
\change_clk|count[21]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \change_clk|count~44_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \change_clk|count\(21));

-- Location: LCCOMB_X46_Y29_N12
\change_clk|Add0~44\ : cycloneive_lcell_comb
-- Equation(s):
-- \change_clk|Add0~44_combout\ = (\change_clk|count\(22) & (\change_clk|Add0~43\ $ (GND))) # (!\change_clk|count\(22) & (!\change_clk|Add0~43\ & VCC))
-- \change_clk|Add0~45\ = CARRY((\change_clk|count\(22) & !\change_clk|Add0~43\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \change_clk|count\(22),
	datad => VCC,
	cin => \change_clk|Add0~43\,
	combout => \change_clk|Add0~44_combout\,
	cout => \change_clk|Add0~45\);

-- Location: LCCOMB_X45_Y29_N20
\change_clk|count~45\ : cycloneive_lcell_comb
-- Equation(s):
-- \change_clk|count~45_combout\ = (\change_clk|Add0~44_combout\ & (((!\change_clk|newclk~10_combout\) # (!\change_clk|newclk~1_combout\)) # (!\change_clk|newclk~6_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0100110011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \change_clk|newclk~6_combout\,
	datab => \change_clk|Add0~44_combout\,
	datac => \change_clk|newclk~1_combout\,
	datad => \change_clk|newclk~10_combout\,
	combout => \change_clk|count~45_combout\);

-- Location: FF_X45_Y29_N21
\change_clk|count[22]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \change_clk|count~45_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \change_clk|count\(22));

-- Location: LCCOMB_X46_Y29_N14
\change_clk|Add0~46\ : cycloneive_lcell_comb
-- Equation(s):
-- \change_clk|Add0~46_combout\ = (\change_clk|count\(23) & (!\change_clk|Add0~45\)) # (!\change_clk|count\(23) & ((\change_clk|Add0~45\) # (GND)))
-- \change_clk|Add0~47\ = CARRY((!\change_clk|Add0~45\) # (!\change_clk|count\(23)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \change_clk|count\(23),
	datad => VCC,
	cin => \change_clk|Add0~45\,
	combout => \change_clk|Add0~46_combout\,
	cout => \change_clk|Add0~47\);

-- Location: LCCOMB_X45_Y29_N24
\change_clk|count~46\ : cycloneive_lcell_comb
-- Equation(s):
-- \change_clk|count~46_combout\ = (\change_clk|Add0~46_combout\ & (((!\change_clk|newclk~1_combout\) # (!\change_clk|newclk~10_combout\)) # (!\change_clk|newclk~6_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \change_clk|newclk~6_combout\,
	datab => \change_clk|newclk~10_combout\,
	datac => \change_clk|newclk~1_combout\,
	datad => \change_clk|Add0~46_combout\,
	combout => \change_clk|count~46_combout\);

-- Location: FF_X45_Y29_N25
\change_clk|count[23]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \change_clk|count~46_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \change_clk|count\(23));

-- Location: LCCOMB_X46_Y29_N16
\change_clk|Add0~48\ : cycloneive_lcell_comb
-- Equation(s):
-- \change_clk|Add0~48_combout\ = (\change_clk|count\(24) & (\change_clk|Add0~47\ $ (GND))) # (!\change_clk|count\(24) & (!\change_clk|Add0~47\ & VCC))
-- \change_clk|Add0~49\ = CARRY((\change_clk|count\(24) & !\change_clk|Add0~47\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \change_clk|count\(24),
	datad => VCC,
	cin => \change_clk|Add0~47\,
	combout => \change_clk|Add0~48_combout\,
	cout => \change_clk|Add0~49\);

-- Location: LCCOMB_X45_Y29_N18
\change_clk|count~47\ : cycloneive_lcell_comb
-- Equation(s):
-- \change_clk|count~47_combout\ = (\change_clk|Add0~48_combout\ & (((!\change_clk|newclk~6_combout\) # (!\change_clk|newclk~1_combout\)) # (!\change_clk|newclk~10_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0010101010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \change_clk|Add0~48_combout\,
	datab => \change_clk|newclk~10_combout\,
	datac => \change_clk|newclk~1_combout\,
	datad => \change_clk|newclk~6_combout\,
	combout => \change_clk|count~47_combout\);

-- Location: FF_X45_Y29_N19
\change_clk|count[24]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \change_clk|count~47_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \change_clk|count\(24));

-- Location: LCCOMB_X46_Y29_N18
\change_clk|Add0~50\ : cycloneive_lcell_comb
-- Equation(s):
-- \change_clk|Add0~50_combout\ = (\change_clk|count\(25) & (!\change_clk|Add0~49\)) # (!\change_clk|count\(25) & ((\change_clk|Add0~49\) # (GND)))
-- \change_clk|Add0~51\ = CARRY((!\change_clk|Add0~49\) # (!\change_clk|count\(25)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \change_clk|count\(25),
	datad => VCC,
	cin => \change_clk|Add0~49\,
	combout => \change_clk|Add0~50_combout\,
	cout => \change_clk|Add0~51\);

-- Location: LCCOMB_X45_Y29_N22
\change_clk|count~48\ : cycloneive_lcell_comb
-- Equation(s):
-- \change_clk|count~48_combout\ = (\change_clk|Add0~50_combout\ & (((!\change_clk|newclk~6_combout\) # (!\change_clk|newclk~1_combout\)) # (!\change_clk|newclk~10_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0010101010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \change_clk|Add0~50_combout\,
	datab => \change_clk|newclk~10_combout\,
	datac => \change_clk|newclk~1_combout\,
	datad => \change_clk|newclk~6_combout\,
	combout => \change_clk|count~48_combout\);

-- Location: FF_X45_Y29_N23
\change_clk|count[25]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \change_clk|count~48_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \change_clk|count\(25));

-- Location: LCCOMB_X46_Y29_N20
\change_clk|Add0~52\ : cycloneive_lcell_comb
-- Equation(s):
-- \change_clk|Add0~52_combout\ = (\change_clk|count\(26) & (\change_clk|Add0~51\ $ (GND))) # (!\change_clk|count\(26) & (!\change_clk|Add0~51\ & VCC))
-- \change_clk|Add0~53\ = CARRY((\change_clk|count\(26) & !\change_clk|Add0~51\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \change_clk|count\(26),
	datad => VCC,
	cin => \change_clk|Add0~51\,
	combout => \change_clk|Add0~52_combout\,
	cout => \change_clk|Add0~53\);

-- Location: LCCOMB_X45_Y29_N12
\change_clk|count~49\ : cycloneive_lcell_comb
-- Equation(s):
-- \change_clk|count~49_combout\ = (\change_clk|Add0~52_combout\ & (((!\change_clk|newclk~6_combout\) # (!\change_clk|newclk~1_combout\)) # (!\change_clk|newclk~10_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0010101010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \change_clk|Add0~52_combout\,
	datab => \change_clk|newclk~10_combout\,
	datac => \change_clk|newclk~1_combout\,
	datad => \change_clk|newclk~6_combout\,
	combout => \change_clk|count~49_combout\);

-- Location: FF_X45_Y29_N13
\change_clk|count[26]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \change_clk|count~49_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \change_clk|count\(26));

-- Location: LCCOMB_X46_Y29_N22
\change_clk|Add0~54\ : cycloneive_lcell_comb
-- Equation(s):
-- \change_clk|Add0~54_combout\ = (\change_clk|count\(27) & (!\change_clk|Add0~53\)) # (!\change_clk|count\(27) & ((\change_clk|Add0~53\) # (GND)))
-- \change_clk|Add0~55\ = CARRY((!\change_clk|Add0~53\) # (!\change_clk|count\(27)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \change_clk|count\(27),
	datad => VCC,
	cin => \change_clk|Add0~53\,
	combout => \change_clk|Add0~54_combout\,
	cout => \change_clk|Add0~55\);

-- Location: LCCOMB_X45_Y30_N30
\change_clk|count~50\ : cycloneive_lcell_comb
-- Equation(s):
-- \change_clk|count~50_combout\ = (\change_clk|Add0~54_combout\ & (((!\change_clk|newclk~1_combout\) # (!\change_clk|newclk~10_combout\)) # (!\change_clk|newclk~6_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0111000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \change_clk|newclk~6_combout\,
	datab => \change_clk|newclk~10_combout\,
	datac => \change_clk|Add0~54_combout\,
	datad => \change_clk|newclk~1_combout\,
	combout => \change_clk|count~50_combout\);

-- Location: FF_X45_Y30_N31
\change_clk|count[27]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \change_clk|count~50_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \change_clk|count\(27));

-- Location: LCCOMB_X45_Y29_N10
\change_clk|newclk~8\ : cycloneive_lcell_comb
-- Equation(s):
-- \change_clk|newclk~8_combout\ = (!\change_clk|count\(25) & (!\change_clk|count\(24) & (!\change_clk|count\(27) & !\change_clk|count\(26))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \change_clk|count\(25),
	datab => \change_clk|count\(24),
	datac => \change_clk|count\(27),
	datad => \change_clk|count\(26),
	combout => \change_clk|newclk~8_combout\);

-- Location: LCCOMB_X46_Y29_N24
\change_clk|Add0~56\ : cycloneive_lcell_comb
-- Equation(s):
-- \change_clk|Add0~56_combout\ = (\change_clk|count\(28) & (\change_clk|Add0~55\ $ (GND))) # (!\change_clk|count\(28) & (!\change_clk|Add0~55\ & VCC))
-- \change_clk|Add0~57\ = CARRY((\change_clk|count\(28) & !\change_clk|Add0~55\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \change_clk|count\(28),
	datad => VCC,
	cin => \change_clk|Add0~55\,
	combout => \change_clk|Add0~56_combout\,
	cout => \change_clk|Add0~57\);

-- Location: LCCOMB_X45_Y30_N12
\change_clk|count~51\ : cycloneive_lcell_comb
-- Equation(s):
-- \change_clk|count~51_combout\ = (\change_clk|Add0~56_combout\ & (((!\change_clk|newclk~1_combout\) # (!\change_clk|newclk~10_combout\)) # (!\change_clk|newclk~6_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0111000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \change_clk|newclk~6_combout\,
	datab => \change_clk|newclk~10_combout\,
	datac => \change_clk|Add0~56_combout\,
	datad => \change_clk|newclk~1_combout\,
	combout => \change_clk|count~51_combout\);

-- Location: FF_X45_Y30_N13
\change_clk|count[28]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \change_clk|count~51_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \change_clk|count\(28));

-- Location: LCCOMB_X46_Y29_N26
\change_clk|Add0~58\ : cycloneive_lcell_comb
-- Equation(s):
-- \change_clk|Add0~58_combout\ = (\change_clk|count\(29) & (!\change_clk|Add0~57\)) # (!\change_clk|count\(29) & ((\change_clk|Add0~57\) # (GND)))
-- \change_clk|Add0~59\ = CARRY((!\change_clk|Add0~57\) # (!\change_clk|count\(29)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \change_clk|count\(29),
	datad => VCC,
	cin => \change_clk|Add0~57\,
	combout => \change_clk|Add0~58_combout\,
	cout => \change_clk|Add0~59\);

-- Location: LCCOMB_X45_Y30_N10
\change_clk|count~52\ : cycloneive_lcell_comb
-- Equation(s):
-- \change_clk|count~52_combout\ = (\change_clk|Add0~58_combout\ & (((!\change_clk|newclk~6_combout\) # (!\change_clk|newclk~10_combout\)) # (!\change_clk|newclk~1_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \change_clk|newclk~1_combout\,
	datab => \change_clk|newclk~10_combout\,
	datac => \change_clk|newclk~6_combout\,
	datad => \change_clk|Add0~58_combout\,
	combout => \change_clk|count~52_combout\);

-- Location: FF_X45_Y30_N11
\change_clk|count[29]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \change_clk|count~52_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \change_clk|count\(29));

-- Location: LCCOMB_X46_Y29_N28
\change_clk|Add0~60\ : cycloneive_lcell_comb
-- Equation(s):
-- \change_clk|Add0~60_combout\ = (\change_clk|count\(30) & (\change_clk|Add0~59\ $ (GND))) # (!\change_clk|count\(30) & (!\change_clk|Add0~59\ & VCC))
-- \change_clk|Add0~61\ = CARRY((\change_clk|count\(30) & !\change_clk|Add0~59\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \change_clk|count\(30),
	datad => VCC,
	cin => \change_clk|Add0~59\,
	combout => \change_clk|Add0~60_combout\,
	cout => \change_clk|Add0~61\);

-- Location: LCCOMB_X45_Y29_N14
\change_clk|count~53\ : cycloneive_lcell_comb
-- Equation(s):
-- \change_clk|count~53_combout\ = (\change_clk|Add0~60_combout\ & (((!\change_clk|newclk~1_combout\) # (!\change_clk|newclk~10_combout\)) # (!\change_clk|newclk~6_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \change_clk|newclk~6_combout\,
	datab => \change_clk|newclk~10_combout\,
	datac => \change_clk|newclk~1_combout\,
	datad => \change_clk|Add0~60_combout\,
	combout => \change_clk|count~53_combout\);

-- Location: FF_X45_Y29_N15
\change_clk|count[30]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \change_clk|count~53_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \change_clk|count\(30));

-- Location: LCCOMB_X46_Y29_N30
\change_clk|Add0~62\ : cycloneive_lcell_comb
-- Equation(s):
-- \change_clk|Add0~62_combout\ = \change_clk|count\(31) $ (\change_clk|Add0~61\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \change_clk|count\(31),
	cin => \change_clk|Add0~61\,
	combout => \change_clk|Add0~62_combout\);

-- Location: LCCOMB_X45_Y29_N26
\change_clk|count~54\ : cycloneive_lcell_comb
-- Equation(s):
-- \change_clk|count~54_combout\ = (\change_clk|Add0~62_combout\ & (((!\change_clk|newclk~1_combout\) # (!\change_clk|newclk~10_combout\)) # (!\change_clk|newclk~6_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \change_clk|newclk~6_combout\,
	datab => \change_clk|newclk~10_combout\,
	datac => \change_clk|newclk~1_combout\,
	datad => \change_clk|Add0~62_combout\,
	combout => \change_clk|count~54_combout\);

-- Location: FF_X45_Y29_N27
\change_clk|count[31]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \change_clk|count~54_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \change_clk|count\(31));

-- Location: LCCOMB_X45_Y29_N30
\change_clk|newclk~9\ : cycloneive_lcell_comb
-- Equation(s):
-- \change_clk|newclk~9_combout\ = (!\change_clk|count\(31) & (!\change_clk|count\(29) & (!\change_clk|count\(30) & !\change_clk|count\(28))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \change_clk|count\(31),
	datab => \change_clk|count\(29),
	datac => \change_clk|count\(30),
	datad => \change_clk|count\(28),
	combout => \change_clk|newclk~9_combout\);

-- Location: LCCOMB_X45_Y29_N28
\change_clk|newclk~7\ : cycloneive_lcell_comb
-- Equation(s):
-- \change_clk|newclk~7_combout\ = (!\change_clk|count\(21) & (!\change_clk|count\(23) & (!\change_clk|count\(22) & !\change_clk|count\(20))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \change_clk|count\(21),
	datab => \change_clk|count\(23),
	datac => \change_clk|count\(22),
	datad => \change_clk|count\(20),
	combout => \change_clk|newclk~7_combout\);

-- Location: LCCOMB_X45_Y29_N0
\change_clk|newclk~10\ : cycloneive_lcell_comb
-- Equation(s):
-- \change_clk|newclk~10_combout\ = (\change_clk|newclk~8_combout\ & (\change_clk|newclk~9_combout\ & \change_clk|newclk~7_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \change_clk|newclk~8_combout\,
	datac => \change_clk|newclk~9_combout\,
	datad => \change_clk|newclk~7_combout\,
	combout => \change_clk|newclk~10_combout\);

-- Location: LCCOMB_X45_Y29_N2
\change_clk|newclk~11\ : cycloneive_lcell_comb
-- Equation(s):
-- \change_clk|newclk~11_combout\ = (\change_clk|newclk~10_combout\ & (\change_clk|newclk~1_combout\ & \change_clk|newclk~6_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \change_clk|newclk~10_combout\,
	datac => \change_clk|newclk~1_combout\,
	datad => \change_clk|newclk~6_combout\,
	combout => \change_clk|newclk~11_combout\);

-- Location: FF_X45_Y29_N3
\change_clk|newclk\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \change_clk|newclk~11_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \change_clk|newclk~q\);

-- Location: CLKCTRL_G10
\change_clk|newclk~clkctrl\ : cycloneive_clkctrl
-- pragma translate_off
GENERIC MAP (
	clock_type => "global clock",
	ena_register_mode => "none")
-- pragma translate_on
PORT MAP (
	inclk => \change_clk|newclk~clkctrl_INCLK_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	outclk => \change_clk|newclk~clkctrl_outclk\);

-- Location: LCCOMB_X41_Y30_N4
\CTS~reg0feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \CTS~reg0feeder_combout\ = \always0~0_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \always0~0_combout\,
	combout => \CTS~reg0feeder_combout\);

-- Location: FF_X41_Y30_N5
\CTS~reg0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \change_clk|ALT_INV_newclk~clkctrl_outclk\,
	d => \CTS~reg0feeder_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \CTS~reg0_q\);

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

-- Location: LCCOMB_X44_Y30_N20
\data_in[0]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \data_in[0]~feeder_combout\ = \TX_D~input_o\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \TX_D~input_o\,
	combout => \data_in[0]~feeder_combout\);

-- Location: FF_X44_Y30_N21
\data_in[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \change_clk|ALT_INV_newclk~clkctrl_outclk\,
	d => \data_in[0]~feeder_combout\,
	ena => \always0~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => data_in(0));

-- Location: LCCOMB_X44_Y30_N24
\data_in[1]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \data_in[1]~feeder_combout\ = data_in(0)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => data_in(0),
	combout => \data_in[1]~feeder_combout\);

-- Location: FF_X44_Y30_N25
\data_in[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \change_clk|ALT_INV_newclk~clkctrl_outclk\,
	d => \data_in[1]~feeder_combout\,
	ena => \always0~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => data_in(1));

-- Location: FF_X46_Y30_N5
\data_in[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \change_clk|ALT_INV_newclk~clkctrl_outclk\,
	asdata => data_in(1),
	sload => VCC,
	ena => \always0~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => data_in(2));

-- Location: FF_X46_Y30_N17
\data_in[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \change_clk|ALT_INV_newclk~clkctrl_outclk\,
	asdata => data_in(2),
	sload => VCC,
	ena => \always0~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => data_in(3));

-- Location: FF_X46_Y30_N13
\data_in[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \change_clk|ALT_INV_newclk~clkctrl_outclk\,
	asdata => data_in(3),
	sload => VCC,
	ena => \always0~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => data_in(4));

-- Location: LCCOMB_X44_Y30_N26
\data_in[5]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \data_in[5]~feeder_combout\ = data_in(4)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => data_in(4),
	combout => \data_in[5]~feeder_combout\);

-- Location: FF_X44_Y30_N27
\data_in[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \change_clk|ALT_INV_newclk~clkctrl_outclk\,
	d => \data_in[5]~feeder_combout\,
	ena => \always0~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => data_in(5));

-- Location: LCCOMB_X44_Y30_N28
\data_in[6]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \data_in[6]~feeder_combout\ = data_in(5)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => data_in(5),
	combout => \data_in[6]~feeder_combout\);

-- Location: FF_X44_Y30_N29
\data_in[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \change_clk|ALT_INV_newclk~clkctrl_outclk\,
	d => \data_in[6]~feeder_combout\,
	ena => \always0~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => data_in(6));

-- Location: LCCOMB_X44_Y30_N14
\data_in[7]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \data_in[7]~feeder_combout\ = data_in(6)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => data_in(6),
	combout => \data_in[7]~feeder_combout\);

-- Location: FF_X44_Y30_N15
\data_in[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \change_clk|ALT_INV_newclk~clkctrl_outclk\,
	d => \data_in[7]~feeder_combout\,
	ena => \always0~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => data_in(7));

-- Location: LCCOMB_X44_Y30_N12
\data_in[8]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \data_in[8]~feeder_combout\ = data_in(7)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => data_in(7),
	combout => \data_in[8]~feeder_combout\);

-- Location: FF_X44_Y30_N13
\data_in[8]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \change_clk|ALT_INV_newclk~clkctrl_outclk\,
	d => \data_in[8]~feeder_combout\,
	ena => \always0~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => data_in(8));

-- Location: LCCOMB_X44_Y30_N10
\data_in[9]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \data_in[9]~feeder_combout\ = data_in(8)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => data_in(8),
	combout => \data_in[9]~feeder_combout\);

-- Location: FF_X44_Y30_N11
\data_in[9]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \change_clk|ALT_INV_newclk~clkctrl_outclk\,
	d => \data_in[9]~feeder_combout\,
	ena => \always0~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => data_in(9));

-- Location: LCCOMB_X44_Y30_N16
\always0~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \always0~1_combout\ = (!data_in(9) & data_in(0))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101010100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => data_in(9),
	datad => data_in(0),
	combout => \always0~1_combout\);

-- Location: LCCOMB_X44_Y30_N8
\BYTEOUT[0]~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \BYTEOUT[0]~0_combout\ = !\always0~1_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \always0~1_combout\,
	combout => \BYTEOUT[0]~0_combout\);

-- Location: FF_X44_Y30_N9
\BYTEOUT[0]~reg0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \change_clk|ALT_INV_newclk~clkctrl_outclk\,
	d => \BYTEOUT[0]~0_combout\,
	ena => \ALT_INV_always0~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \BYTEOUT[0]~reg0_q\);

-- Location: LCCOMB_X44_Y30_N6
\BYTEOUT[1]~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \BYTEOUT[1]~1_combout\ = !\always0~1_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \always0~1_combout\,
	combout => \BYTEOUT[1]~1_combout\);

-- Location: FF_X44_Y30_N7
\BYTEOUT[1]~reg0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \change_clk|ALT_INV_newclk~clkctrl_outclk\,
	d => \BYTEOUT[1]~1_combout\,
	ena => \ALT_INV_always0~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \BYTEOUT[1]~reg0_q\);

-- Location: LCCOMB_X44_Y30_N0
\BYTEOUT[2]~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \BYTEOUT[2]~2_combout\ = !\always0~1_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \always0~1_combout\,
	combout => \BYTEOUT[2]~2_combout\);

-- Location: FF_X44_Y30_N1
\BYTEOUT[2]~reg0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \change_clk|ALT_INV_newclk~clkctrl_outclk\,
	d => \BYTEOUT[2]~2_combout\,
	ena => \ALT_INV_always0~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \BYTEOUT[2]~reg0_q\);

-- Location: LCCOMB_X44_Y30_N2
\BYTEOUT[3]~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \BYTEOUT[3]~3_combout\ = !\always0~1_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \always0~1_combout\,
	combout => \BYTEOUT[3]~3_combout\);

-- Location: FF_X44_Y30_N3
\BYTEOUT[3]~reg0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \change_clk|ALT_INV_newclk~clkctrl_outclk\,
	d => \BYTEOUT[3]~3_combout\,
	ena => \ALT_INV_always0~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \BYTEOUT[3]~reg0_q\);

-- Location: FF_X44_Y30_N17
\BYTEOUT[4]~reg0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \change_clk|ALT_INV_newclk~clkctrl_outclk\,
	d => \always0~1_combout\,
	ena => \ALT_INV_always0~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \BYTEOUT[4]~reg0_q\);

-- Location: LCCOMB_X44_Y30_N22
\BYTEOUT[5]~reg0feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \BYTEOUT[5]~reg0feeder_combout\ = \always0~1_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \always0~1_combout\,
	combout => \BYTEOUT[5]~reg0feeder_combout\);

-- Location: FF_X44_Y30_N23
\BYTEOUT[5]~reg0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \change_clk|ALT_INV_newclk~clkctrl_outclk\,
	d => \BYTEOUT[5]~reg0feeder_combout\,
	ena => \ALT_INV_always0~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \BYTEOUT[5]~reg0_q\);

-- Location: LCCOMB_X44_Y30_N4
\BYTEOUT[6]~reg0feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \BYTEOUT[6]~reg0feeder_combout\ = \always0~1_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \always0~1_combout\,
	combout => \BYTEOUT[6]~reg0feeder_combout\);

-- Location: FF_X44_Y30_N5
\BYTEOUT[6]~reg0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \change_clk|ALT_INV_newclk~clkctrl_outclk\,
	d => \BYTEOUT[6]~reg0feeder_combout\,
	ena => \ALT_INV_always0~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \BYTEOUT[6]~reg0_q\);

-- Location: LCCOMB_X44_Y30_N30
\BYTEOUT[7]~reg0feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \BYTEOUT[7]~reg0feeder_combout\ = \always0~1_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \always0~1_combout\,
	combout => \BYTEOUT[7]~reg0feeder_combout\);

-- Location: FF_X44_Y30_N31
\BYTEOUT[7]~reg0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \change_clk|ALT_INV_newclk~clkctrl_outclk\,
	d => \BYTEOUT[7]~reg0feeder_combout\,
	ena => \ALT_INV_always0~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \BYTEOUT[7]~reg0_q\);

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


