package smith.robot.ui;

import javax.swing.BorderFactory;
import javax.swing.JPanel;

public class RoboticVision {

	private JPanel pane;

	public RoboticVision() {
		buildPane();
	}

	private void buildPane() {
		pane = new JPanel();
		pane.setBorder(BorderFactory.createTitledBorder("Robotic Vision"));
	}

	public JPanel getComponet() {
		return pane;
	}

}
