
public class Grafico implements Documento {
	public Object aceitar(Visitante v) {
		return v.visitar(this);
	}
	
	public void gerarPNG() {
		System.out.println("GERADO PNG GRAFICO");
	}
	
	public String toString() {
		return "String GRÁFICO";
	}
	
}