package smith.robot;

import javax.swing.SwingUtilities;

import smith.robot.ui.MainWindow;
import uk.co.caprica.vlcj.discovery.NativeDiscovery;

public class Main {

	public static void main(final String[] args) {
		new NativeDiscovery().discover();
		SwingUtilities.invokeLater(new Runnable() {
			@Override
			public void run() {
				new MainWindow();
			}
		});
	}
}