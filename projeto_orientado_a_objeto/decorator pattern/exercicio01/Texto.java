package decorator;

public class Texto extends TextComponent{

	private String Texto;
	
	public Texto(String Texto) {
		this.Texto = Texto;
	}

	@Override
	public String getTexto() {
		return Texto;
	}

}
