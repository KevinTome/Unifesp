package decorator;

public class CapsDecorator extends Decorator {

	public CapsDecorator(TextComponent decorates) {
		super(decorates);
	}

	@Override
	public String getTexto() {
		return super.getTexto().toUpperCase();
	}
	
}