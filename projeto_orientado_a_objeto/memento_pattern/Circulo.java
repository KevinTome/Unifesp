
public class Circulo implements Figura, Cloneable {

	private double raio;
	
	public Circulo(int raio) {
		this.raio = raio;
	}

	@Override
	public String getArea() {
		return "C�rculo: Raio: " + raio + " �rea:  pi.r� -> " + 3.14 * raio;
	}

	protected Object clone() throws CloneNotSupportedException{
		return super.clone();
	}
	
}
