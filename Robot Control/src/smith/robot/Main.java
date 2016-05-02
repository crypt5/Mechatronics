package smith.robot;

import javax.swing.SwingUtilities;

import smith.robot.ui.MainWindow;
import uk.co.caprica.vlcj.discovery.NativeDiscovery;

public class Main {

	public static Boolean libs = false;

	public static void main(String[] args) {
		libs = new NativeDiscovery().discover();
		SwingUtilities.invokeLater(new Runnable() {
			@Override
			public void run() {
				new MainWindow();
			}
		});
	}
}