package smith.robot;

import javax.swing.JOptionPane;

import jssc.SerialPort;
import jssc.SerialPortEvent;
import jssc.SerialPortEventListener;
import jssc.SerialPortException;
import jssc.SerialPortList;
import smith.robot.ui.ControlWidget;
import smith.robot.ui.RoboticVision;
import smith.robot.ui.SensorDisplay;

public class Serial implements SerialPortEventListener {

	private ControlWidget control;
	private SensorDisplay disp;
	private RoboticVision vision;
	private SerialPort port = null;
	private Boolean valid = false;
	private SerialThread thread = null;
	private int[] data;

	public Serial(ControlWidget control, SensorDisplay disp, RoboticVision vision) {
		this.control = control;
		this.disp = disp;
		this.vision = vision;
		data = new int[32];
	}

	public static String[] getPorts() {
		return SerialPortList.getPortNames();
	}

	public void start(String portName) throws SerialPortException {
		port = new SerialPort(portName);
		valid = port.openPort();
		port.setParams(SerialPort.BAUDRATE_115200, SerialPort.DATABITS_8, SerialPort.STOPBITS_1,
				SerialPort.PARITY_NONE);
		port.setFlowControlMode(SerialPort.FLOWCONTROL_NONE);
		port.addEventListener(this);
		try {
			Thread.sleep(1000);
		} catch (InterruptedException e) {
		}
		thread = new SerialThread(port, control);
		thread.start();
		JOptionPane.showMessageDialog(null, "Port Opened");
	}

	public void stop() throws SerialPortException {
		if (port != null) {
			thread.signalStop();
			try {
				thread.join();
			} catch (InterruptedException e) {
			}
			port.closePort();
		}
	}

	public Boolean isValid() {
		return valid;
	}

	@Override
	public void serialEvent(SerialPortEvent e) {
		try {
			data = port.readIntArray(32);
		} catch (SerialPortException e1) {
			e1.printStackTrace();
		}
		if (data != null) {
			for (int i = 0; i < 8; i++) {
				process_message(data[3 + (i * 4)], data[2 + (i * 4)], data[1 + (i * 4)], data[0 + (i * 4)]);
			}
		}
	}

	private void process_message(int byte0, int byte1, int byte2, int byte3) {
		switch (byte0) {
		case Command.SET_LEFT_DRIVE:
			if (byte2 == 0) {
				disp.setDriveLeft(byte3);
			} else {
				disp.setDriveLeft(-1 * byte3);
			}
			break;
		case Command.SET_RIGHT_DRIVE:
			if (byte2 == 0) {
				disp.setDriveRight(byte3);
			} else {
				disp.setDriveRight(byte3 * -1);
			}
			break;
		case Command.SET_LIFT:
			disp.setDriveLift(byte3);
			control.setLift(byte3);
			break;
		case Command.SET_RED_LED:
			disp.setRedLED(byte3);
			break;
		case Command.SET_YELLOW_LED:
			disp.setYellowLED(byte3);
			break;
		case Command.SET_GREEN_LED:
			disp.setGreenLED(byte3);
			break;
		case Command.SET_MANUAL_CONTROL:
			disp.setIndManual(byte3);
			break;
		case Command.SET_STATE:
			disp.setIndState(byte3);
			break;
		case Command.SET_IR_ANGLE:
			disp.setDriveIR(byte3);
			break;
		case Command.SET_FRONT_ULTRA:
			disp.setSensorFrontUltra(byte3);
			vision.setFrontDistance(byte3);
			break;
		case Command.SET_SIDE_ULTRA:
			disp.setSensorSideUltra(byte3);
			vision.setSideDistance(byte3);
			break;
		case Command.SET_ACCL_X:
			int valx = 0;
			valx = valx | byte3;
			valx = valx | (byte2 << 8);
			valx = valx | (byte1 << 16);
			disp.setSensorAcclX(valx);
			break;
		case Command.SET_ACCL_Y:
			int valy = 0;
			valy = valy | byte3;
			valy = valy | (byte2 << 8);
			valy = valy | (byte1 << 16);
			disp.setSensorAcclY(valy);
			break;
		case Command.SET_ACCL_Z:
			int valz = 0;
			valz = valz | byte3;
			valz = valz | (byte2 << 8);
			valz = valz | (byte1 << 16);
			disp.setSensorAcclZ(valz);
			break;
		case Command.SET_SWITCH_1:
			disp.setSwitch1(byte3);
			break;
		case Command.SET_SWITCH_2:
			disp.setSwitch2(byte3);
			break;
		case Command.SET_SWITCH_3:
			disp.setSwitch3(byte3);
			break;
		case Command.SET_SWITCH_4:
			disp.setSwitch4(byte3);
			break;
		case Command.SET_BUTTON:
			disp.setButton(byte3);
			break;
		case Command.SET_LIFT_TOP_SWITCH:
			disp.setLiftTop(byte3);
			break;
		case Command.SET_LIFT_BOT_SWITCH:
			disp.setLiftBot(byte3);
			break;
		case Command.SET_DRIVE_BRIDGE_POWER:
			disp.setIndDrive(byte3);
			break;
		case Command.SET_LIFT_BRIDGE_POWER:
			disp.setIndLift(byte3);
			break;
		case Command.SET_IR_READING:
			vision.setDiatance(byte2, byte3);
			break;
		case Command.NOOP:
			break;
		default:
			System.out.println("Unknown Command: " + byte0);
		}

	}

}
