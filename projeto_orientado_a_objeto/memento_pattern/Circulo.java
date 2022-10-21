
public class Circulo implements Figura, Cloneable {

	private double raio;
	
	public Circulo(int raio) {
		this.raio = raio;
	}

	@Override
	public String getArea() {
		return "Círculo: Raio: " + raio + " Área:  pi.r² -> " + 3.14 * raio;
	}

	protected Object clone() throws CloneNotSupportedException{
		return super.clone();
	}
	
}
