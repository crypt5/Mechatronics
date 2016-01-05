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

import uk.co.caprica.vlcj.component.EmbeddedMediaPlayerComponent;

public class VideoPlayer implements Closeable, ActionListener {

	private final EmbeddedMediaPlayerComponent mediaPlayerComponent;
	private final JTextField address;
	private final String[] options = {
			":live-caching=0",
			":file-caching=0",
			":network-caching=0",
			":sout = #transcode{vcodec=wmv,vb=800,scale=0.25,acodec=none,fps=30}",
			":display", ":no-sout-rtp-sap", ":no-sout-standard-sap", ":ttl=1",
			":sout-keep" };

	public VideoPlayer() {
		mediaPlayerComponent = new EmbeddedMediaPlayerComponent();
		address = new JTextField(20);
		mediaPlayerComponent.setPreferredSize(new Dimension(320, 240));
	}

	public JPanel getComponent() {
		JPanel pane = new JPanel();
		pane.setBorder(BorderFactory.createCompoundBorder(
				BorderFactory.createEmptyBorder(3, 3, 3, 3),
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

		c.gridx = 0;
		c.gridwidth = 4;
		c.gridy = 1;
		c.fill = GridBagConstraints.BOTH;
		pane.add(new JSeparator(), c);

		c.gridy = 2;
		c.fill = GridBagConstraints.NONE;
		pane.add(mediaPlayerComponent, c);
		return pane;
	}

	@Override
	public void close() {
		mediaPlayerComponent.release(true);
	}

	@Override
	public void actionPerformed(ActionEvent a) {
		String com = a.getActionCommand();
		if (com.equals("Start")) {
			mediaPlayerComponent.getMediaPlayer().playMedia(address.getText(),
					options);
		} else {
			mediaPlayerComponent.getMediaPlayer().stop();
		}

	}
}
