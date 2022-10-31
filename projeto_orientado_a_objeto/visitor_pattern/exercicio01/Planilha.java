
public class Planilha implements Documento {
	
	public Object aceitar(Visitante v) {
		return v.visitar(this);
	}
	
	public void gerarHTML() {
		System.out.println("GERADO HTML PLANILHA");
	}
	public void gerarXML() {
		System.out.println("GERADO XML");
	}
	
	public void gerarTexto() {
		System.out.println("GERADO TEXTO PLANILHA");
	}
		
	public String toString() {
		return "String PLANILHA";
	}
	
}