package smith.robot.ui;

import java.awt.Color;
import java.awt.GridBagConstraints;
import java.awt.GridBagLayout;
import java.awt.Insets;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.awt.event.FocusEvent;
import java.awt.event.FocusListener;
import java.awt.event.KeyEvent;
import java.awt.event.KeyListener;
import java.awt.event.MouseEvent;
import java.awt.event.MouseListener;

import javax.swing.BorderFactory;
import javax.swing.ImageIcon;
import javax.swing.JCheckBox;
import javax.swing.JComboBox;
import javax.swing.JLabel;
import javax.swing.JOptionPane;
import javax.swing.JPanel;
import javax.swing.JSeparator;
import javax.swing.SwingConstants;

import jssc.SerialPortException;
import smith.robot.Serial;

public class ControlWidget implements KeyListener {

	private int leftDrive, rightDrive, liftState, manualMode;
	private Boolean newData;

	private JPanel pane;
	private JLabel forward, back, left, right, focus;
	private JCheckBox lift;
	Serial serial;

	public ControlWidget() {
		leftDrive = 0;
		rightDrive = 0;
		liftState = 0;
		manualMode = 0;
		newData = false;
		pane = new JPanel();
		buildPane();
	}

	private void buildPane() {
		pane.setBorder(BorderFactory.createCompoundBorder(BorderFactory.createEmptyBorder(3, 3, 3, 3),
				BorderFactory.createTitledBorder("Control")));
		pane.setLayout(new GridBagLayout());
		pane.addKeyListener(this);
		pane.setFocusable(true);
		pane.addFocusListener(new FocusListener() {

			@Override
			public void focusGained(FocusEvent e) {
				if (manualMode == 1) {
					focus.setBackground(Color.GREEN);
					focus.setText("Controls Active");
				}
			}

			@Override
			public void focusLost(FocusEvent e) {
				focus.setBackground(Color.RED);
				focus.setText("Controls Inactive");
			}
		});
		pane.addMouseListener(new MouseListener() {

			@Override
			public void mouseClicked(MouseEvent arg0) {
				pane.requestFocus();
			}

			@Override
			public void mouseEntered(MouseEvent arg0) {

			}

			@Override
			public void mouseExited(MouseEvent arg0) {

			}

			@Override
			public void mousePressed(MouseEvent arg0) {

			}

			@Override
			public void mouseReleased(MouseEvent arg0) {

			}
		});

		GridBagConstraints c = new GridBagConstraints();
		c.insets = new Insets(2, 2, 2, 2);
		c.gridy = 0;
		c.gridx = 0;
		c.anchor = GridBagConstraints.EAST;
		pane.add(new JLabel("Select Com port: "), c);

		c.gridx = 1;
		c.gridwidth = 2;
		c.anchor = GridBagConstraints.WEST;
		c.fill = GridBagConstraints.BOTH;
		JComboBox<String> port = new JComboBox<String>(Serial.getPorts());
		port.setSelectedIndex(-1);
		port.setBackground(Color.WHITE);
		port.addActionListener(new ActionListener() {

			@Override
			public void actionPerformed(ActionEvent e) {
				try {
					int sel = port.getSelectedIndex();
					if (sel != -1)
						serial.start(port.getItemAt(sel));
				} catch (SerialPortException s) {
					s.printStackTrace();
				}
			}
		});
		pane.add(port, c);

		c.gridx = 0;
		c.gridy++;
		c.gridwidth = 2;
		c.anchor = GridBagConstraints.WEST;
		c.fill = GridBagConstraints.NONE;
		JSwitchBox takeControl = new JSwitchBox("Auto", "Manual");
		pane.add(takeControl, c);
		takeControl.setSelected(true);
		takeControl.addMouseListener(new MouseListener() {

			@Override
			public void mouseClicked(MouseEvent e) {
				if (takeControl.isSelected()) {
					manualMode = 0;
					newData = true;
					focus.setText("Controls Inactive");
					focus.setBackground(Color.RED);
					lift.setEnabled(false);
				} else if (serial.isValid()) {
					if (JOptionPane.showConfirmDialog(takeControl, "Take Over Control?") == JOptionPane.OK_OPTION) {
						manualMode = 1;
						newData = true;
						pane.requestFocus();
						lift.setEnabled(true);
					} else {
						takeControl.setSelected(true);
					}
				} else {
					JOptionPane.showMessageDialog(takeControl, "Please Select the Serial\nPort to Use First");
					takeControl.setSelected(true);
				}

			}

			@Override
			public void mouseEntered(MouseEvent arg0) {
			}

			@Override
			public void mouseExited(MouseEvent arg0) {
			}

			@Override
			public void mousePressed(MouseEvent arg0) {
			}

			@Override
			public void mouseReleased(MouseEvent arg0) {
			}
		});

		c.gridx = 2;
		c.gridwidth = 1;
		c.fill = GridBagConstraints.BOTH;
		c.anchor = GridBagConstraints.EAST;
		focus = new JLabel("Controls Inactive", SwingConstants.CENTER);
		focus.setOpaque(true);
		focus.setBackground(Color.RED);
		focus.setBorder(BorderFactory.createLineBorder(Color.BLACK));
		pane.add(focus, c);

		c.gridx = 0;
		c.gridy++;
		c.fill = GridBagConstraints.BOTH;
		c.gridwidth = 3;
		c.ipady = 5;
		pane.add(new JSeparator(), c);

		c.gridy++;
		c.gridx = 0;
		c.ipady = 0;
		c.fill = GridBagConstraints.NONE;
		c.anchor = GridBagConstraints.CENTER;
		c.gridwidth = 1;
		lift = new JCheckBox("Lift Up");
		lift.setSelected(true);
		lift.setEnabled(false);
		lift.addActionListener(new ActionListener() {

			@Override
			public void actionPerformed(ActionEvent e) {
				if (lift.isSelected()) {
					liftState = 1;
				} else {
					liftState = 0;
				}
				pane.requestFocus();
				newData = true;
			}
		});
		pane.add(lift, c);

		c.gridx = 1;
		forward = new JLabel();
		forward.setIcon(new ImageIcon(getClass().getResource("images/forward.png")));
		forward.setBackground(Color.LIGHT_GRAY);
		forward.setOpaque(true);
		forward.setBorder(BorderFactory.createLineBorder(Color.BLACK));
		pane.add(forward, c);

		c.gridx = 0;
		c.gridy++;
		c.anchor = GridBagConstraints.EAST;
		left = new JLabel();
		left.setIcon(new ImageIcon(getClass().getResource("images/left.png")));
		left.setBackground(Color.LIGHT_GRAY);
		left.setOpaque(true);
		left.setBorder(BorderFactory.createLineBorder(Color.BLACK));
		pane.add(left, c);

		c.gridx = 1;
		c.anchor = GridBagConstraints.CENTER;
		back = new JLabel();
		back.setIcon(new ImageIcon(getClass().getResource("images/back.png")));
		back.setBackground(Color.LIGHT_GRAY);
		back.setOpaque(true);
		back.setBorder(BorderFactory.createLineBorder(Color.BLACK));
		pane.add(back, c);

		c.gridx = 2;
		right = new JLabel();
		right.setIcon(new ImageIcon(getClass().getResource("images/right.png")));
		right.setBackground(Color.LIGHT_GRAY);
		right.setOpaque(true);
		right.setBorder(BorderFactory.createLineBorder(Color.BLACK));
		pane.add(right, c);

	}

