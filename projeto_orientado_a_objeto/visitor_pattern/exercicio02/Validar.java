public class Validar implements Visitante {

	@Override
	public Object visitar(Adicao a) {
		return new Boolean(true);
	}

	@Override
	public Object visitar(Multiplicacao m) {
		return new Boolean(true);
	}
	
}