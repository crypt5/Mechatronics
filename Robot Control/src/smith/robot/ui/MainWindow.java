package smith.robot.ui;

import java.awt.Container;
import java.awt.Dimension;
import java.awt.GridLayout;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.awt.event.KeyEvent;
import java.awt.event.KeyListener;
import java.awt.event.WindowAdapter;
import java.awt.event.WindowEvent;

import javax.swing.JButton;
import javax.swing.JFrame;
import javax.swing.JLabel;
import javax.swing.JPanel;

public class MainWindow extends WindowAdapter implements KeyListener,
		ActionListener {

	private JFrame frame;
	private VideoPlayer player;

	public MainWindow() {
		frame = new JFrame("Robot Control");
		frame.setDefaultCloseOperation(JFrame.DO_NOTHING_ON_CLOSE);
		frame.addWindowListener(this);
		frame.addKeyListener(this);

		JPanel disp = new JPanel();
		disp.setLayout(new GridLayout(2, 2));

		disp.add(dirPane());
		disp.add(videoPane());
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

	private JPanel videoPane() {
		JPanel pane = new JPanel();
		player = new VideoPlayer();

		JButton start = new JButton("Start");
		start.addActionListener(this);
		JButton stop = new JButton("Stop");
		stop.addActionListener(this);
		pane.add(start);
		pane.add(stop);
		Container con = player.getComponent();
		con.setPreferredSize(new Dimension(200, 200));
		pane.add(con);
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

	@Override
	public void keyPressed(KeyEvent e) {
		// TODO Auto-generated method stub

	}

	@Override
	public void keyReleased(KeyEvent e) {
		// TODO Auto-generated method stub

	}

	@Override
	public void keyTyped(KeyEvent e) {
		// TODO Auto-generated method stub
	}

	@Override
	public void actionPerformed(ActionEvent e) {
		String lab = e.getActionCommand();
		if (lab.equals("Start")) {
			player.startPlaying("http://192.168.1.15:8080/video");
		} else {
			player.stopPlaying();
		}
	}
}
