
public class Texto implements Documento {
	public Object aceitar(Visitante v) {
		return v.visitar(this);
	}
	
	public void gerarHTML() {
		System.out.println("GERADO HTML TEXTO");
	}
	
	public void gerarTexto() {
		System.out.println("GERADO TEXTO TEXTO");
	}
	
	public void gerarXML() {
		System.out.println("GERADO XML");
	}
	
	public String toString() {
		return "TEXTO";
	}
		
}