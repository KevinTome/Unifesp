
public class Triangulo implements Figura{

	private double lado;

	public Triangulo(int lado) {
		this.lado = lado;
	}
	
	@Override
	public String getArea() {
		return "Triangulo Equilátero: Lado: " + lado + " Área: (l²(3)^(1/2))/4 -> " + lado * lado * Math.pow(3.0,(1.0/2.0)) / 4;
	}

}
