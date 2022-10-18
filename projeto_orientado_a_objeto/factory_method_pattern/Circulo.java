
public class Circulo implements Figura{

	private double raio;
	
	public Circulo(int raio) {
		this.raio = raio;
	}

	@Override
	public String getArea() {
		return "Círculo: Raio: " + raio + " Área:  pi.r² -> " + 3.14 * raio;
	}

}
