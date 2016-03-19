package smith.robot;

import jssc.SerialPort;
import jssc.SerialPortEvent;
import jssc.SerialPortEventListener;
import jssc.SerialPortException;

public class SerialTest implements SerialPortEventListener {
	SerialPort port;

	public static void main(String[] args) {
		SerialTest t = new SerialTest();
		try {
			t.run();
		} catch (SerialPortException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (InterruptedException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	public void run() throws SerialPortException, InterruptedException {
		port = new SerialPort("COM1");
		port.openPort();
		port.setParams(SerialPort.BAUDRATE_9600, SerialPort.DATABITS_8, SerialPort.STOPBITS_1, SerialPort.PARITY_NONE);
		port.setFlowControlMode(SerialPort.FLOWCONTROL_RTSCTS_OUT);
		// port.addEventListener(this);

		port.writeByte((byte) 0b10011001);
		Thread.sleep(500);
		String read = port.readHexString();
		if (read != null)
			System.out.println("Received: " + read);

		// port.writeString("ljkasflkhasdklfjhasdjkfhaklsdhfklajsdhfjklashdfklahsdjklfhasdjklfhajksdhfaklsdhf");
		/*
		 * while (true) Thread.sleep(1000000);
		 */
		port.closePort();

	}

	@Override
	public void serialEvent(SerialPortEvent e) {
		try {
			String recv = port.readHexString();
			if (recv != null)
				System.out.println("Line: " + recv);
			else
				System.out.println("NULL");
		} catch (SerialPortException e1) {
			e1.printStackTrace();
		}

	}

}
