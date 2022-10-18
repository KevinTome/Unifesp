
public class Main {

	public static void main(String[] args) {
		
		Figura Circulo = Factory.criaFigura(1);
		System.out.println(Circulo.getArea());
		
		Figura Quadrado = Factory.criaFigura(2);
		System.out.println(Quadrado.getArea());
		
		Figura Triangulo = Factory.criaFigura(3);
		System.out.println(Triangulo.getArea());
		
	}
}


