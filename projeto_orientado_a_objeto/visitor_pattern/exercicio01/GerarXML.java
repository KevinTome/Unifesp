
public class GerarXML implements Visitante {
	public Object visitar(Planilha p) {
		p.gerarXML(); return null; 
	}
	
	public Object visitar(Texto t) {
		t.gerarXML(); 
		return null; 
		}
	
	public Object visitar(Grafico g) {
		g.gerarPNG(); 
		return null; 
	}
	
}