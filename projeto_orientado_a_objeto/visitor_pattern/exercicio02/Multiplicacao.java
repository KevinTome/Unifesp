
public class Multiplicacao extends Operacao{

	private int resultado;
	
	@Override
	public void Calcular(int A, int B) {
		this.resultado = A * B;
	}

	@Override
	public String Imprimir() {		
		return "O resultado é: " + String.valueOf(this.resultado);
	}

	@Override
	public Object aceitar(Visitante v) {
		return v.visitar(this);
	}

}
