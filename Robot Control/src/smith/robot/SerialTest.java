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
		port = new SerialPort("COM5");
		port.openPort();
		port.setParams(SerialPort.BAUDRATE_9600, SerialPort.DATABITS_8, SerialPort.STOPBITS_1, SerialPort.PARITY_NONE);
		port.setFlowControlMode(SerialPort.FLOWCONTROL_NONE);
		Thread.sleep(5000);
		// port.addEventListener(this);

		byte[] buf = new byte[4];
		buf[0] = 10;
		buf[1] = 0;
		buf[2] = 0;
		buf[3] = 1;
		port.writeBytes(buf);
		String read = port.readString();
		System.out.println(read);
		// Thread.sleep(1000);
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
