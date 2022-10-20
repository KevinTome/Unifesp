
public class Quadrado implements Figura, Cloneable {
	
	private double lado;
	
	public Quadrado(int lado) {
		this.lado = lado;
	}
	
	@Override
	public String getArea() {
		return "Quadrado: Lado: " + lado + " Área:  L² -> " + lado * lado;
	}

	protected Object clone() throws CloneNotSupportedException{
		return super.clone();
	}
}
