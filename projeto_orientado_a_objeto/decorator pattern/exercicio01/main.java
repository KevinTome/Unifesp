package decorator;

public class main {
	
	public static void main(String[] args) {
		
		Texto txt = new Texto("texto");
		CapsDecorator caps = new CapsDecorator(txt);
		InvertidoDecorator inverse = new InvertidoDecorator(txt);
		TagDecorator tag = new TagDecorator(txt);
		
		System.out.println(caps.getTexto());
		System.out.println(inverse.getTexto());
		System.out.println(tag.getTexto());
		
		inverse = new InvertidoDecorator(caps);
		tag = new TagDecorator(inverse);

		System.out.println(tag.getTexto());	
	}	
}
