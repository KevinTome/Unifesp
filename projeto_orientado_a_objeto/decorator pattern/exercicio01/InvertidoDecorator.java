package decorator;

public class InvertidoDecorator extends Decorator {

	public InvertidoDecorator(TextComponent decorates) {
		super(decorates);
	}

	@Override
	public String getTexto() {
		return new StringBuilder(super.getTexto()).reverse().toString();
	}
	
}