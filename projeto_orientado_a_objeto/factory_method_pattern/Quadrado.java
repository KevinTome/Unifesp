
public class Quadrado implements Figura{
	
	private double lado;
	
	public Quadrado(int lado) {
		this.lado = lado;
	}
	
	@Override
	public String getArea() {
		return "Quadrado: Lado: " + lado + " �rea:  L� -> " + lado * lado;
	}

}
