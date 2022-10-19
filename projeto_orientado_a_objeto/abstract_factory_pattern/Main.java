
public class Main {

	public static void main(String[] args) {
		
		Figura Circulo = Factory.criaFigura(1);
		System.out.println(Circulo.getNome() + " " + Circulo.getMedidas());
		
		Figura Quadrado = Factory.criaFigura(2);
		System.out.println(Quadrado.getNome() + " " + Quadrado.getMedidas());
		
		Figura Triangulo = Factory.criaFigura(3);
		System.out.println(Triangulo.getNome() + " " + Triangulo.getMedidas());
		
	}
}


