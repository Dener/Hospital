package config;

import java.io.File;

import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.transform.OutputKeys;
import javax.xml.transform.Transformer;
import javax.xml.transform.TransformerFactory;
import javax.xml.transform.dom.DOMSource;
import javax.xml.transform.stream.StreamResult;

import org.jasypt.util.text.BasicTextEncryptor;
import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.Text;

public class XMLDBManager {

	// XML Path
	private String xmlPath = "DBConfig.xml";

	// Cryptography tool
	private BasicTextEncryptor bte;

	// Properties
	public String server;
	public String databaseName;
	public String user;
	public String password;

	// Constructor
	public XMLDBManager() {
		bte = new BasicTextEncryptor();
		bte.setPassword("cc6");
		loadXML();
	}

	// Destructor
	public void dispose() {
		bte = null;
	}

	public void loadXML() {

		if (new File(xmlPath).exists()) {
			try {
				File fXmlFile = new File(xmlPath);
				DocumentBuilderFactory dbFactory = DocumentBuilderFactory
						.newInstance();
				DocumentBuilder dBuilder;
				dBuilder = dbFactory.newDocumentBuilder();
				Document doc = dBuilder.parse(fXmlFile);
				doc.getDocumentElement().normalize();

				server = bte.decrypt(doc.getElementsByTagName("server").item(0)
						.getTextContent());

				databaseName = bte.decrypt(doc
						.getElementsByTagName("databaseName").item(0)
						.getTextContent());

				user = bte.decrypt(doc.getElementsByTagName("user").item(0)
						.getTextContent());

				password = bte.decrypt(doc.getElementsByTagName("password").item(0)
						.getTextContent());

			} catch (Exception e) {
				e.printStackTrace();
			}
		} else
			saveXML();

	}

	public void saveXML() {
		try {

			DocumentBuilderFactory dbfac = DocumentBuilderFactory.newInstance();
			DocumentBuilder docBuilder = dbfac.newDocumentBuilder();
			Document doc = docBuilder.newDocument();

			Element root = doc.createElement("DBConfig");
			doc.appendChild(root);

			Element child;
			Text text;

			child = doc.createElement("server");
			root.appendChild(child);
			text = doc
					.createTextNode(bte.encrypt(server != null ? server : ""));
			child.appendChild(text);

			child.appendChild(text);

			child = doc.createElement("databaseName");
			root.appendChild(child);

			text = doc.createTextNode(bte
					.encrypt(databaseName != null ? databaseName : ""));
			child.appendChild(text);

			child.appendChild(text);

			child = doc.createElement("user");
			root.appendChild(child);

			text = doc.createTextNode(bte.encrypt(user != null ? user : ""));
			child.appendChild(text);

			child.appendChild(text);

			child = doc.createElement("password");
			root.appendChild(child);

			text = doc.createTextNode(bte.encrypt(password != null ? password
					: ""));
			child.appendChild(text);

			child.appendChild(text);

			TransformerFactory transfac = TransformerFactory.newInstance();
			Transformer trans = transfac.newTransformer();
			trans.setOutputProperty(OutputKeys.OMIT_XML_DECLARATION, "yes");
			trans.setOutputProperty(OutputKeys.INDENT, "yes");

			DOMSource source = new DOMSource(doc);
			StreamResult result = new StreamResult(new File(xmlPath));

			trans.transform(source, result);

		}

		catch (Exception e) {
			System.out.println(e);
		}
	}

}
