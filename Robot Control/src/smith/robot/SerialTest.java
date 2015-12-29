package smith.robot;

import jssc.SerialPort;
import jssc.SerialPortException;

public class SerialTest {

	public static void main(String[] args) {
		SerialPort port = new SerialPort("COM1");
		try {
			port.openPort();
			port.setParams(9600, 8, 1, SerialPort.PARITY_NONE);
			port.setFlowControlMode(SerialPort.FLOWCONTROL_RTSCTS_IN
					| SerialPort.FLOWCONTROL_RTSCTS_OUT);

			port.writeByte((byte) 0xBB);
			port.closePort();
		} catch (SerialPortException e) {
			e.printStackTrace();
		}

	}

}
