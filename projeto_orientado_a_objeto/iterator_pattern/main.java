
public class main {

	public static void main(String[] args) {
		AbstractList lista = new ListaFiguras();
		lista.appent("Quadrado");
		lista.appent("Triângulo");
		lista.appent("Retângulo");
		
		for(Object object : lista) {
			System.out.println(object);
		}
	}

}
