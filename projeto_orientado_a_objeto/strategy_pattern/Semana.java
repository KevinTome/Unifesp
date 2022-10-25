
public class Semana {

	private Strategy strategy;

	public void setStrategy(Strategy strategy) {
		this.strategy = strategy;
	}
	
	public void Acao() {
		strategy.Acao();
	}
	
}
