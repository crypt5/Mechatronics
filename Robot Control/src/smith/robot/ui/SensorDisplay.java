package smith.robot.ui;

import java.awt.GridBagConstraints;
import java.awt.GridBagLayout;
import java.awt.GridLayout;
import java.awt.Insets;

import javax.swing.BorderFactory;
import javax.swing.JLabel;
import javax.swing.JPanel;
import javax.swing.JSeparator;

public class SensorDisplay {

	private JPanel pane;

	private JLabel driveLeft, driveRight, driveLift, driveIR;
	private JLabel sensorFrontUltra, sensorSideUltra, sensorFrontIR, sensorSideIR, sensorAcclX, sensorAcclY,
			sensorAcclZ;
	private JLabel greenLED, yellowLED, redLED;
	private JLabel switch1, switch2, switch3, switch4, liftTop, liftBot, button;
	private JLabel indDrive, indLift, indManual, indState;

	public SensorDisplay() {
		buildPane();
	}

	private void buildPane() {
		pane = new JPanel();
		pane.setBorder(BorderFactory.createEmptyBorder(5, 5, 5, 5));
		pane.setLayout(new GridLayout());
		pane.add(sensorPane());
		pane.add(indicatorPane());
	}

	private JPanel sensorPane() {
		JPanel sensor = new JPanel();
		sensor.setLayout(new GridBagLayout());
		sensor.setBorder(BorderFactory.createCompoundBorder(BorderFactory.createEmptyBorder(6, 6, 6, 3),
				BorderFactory.createTitledBorder("Sensor and Motor Data")));
		GridBagConstraints c = new GridBagConstraints();
		c.insets = new Insets(5, 1, 5, 1);
		c.gridx = 0;
		c.gridy = 0;
		c.anchor = GridBagConstraints.EAST;
		sensor.add(new JLabel("Left Drive Motor: "), c);

		c.gridy++;
		sensor.add(new JLabel("Right Drive Motor: "), c);

		c.gridy++;
		sensor.add(new JLabel("Fork Lift Motor: "), c);

		c.gridy++;
		sensor.add(new JLabel("IR Servo Angle: "), c);

		c.gridy++;
		c.gridwidth = 2;
		c.fill = GridBagConstraints.BOTH;
		c.anchor = GridBagConstraints.CENTER;
		sensor.add(new JSeparator(), c);

		c.gridy++;
		c.gridwidth = 1;
		c.fill = GridBagConstraints.NONE;
		c.anchor = GridBagConstraints.EAST;
		sensor.add(new JLabel("Front Ultrasonic: "), c);

		c.gridy++;
		sensor.add(new JLabel("Side UltraSonic: "), c);

		c.gridy++;
		sensor.add(new JLabel("Front IR: "), c);

		c.gridy++;
		sensor.add(new JLabel("Side IR: "), c);

		c.gridy++;
		sensor.add(new JLabel("Accelerometer X: "), c);

		c.gridy++;
		sensor.add(new JLabel("Accelerometer Y: "), c);

		c.gridy++;
		sensor.add(new JLabel("Accelerometer Z: "), c);

		c.gridy = 0;
		c.gridx = 1;
		c.anchor = GridBagConstraints.WEST;
		c.weightx = 1;
		driveLeft = new JLabel("N/A");
		sensor.add(driveLeft, c);

		c.gridy++;
		driveRight = new JLabel("N/A");
		sensor.add(driveRight, c);

		c.gridy++;
		driveLift = new JLabel("N/A");
		sensor.add(driveLift, c);

		c.gridy++;
		driveIR = new JLabel("N/A");
		sensor.add(driveIR, c);

		c.gridy++;
		c.gridy++;
		sensorFrontUltra = new JLabel("N/A");
		sensor.add(sensorFrontUltra, c);

		c.gridy++;
		sensorSideUltra = new JLabel("N/A");
		sensor.add(sensorSideUltra, c);

		c.gridy++;
		sensorFrontIR = new JLabel("N/A");
		sensor.add(sensorFrontIR, c);

		c.gridy++;
		sensorSideIR = new JLabel("N/A");
		sensor.add(sensorSideIR, c);

		c.gridy++;
		sensorAcclX = new JLabel("N/A");
		sensor.add(sensorAcclX, c);

		c.gridy++;
		sensorAcclY = new JLabel("N/A");
		sensor.add(sensorAcclY, c);

		c.gridy++;
		sensorAcclZ = new JLabel("N/A");
		sensor.add(sensorAcclZ, c);

		return sensor;
	}

	public void setDriveLeft(int driveLeft) {
		this.driveLeft.setText("" + driveLeft);
	}

	public void setDriveRight(int driveRight) {
		this.driveRight.setText("" + driveRight);
	}

	public void setDriveLift(int driveLift) {
		this.driveLift.setText("" + driveLift);
	}

	public void setDriveIR(int driveIR) {
		this.driveIR.setText("" + driveIR);
	}

	public void setSensorFrontUltra(int sensorFrontUltra) {
		this.sensorFrontUltra.setText("" + sensorFrontUltra);
	}

	public void setSensorSideUltra(int sensorSideUltra) {
		this.sensorSideUltra.setText("" + sensorSideUltra);
	}

	public void setSensorFrontIR(int sensorFrontIR) {
		this.sensorFrontIR.setText("" + sensorFrontIR);
	}

	public void setSensorSideIR(int sensorSideIR) {
		this.sensorSideIR.setText("" + sensorSideIR);
	}

	public void setSensorAcclX(int sensorAcclX) {
		this.sensorAcclX.setText("" + sensorAcclX);
	}

