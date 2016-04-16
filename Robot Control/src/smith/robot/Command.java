package smith.robot;

public class Command {

	private Command() {
	}

	public static final byte NOOP = 0;

	public static final byte SET_LEFT_DRIVE = 1;
	public static final byte READ_LEFT_DRIVE = 2;

	public static final byte SET_RIGHT_DRIVE = 3;
	public static final byte READ_RIGHT_DRIVE = 4;

	public static final byte SET_LIFT = 5;
	public static final byte READ_LIFT = 6;

	public static final byte SET_RED_LED = 7;
	public static final byte READ_RED_LED = 8;

	public static final byte SET_YELLOW_LED = 9;
	public static final byte READ_YELLOW_LED = 10;

	public static final byte SET_GREEN_LED = 11;
	public static final byte READ_GREEN_LED = 12;

	public static final byte SET_MANUAL_CONTROL = 13;
	public static final byte READ_MANUAL_CONTROL = 14;

	public static final byte SET_STATE = 15;
	public static final byte READ_STATE = 16;

	public static final byte SET_IR_ANGLE = 17;
	public static final byte READ_IR_ANGLE = 18;

	public static final byte SET_FRONT_ULTRA = 19;
	public static final byte READ_FRONT_ULTRA = 20;

	public static final byte SET_SIDE_ULTRA = 21;
	public static final byte READ_SIDE_ULTRA = 22;

	public static final byte SET_ACCL_X = 23;
	public static final byte READ_ACCL_X = 24;

	public static final byte SET_ACCL_Y = 25;
	public static final byte READ_ACCL_Y = 26;

	public static final byte SET_ACCL_Z = 27;
	public static final byte READ_ACCL_Z = 28;

	public static final byte SET_SWITCH_1 = 29;
	public static final byte READ_SWITCH_1 = 30;

	public static final byte SET_SWITCH_2 = 31;
	public static final byte READ_SWITCH_2 = 32;

	public static final byte SET_SWITCH_3 = 33;
	public static final byte READ_SWITCH_3 = 34;

	public static final byte SET_SWITCH_4 = 35;
	public static final byte READ_SWITCH_4 = 36;

	public static final byte SET_BUTTON = 37;
	public static final byte READ_BUTTON = 38;

	public static final byte SET_LIFT_TOP_SWITCH = 39;
	public static final byte READ_LIFT_TOP_SWITCH = 40;

	public static final byte SET_LIFT_BOT_SWITCH = 41;
	public static final byte READ_LIFT_BOT_SWITCH = 42;

	public static final byte SET_DRIVE_BRIDGE_POWER = 43;
	public static final byte READ_DRIVE_BRIDGE_POWER = 44;

	public static final byte SET_LIFT_BRIDGE_POWER = 45;
	public static final byte READ_LIFT_BRIDGE_POWER = 46;

	public static final byte SET_IR_READING = 47;
	public static final byte READ_IR_READING = 48;
}
