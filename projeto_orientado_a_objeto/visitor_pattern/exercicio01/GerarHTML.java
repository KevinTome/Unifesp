
public class GerarHTML implements Visitante {
	public Object visitar(Planilha p) {
		p.gerarHTML(); return null; 
	}
	
	public Object visitar(Texto t) {
		t.gerarHTML(); 
		return null; 
		}
	
	public Object visitar(Grafico g) {
		g.gerarPNG(); 
		return null; 
	}
	
}