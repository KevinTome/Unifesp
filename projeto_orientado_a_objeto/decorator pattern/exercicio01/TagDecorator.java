package decorator;


public class TagDecorator extends Decorator {

	public TagDecorator(TextComponent decorates) {
		super(decorates);
	}

	@Override
	public String getTexto() {
		return "<b>" + super.getTexto() + "</b>";
	}
	
}