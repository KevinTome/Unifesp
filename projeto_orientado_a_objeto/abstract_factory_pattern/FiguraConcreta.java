
public class FiguraConcreta extends Figura{
	private double ponto1 = 0, ponto2 = 0, ponto3 = 0, raio = 0;
	private String nome;
	
	public FiguraConcreta(String nome, double ponto1, double ponto2, double ponto3, double raio) {
		this.nome = nome;
		this.ponto1 = ponto1;
		this.ponto2 = ponto2;
		this.ponto3 = ponto3;
		this.raio = raio;
	}

	@Override
	public String getNome() {
		return this.nome;
	}

	@Override
	public String getMedidas() {	
		String medidas = "- Medidas: ";
		;
		if (this.ponto1 != 0) {
			medidas = medidas + String.valueOf(this.ponto1) + " ";			
		}
		if (this.ponto2 != 0) {
			medidas = medidas + String.valueOf(this.ponto2) + " ";			
		}

		if (this.ponto3 != 0) {
			medidas = medidas + String.valueOf(this.ponto3) + " ";			
		}

		if (this.raio != 0) {
			medidas = medidas + String.valueOf(this.raio);			
		}
		
		return medidas;
	}

}
