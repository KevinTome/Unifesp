
public class main {

	public static void main(String[] args) {
		AbstractList lista = new ListaFiguras();
		lista.appent("Quadrado");
		lista.appent("Tri�ngulo");
		lista.appent("Ret�ngulo");
		
		for(Object object : lista) {
			System.out.println(object);
		}
	}

}
