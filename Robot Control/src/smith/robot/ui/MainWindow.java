package smith.robot.ui;

import java.awt.GridLayout;
import java.awt.event.WindowAdapter;
import java.awt.event.WindowEvent;

import javax.swing.JFrame;
import javax.swing.JPanel;

import jssc.SerialPortException;
import smith.robot.Serial;

public class MainWindow extends WindowAdapter {

	private JFrame frame;
	private VideoPlayer player;
	private ControlWidget control;
	private Serial serial;
	private SensorDisplay sensor;
	private RoboticVision vision;

	public MainWindow() {
		player = new VideoPlayer();
		control = new ControlWidget();
		sensor = new SensorDisplay();
		vision = new RoboticVision(sensor);
		serial = new Serial(control, sensor, vision);

		control.serial = serial;

		frame = new JFrame("Mechatronics Group 5 Robot Control");
		frame.setDefaultCloseOperation(JFrame.DO_NOTHING_ON_CLOSE);
		frame.addWindowListener(this);

		JPanel disp = new JPanel();
		disp.setLayout(new GridLayout(2, 1));
		JPanel top = new JPanel();
		top.setLayout(new GridLayout(1, 2));

		top.add(control.getComponet());
		top.add(player.getComponent()); // Add Video Player
		disp.add(top);

		JPanel bot = new JPanel();
		bot.setLayout(new GridLayout(1, 2));
		bot.add(sensor.getComponet());
		bot.add(vision);

		disp.add(bot);

		frame.setContentPane(disp);
		frame.pack();
		frame.setLocationRelativeTo(null);
		frame.setResizable(false);
		frame.setVisible(true);
	}

	@Override
	public void windowClosing(WindowEvent e) {
		player.close();
		try {
			serial.stop();
		} catch (SerialPortException e1) {
			e1.printStackTrace();
		}
		System.exit(0);
	}
}