	public void setSensorAcclY(int sensorAcclY) {
		this.sensorAcclY.setText("" + sensorAcclY);
	}

	public void setSensorAcclZ(int sensorAcclZ) {
		this.sensorAcclZ.setText("" + sensorAcclZ);
	}

	public void setGreenLED(int greenLED) {
		this.greenLED.setText("" + greenLED);
	}

	public void setYellowLED(int yellowLED) {
		this.yellowLED.setText("" + yellowLED);
	}

	public void setRedLED(int redLED) {
		this.redLED.setText("" + redLED);
	}

	public void setSwitch1(int switch1) {
		this.switch1.setText("" + switch1);
	}

	public void setSwitch2(int switch2) {
		this.switch2.setText("" + switch2);
	}

	public void setSwitch3(int switch3) {
		this.switch3.setText("" + switch3);
	}

	public void setSwitch4(int switch4) {
		this.switch4.setText("" + switch4);
	}

	public void setLiftTop(int liftTop) {
		this.liftTop.setText("" + liftTop);
	}

	public void setLiftBot(int liftBot) {
		this.liftBot.setText("" + liftBot);
	}

	public void setButton(int button) {
		this.button.setText("" + button);
	}

	public void setIndDrive(int indDrive) {
		this.indDrive.setText("" + indDrive);
	}

	public void setIndLift(int indLift) {
		this.indLift.setText("" + indLift);
	}

	public void setIndManual(int indManual) {
		this.indManual.setText("" + indManual);
	}

	public void setIndState(int indState) {
		this.indState.setText("" + indState);
	}

	private JPanel indicatorPane() {
		JPanel ind = new JPanel();
		ind.setLayout(new GridBagLayout());
		ind.setBorder(BorderFactory.createCompoundBorder(BorderFactory.createEmptyBorder(6, 3, 6, 6),
				BorderFactory.createTitledBorder("LED, Switch, and Internal Data")));
		GridBagConstraints c = new GridBagConstraints();
		c.insets = new Insets(5, 1, 5, 1);
		c.gridx = 0;
		c.gridy = 0;
		c.anchor = GridBagConstraints.EAST;
		ind.add(new JLabel("Green LED: "), c);

		c.gridy++;
		ind.add(new JLabel("Yellow LED: "), c);

		c.gridy++;
		ind.add(new JLabel("Red LED: "), c);

		c.gridy++;
		c.gridwidth = 2;
		c.anchor = GridBagConstraints.CENTER;
		c.fill = GridBagConstraints.BOTH;
		ind.add(new JSeparator(), c);

		c.gridy++;
		c.gridwidth = 1;
		c.anchor = GridBagConstraints.EAST;
		c.fill = GridBagConstraints.NONE;
		ind.add(new JLabel("Switch Bank 1: "), c);

		c.gridy++;
		ind.add(new JLabel("Switch Bank 2: "), c);

		c.gridy++;
		ind.add(new JLabel("Switch Bank 3: "), c);

		c.gridy++;
		ind.add(new JLabel("Switch Bank 4: "), c);

		c.gridy++;
		ind.add(new JLabel("Push Button: "), c);

		c.gridy++;
		ind.add(new JLabel("Lift Top Switch: "), c);

		c.gridy++;
		ind.add(new JLabel("Lift Bot Switch: "), c);

		c.gridy++;
		c.gridwidth = 2;
		c.anchor = GridBagConstraints.CENTER;
		c.fill = GridBagConstraints.BOTH;
		ind.add(new JSeparator(), c);

		c.gridy++;
		c.gridwidth = 1;
		c.anchor = GridBagConstraints.EAST;
		c.fill = GridBagConstraints.NONE;
		ind.add(new JLabel("Drive H-Bridge Powered: "), c);

		c.gridy++;
		ind.add(new JLabel("Lift H-Bridge Powered: "), c);

		c.gridy++;
		ind.add(new JLabel("Manual Mode: "), c);

		c.gridy++;
		ind.add(new JLabel("Robot State: "), c);

		c.gridy = 0;
		c.gridx = 1;
		c.anchor = GridBagConstraints.WEST;
		c.weightx = 1;
		greenLED = new JLabel("N/A");
		ind.add(greenLED, c);

		c.gridy++;
		yellowLED = new JLabel("N/A");
		ind.add(yellowLED, c);

		c.gridy++;
		redLED = new JLabel("N/A");
		ind.add(redLED, c);

		c.gridy++;
		c.gridy++;
		switch1 = new JLabel("N/A");
		ind.add(switch1, c);

		c.gridy++;
		switch2 = new JLabel("N/A");
		ind.add(switch2, c);

		c.gridy++;
		switch3 = new JLabel("N/A");
		ind.add(switch3, c);

		c.gridy++;
		switch4 = new JLabel("N/A");
		ind.add(switch4, c);

		c.gridy++;
		button = new JLabel("N/A");
		ind.add(button, c);

		c.gridy++;
		liftTop = new JLabel("N/A");
		ind.add(liftTop, c);

		c.gridy++;
		liftBot = new JLabel("N/A");
		ind.add(liftBot, c);

		c.gridy++;
		c.gridy++;
		indDrive = new JLabel("N/A");
		ind.add(indDrive, c);

		c.gridy++;
		indLift = new JLabel("N/A");
		ind.add(indLift, c);

		c.gridy++;
		indManual = new JLabel("N/A");
		ind.add(indManual, c);

		c.gridy++;
		indState = new JLabel("N/A");
		ind.add(indState, c);

		return ind;
	}

	public JPanel getComponet() {
		return pane;
	}
}
