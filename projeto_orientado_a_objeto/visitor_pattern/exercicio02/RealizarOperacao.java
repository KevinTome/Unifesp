
public class RealizarOperacao implements Visitante {
	
	private int A, B;
	
	public RealizarOperacao(int A, int B) {
		this.A = A;
		this.B = B;
	}

	
	@Override
	public Object visitar(Adicao a) {
		a.Calcular(A, B);
		return null;
	}

	@Override
	public Object visitar(Multiplicacao m) {
		m.Calcular(A, B);
		return null;
	}
	
}