	public JPanel getComponet() {
		return pane;
	}

	public Boolean isNewData() {
		return newData;
	}

	public int getLeftDrive() {
		return leftDrive;
	}

	public int getRightDrive() {
		return rightDrive;
	}

	public int getLiftState() {
		return liftState;
	}

	public int getManualMode() {
		return manualMode;
	}

	@Override
	public void keyPressed(KeyEvent e) {
		if (manualMode == 1) {
			char key = e.getKeyChar();
			switch (key) {
			case 'w':
				forward.setBackground(Color.DARK_GRAY);
				leftDrive = leftDrive + 128;
				rightDrive = rightDrive + 128;
				newData = true;
				break;
			case 'a':
				left.setBackground(Color.DARK_GRAY);
				leftDrive = leftDrive - 128;
				rightDrive = rightDrive + 128;
				newData = true;
				break;
			case 's':
				back.setBackground(Color.DARK_GRAY);
				leftDrive = leftDrive - 128;
				rightDrive = rightDrive - 128;
				newData = true;
				break;
			case 'd':
				right.setBackground(Color.DARK_GRAY);
				leftDrive = leftDrive + 128;
				rightDrive = rightDrive - 128;
				newData = true;
				break;
			}
		}
	}

	@Override
	public void keyReleased(KeyEvent e) {
		if (manualMode == 1) {
			char key = e.getKeyChar();
			switch (key) {
			case 'w':
				forward.setBackground(Color.LIGHT_GRAY);
				leftDrive = leftDrive - 128;
				rightDrive = rightDrive - 128;
				newData = true;
				break;
			case 'a':
				left.setBackground(Color.LIGHT_GRAY);
				leftDrive = leftDrive + 128;
				rightDrive = rightDrive - 128;
				newData = true;
				break;
			case 's':
				back.setBackground(Color.LIGHT_GRAY);
				leftDrive = leftDrive + 128;
				rightDrive = rightDrive + 128;
				newData = true;
				break;
			case 'd':
				right.setBackground(Color.LIGHT_GRAY);
				leftDrive = leftDrive - 128;
				rightDrive = rightDrive + 128;
				newData = true;
				break;
			}
		}

	}

	@Override
	public void keyTyped(KeyEvent arg0) {

	}

}
