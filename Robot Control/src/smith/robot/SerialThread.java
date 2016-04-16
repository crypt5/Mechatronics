package smith.robot;

import jssc.SerialPort;
import smith.robot.ui.ControlWidget;

public class SerialThread extends Thread {

	private ControlWidget control;
	private SerialPort port;
	private Boolean running = true;
	private byte[] data;
	private int place = 0;
	private byte[] list = { Command.READ_ACCL_X, Command.READ_ACCL_Y, Command.READ_ACCL_Z, Command.READ_BUTTON,
			Command.READ_DRIVE_BRIDGE_POWER, Command.READ_FRONT_ULTRA, Command.READ_GREEN_LED, Command.READ_IR_ANGLE,
			Command.READ_LEFT_DRIVE, Command.READ_LIFT, Command.READ_LIFT_BOT_SWITCH, Command.READ_LIFT_BRIDGE_POWER,
			Command.READ_LIFT_TOP_SWITCH, Command.READ_MANUAL_CONTROL, Command.READ_RED_LED, Command.READ_RIGHT_DRIVE,
			Command.READ_SIDE_ULTRA, Command.READ_STATE, Command.READ_SWITCH_1, Command.READ_SWITCH_2,
			Command.READ_SWITCH_3, Command.READ_SWITCH_4, Command.READ_YELLOW_LED, Command.READ_IR_READING };

	public SerialThread(SerialPort port, ControlWidget control) {
		this.port = port;
		this.control = control;
		data = new byte[32];
	}

	public void run() {
		Boolean keepRunning = true;
		while (keepRunning) {
			try {
				if (control.isNewData()) {
					data[0] = Command.SET_MANUAL_CONTROL;
					data[1] = 0;
					data[2] = 0;
					data[3] = (byte) control.getManualMode();
					data[4] = Command.SET_LEFT_DRIVE;
					data[5] = 0;
					if (control.getLeftDrive() < 0) {
						data[6] = 1;
						data[7] = (byte) (control.getLeftDrive() * -1);
					} else {
						data[6] = 0;
						data[7] = (byte) (control.getLeftDrive());
					}
					data[8] = Command.SET_RIGHT_DRIVE;
					data[9] = 0;
					if (control.getRightDrive() < 0) {
						data[10] = 1;
						data[11] = (byte) (control.getRightDrive() * -1);
					} else {
						data[10] = 0;
						data[11] = (byte) (control.getRightDrive());
					}
					data[12] = Command.SET_LIFT;
					data[13] = 0;
					data[14] = 0;
					data[15] = (byte) control.getLiftState();
					for (int i = 0; i < 4; i++) {
						data[16 + (i * 4)] = list[place];
						data[17 + (i * 4)] = 0;
						data[18 + (i * 4)] = 0;
						data[19 + (i * 4)] = 0;
						place = (place + 1) % list.length;
					}
					control.setDataRead();
				} else {
					for (int i = 0; i < 8; i++) {
						data[0 + (i * 4)] = list[place];
						data[1 + (i * 4)] = 0;
						data[2 + (i * 4)] = 0;
						data[3 + (i * 4)] = 0;
						place = (place + 1) % list.length;
					}
				}
				port.writeBytes(data);
				Thread.sleep(250);
			} catch (Exception e) {
				e.printStackTrace();
			}
			synchronized (this) {
				keepRunning = running;
			}
		}

	}

	public void signalStop() {
		synchronized (this) {
			running = false;
		}
	}

}
