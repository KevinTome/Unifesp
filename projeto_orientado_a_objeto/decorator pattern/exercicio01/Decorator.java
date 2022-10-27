package decorator;

import decorator.TextComponent;

public abstract class Decorator extends TextComponent{

	private TextComponent component;
	
	public Decorator(TextComponent decorates) {
		this.component = decorates;
	}
	
	public String getTexto() {
		return component.getTexto();
	}	  
	
}
