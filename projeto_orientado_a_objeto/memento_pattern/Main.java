
public class Main {

	public static void main(String[] args) throws CloneNotSupportedException {
		
		Figura Circulo = Factory.criaFigura(1);
		CareTaker CtCirculo = new CareTaker(Circulo);
		System.out.println(Circulo.getArea());
		
		Circulo Copia = (Circulo) ((Circulo) Circulo).clone();
		System.out.println(Copia.getArea());
		
	}
}

