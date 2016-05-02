package smith.robot.ui;

import java.awt.Dimension;
import java.awt.GridBagConstraints;
import java.awt.GridBagLayout;
import java.awt.Insets;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.io.Closeable;

import javax.swing.BorderFactory;
import javax.swing.JButton;
import javax.swing.JLabel;
import javax.swing.JPanel;
import javax.swing.JSeparator;
import javax.swing.JTextField;
import javax.swing.SwingConstants;

import smith.robot.Main;
import uk.co.caprica.vlcj.component.EmbeddedMediaPlayerComponent;

public class VideoPlayer implements Closeable, ActionListener {

	private EmbeddedMediaPlayerComponent mediaPlayerComponent = null;
	private JTextField address;
	private String[] options = { ":live-caching=0", ":file-caching=0", ":network-caching=0",
			":sout = #transcode{vcodec=wmv,vb=800,scale=0.25,acodec=none,fps=30}", ":display", ":no-sout-rtp-sap",
			":no-sout-standard-sap", ":ttl=1", ":sout-keep" };

	public VideoPlayer() {
		if (Main.libs) {
			mediaPlayerComponent = new EmbeddedMediaPlayerComponent();
			mediaPlayerComponent.setPreferredSize(new Dimension(320, 240));
		}
		address = new JTextField(20);
	}

	public JPanel getComponent() {
		JPanel pane = new JPanel();
		pane.setBorder(BorderFactory.createCompoundBorder(BorderFactory.createEmptyBorder(3, 3, 3, 3),
				BorderFactory.createTitledBorder("Video Feed")));
		pane.setLayout(new GridBagLayout());
		GridBagConstraints c = new GridBagConstraints();
		c.insets = new Insets(2, 2, 2, 2);
		c.gridy = 0;
		c.gridx = 0;
		pane.add(new JLabel("Address: "), c);

		c.gridx++;
		pane.add(address, c);

		c.gridx++;
		JButton start = new JButton("Start");
		start.addActionListener(this);
		pane.add(start, c);

		c.gridx++;
		JButton stop = new JButton("Stop");
		stop.addActionListener(this);
		pane.add(stop);

		if (!Main.libs) {
			start.setEnabled(false);
			stop.setEnabled(false);
		}

		c.gridx = 0;
		c.gridwidth = 4;
		c.gridy = 1;
		c.fill = GridBagConstraints.BOTH;
		pane.add(new JSeparator(), c);

		c.gridy = 2;
		c.weightx = 1;
		c.weighty = 1;
		if (Main.libs)
			pane.add(mediaPlayerComponent, c);
		else
			pane.add(new JLabel("VLC Not Installed", SwingConstants.CENTER), c);
		return pane;
	}

	@Override
	public void close() {
		if (mediaPlayerComponent != null)
			mediaPlayerComponent.release(true);
	}

	@Override
	public void actionPerformed(ActionEvent a) {
		String com = a.getActionCommand();
		if (com.equals("Start")) {
			mediaPlayerComponent.getMediaPlayer().playMedia(address.getText(), options);
		} else {
			mediaPlayerComponent.getMediaPlayer().stop();
		}

	}
}
