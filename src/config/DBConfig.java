package config;

import java.awt.Color;
import java.awt.Font;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;

import javax.swing.BorderFactory;
import javax.swing.JButton;
import javax.swing.JFrame;
import javax.swing.JLabel;
import javax.swing.JPanel;
import javax.swing.JPasswordField;
import javax.swing.JTextField;
import javax.swing.border.Border;

import com.sun.java.swing.plaf.windows.WindowsButtonUI;

public class DBConfig extends JFrame {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	// Controls
	private static JLabel lblServer = new JLabel();
	private static JLabel lblDatabaseName = new JLabel();
	private static JLabel lblUser = new JLabel();
	private static JLabel lblPassword = new JLabel();
	private static JTextField txtServer = new JTextField();
	private static JTextField txtDatabaseName = new JTextField();
	private static JTextField txtUser = new JTextField();
	private static JPasswordField txtPassword = new JPasswordField();

	public DBConfig() {

		// TextFields border style
		Border fieldsBorder = BorderFactory.createLineBorder(new Color(61, 123, 173), 1);

		// Panel
		JPanel contentPane = (JPanel) this.getContentPane();
		contentPane.setLayout(null);
		contentPane.setBorder(BorderFactory.createEmptyBorder());
		contentPane.setBackground(new Color(240, 240, 240));

		// lblServer
		lblServer = new JLabel("Server");
		lblServer.setBounds(100, 18, 200, 18);
		contentPane.add(lblServer);

		// txtServer
		txtServer = new JTextField();
		txtServer.setBounds(100, 36, 200, 18);
		txtServer.setBorder(fieldsBorder);
		contentPane.add(txtServer);

		// lblDatabaseName
		lblDatabaseName = new JLabel("Database Name");
		lblDatabaseName.setBounds(100, 54, 200, 18);
		contentPane.add(lblDatabaseName);

		// txtDatabaseName
		txtDatabaseName = new JTextField();
		txtDatabaseName.setBounds(100, 72, 200, 18);
		txtDatabaseName.setBorder(fieldsBorder);
		contentPane.add(txtDatabaseName);

		// lblUser
		lblUser = new JLabel("User");
		lblUser.setBounds(100, 90, 200, 18);
		contentPane.add(lblUser);

		// txtUser
		txtUser = new JTextField();
		txtUser.setBounds(100, 108, 200, 18);
		txtUser.setBorder(fieldsBorder);
		contentPane.add(txtUser);

		// lblPassword
		lblPassword = new JLabel("Password");
		lblPassword.setBounds(100, 126, 200, 18);
		contentPane.add(lblPassword);

		// txtPassword
		txtPassword = new JPasswordField();
		txtPassword.setBounds(100, 144, 200, 18);
		txtPassword.setBorder(fieldsBorder);
		contentPane.add(txtPassword);

		// btnSave
		JButton btnSave = new JButton("Save");
		btnSave.setBounds(220, 198, 80, 26);
		btnSave.setUI(new WindowsButtonUI());
		btnSave.setFont(new Font("segoe ui", Font.PLAIN, 12));

		btnSave.addActionListener(new ActionListener() {
			@SuppressWarnings("deprecation")
			public void actionPerformed(ActionEvent e) {
				XMLDBManager manager = new XMLDBManager();

				manager.server = txtServer.getText();
				manager.databaseName = txtDatabaseName.getText();
				manager.user = txtUser.getText();
				manager.password = txtPassword.getText();

				manager.saveXML();

				manager.dispose();
			}
		});

		contentPane.add(btnSave);

		// Load fileds from XML
		XMLDBManager manager = new XMLDBManager();
		txtServer.setText(manager.server);
		txtDatabaseName.setText(manager.databaseName);
		txtUser.setText(manager.user);
		txtPassword.setText(manager.password);
		manager.dispose();

		// Frame
		this.setTitle("Database Configuration");
		this.setSize(400, 300);
		this.setResizable(false);
		this.setLocationRelativeTo(null);
		this.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
		this.setVisible(true);
	}

}
