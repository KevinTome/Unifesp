
public class Circulo implements Figura{

	private double raio;
	
	public Circulo(int raio) {
		this.raio = raio;
	}

	@Override
	public String getArea() {
		return "C�rculo: Raio: " + raio + " �rea:  pi.r� -> " + 3.14 * raio;
	}

}
