package smith.robot.ui;

import java.awt.Container;
import java.io.Closeable;

import uk.co.caprica.vlcj.component.EmbeddedMediaPlayerComponent;

public class VideoPlayer implements Closeable {

	private final EmbeddedMediaPlayerComponent mediaPlayerComponent;
	private final String[] options = {
			":live-caching=0",
			":file-caching=0",
			":network-caching=0",
			":sout = #transcode{vcodec=wmv,vb=800,scale=0.25,acodec=none,fps=15}",
			":display", ":no-sout-rtp-sap", ":no-sout-standard-sap", ":ttl=1",
			":sout-keep" };

	public VideoPlayer() {
		mediaPlayerComponent = new EmbeddedMediaPlayerComponent();
	}

	public Container getComponent() {
		return mediaPlayerComponent;
	}

	public void startPlaying(String address) {
		mediaPlayerComponent.getMediaPlayer().playMedia(address, options);

	}

	public void stopPlaying() {
		mediaPlayerComponent.getMediaPlayer().stop();
	}

	@Override
	public void close() {
		mediaPlayerComponent.release(true);
	}

}