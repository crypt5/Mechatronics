package smith.robot;

import javax.swing.JOptionPane;

import jssc.SerialPort;
import jssc.SerialPortException;
import jssc.SerialPortList;
import smith.robot.ui.ControlWidget;
import smith.robot.ui.RoboticVision;
import smith.robot.ui.SensorDisplay;

public class Serial {

	private ControlWidget ui;
	private SensorDisplay disp;
	private RoboticVision vision;
	private SerialPort port = null;
	private Boolean valid = false;

	public Serial(ControlWidget ui, SensorDisplay disp, RoboticVision vision) {
		this.ui = ui;
		this.disp = disp;
		this.vision = vision;
	}

	public static String[] getPorts() {
		return SerialPortList.getPortNames();
	}

	public void start(String portName) throws SerialPortException {
		port = new SerialPort(portName);
		valid = port.openPort();
		port.setParams(SerialPort.BAUDRATE_9600, SerialPort.DATABITS_8, SerialPort.STOPBITS_1, SerialPort.PARITY_NONE);
		port.setFlowControlMode(SerialPort.FLOWCONTROL_NONE);
		try {
			Thread.sleep(1000);
		} catch (InterruptedException e) {
		}
		JOptionPane.showMessageDialog(null, "Port Opened");
	}

	public void stop() throws SerialPortException {
		if (port != null)
			port.closePort();
	}

	public Boolean isValid() {
		return valid;
	}

}
