package smith.robot.ui;

import java.awt.Color;
import java.awt.Graphics;
import java.awt.Graphics2D;
import java.awt.Rectangle;

import javax.swing.BorderFactory;
import javax.swing.JPanel;

public class RoboticVision extends JPanel {

	private static final long serialVersionUID = 1L;
	private int[] distances;
	private int sideDistance, frontDistance;
	private SensorDisplay disp;

	public RoboticVision(SensorDisplay disp) {
		super();
		this.setBorder(BorderFactory.createCompoundBorder(BorderFactory.createEmptyBorder(5, 5, 5, 5),
				BorderFactory.createTitledBorder("Robotic Vision")));
		distances = new int[37];
		for (int i = 0; i < distances.length; i++)
			distances[i] = -1;

		sideDistance = -1;
		frontDistance = -1;
		this.disp = disp;
	}

	public void setDiatance(int angle, int distance) {
		if (angle == 90) {
			disp.setSensorFrontIR(distance);
		} else if (angle == 180) {
			disp.setSensorSideIR(distance);
		}
		distances[angle / 5] = distance;
		super.repaint();
	}

	public void setSideDistance(int distance) {
		if (distance > 200) {
			sideDistance = -1;
		} else {
			sideDistance = distance;
		}
		super.repaint();
	}

	public void setFrontDistance(int distance) {
		if (distance > 200) {
			frontDistance = -1;
		} else {
			frontDistance = distance;
		}
		super.repaint();
	}

	public void paintComponent(Graphics g) {
		super.paintComponent(g);
		Graphics2D g2d = (Graphics2D) g;
		int startX = 160;
		int startY = 250;

		g2d.setColor(Color.WHITE);
		g2d.fill(new Rectangle(15, 25, 405, 400));

		g2d.setColor(Color.BLACK);
		g2d.draw3DRect(60, 250, 100, 150, true);
		g2d.drawString("Robot", 70, 270);

		g2d.setColor(Color.RED);
		g2d.drawString("IR Reading", 20, 40);
		g2d.fillOval(startX - 5, startY - 5, 10, 10);
		for (int i = 1; i < distances.length; i++) {
			if (distances[i - 1] > 0 && distances[i] > 0) {
				Double x1, y1, x2, y2;
				x1 = startX + (distances[i - 1] * Math.cos(Math.toRadians((i - 1) * -5)));
				y1 = startY + (distances[i - 1] * Math.sin(Math.toRadians((i - 1) * -5)));
				x2 = startX + (distances[i] * Math.cos(Math.toRadians(i * -5)));
				y2 = startY + (distances[i] * Math.sin(Math.toRadians(i * -5)));
				g2d.drawLine(x1.intValue(), y1.intValue(), x2.intValue(), y2.intValue());
			}
		}

		g2d.setColor(Color.BLUE);
		g2d.drawString("Ultrasonic Reading", 150, 40);
		g2d.fillOval(55, 245, 10, 10);
		g2d.fillOval(155, 335, 10, 10);
		if (frontDistance > 0)
			g2d.drawLine(50, startY - frontDistance, 380, startY - frontDistance);
		if (sideDistance > 0)
			g2d.drawLine(startX + sideDistance, 100, startX + sideDistance, 400);

	}

}
