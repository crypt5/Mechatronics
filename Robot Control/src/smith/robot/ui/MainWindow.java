package smith.robot.ui;

import java.awt.GridLayout;
import java.awt.event.WindowAdapter;
import java.awt.event.WindowEvent;

import javax.swing.JFrame;
import javax.swing.JLabel;
import javax.swing.JPanel;

public class MainWindow extends WindowAdapter {

	private JFrame frame;
	private VideoPlayer player;

	public MainWindow() {
		player = new VideoPlayer();

		frame = new JFrame("Robot Control");
		frame.setDefaultCloseOperation(JFrame.DO_NOTHING_ON_CLOSE);
		frame.addWindowListener(this);

		JPanel disp = new JPanel();
		disp.setLayout(new GridLayout(2, 2));

		disp.add(dirPane());
		disp.add(player.getComponent());
		disp.add(new JPanel());
		disp.add(sensorPane());

		frame.setContentPane(disp);
		frame.pack();
		frame.setLocationRelativeTo(null);
		frame.setVisible(true);
	}

	private JPanel dirPane() {
		JPanel pane = new JPanel();
		pane.setLayout(new GridLayout(3, 3));
		pane.add(new JLabel("1"));
		pane.add(new JLabel("2"));
		pane.add(new JLabel("3"));
		pane.add(new JLabel("4"));
		pane.add(new JLabel("5"));
		pane.add(new JLabel("6"));
		pane.add(new JLabel("7"));
		pane.add(new JLabel("8"));
		pane.add(new JLabel("9"));
		return pane;
	}

	private JPanel sensorPane() {
		JPanel pane = new JPanel();
		pane.add(new JLabel("Sensors"));
		// TODO Sensors
		return pane;
	}

	@Override
	public void windowClosing(WindowEvent e) {
		player.close();
		System.exit(0);
	}
}
