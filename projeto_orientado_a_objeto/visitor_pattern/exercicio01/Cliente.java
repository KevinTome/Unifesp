public class Cliente {
	public static void main(String[] args) {
		Documento doc = new Texto();
		doc.aceitar(new GerarXML());
		if (((Boolean)doc.aceitar(new Validar())).booleanValue()) {
			System.out.println(doc + " valido!");
		}
	}
}