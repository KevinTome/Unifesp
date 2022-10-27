package command2;

public class Reader extends ComandoReader{

	private String Texto;
	
	@Override
	public String read() {
		return Texto;
	}

	@Override
	public void setComando(String Comando) {
		this.Texto = Comando;
	}

}
