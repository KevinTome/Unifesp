
public class Pessoa {
	
	private String Nome, Identidade;
	
	public Pessoa(String nome, String identidade) {
		this.Nome = nome;
		this.Identidade = identidade;		
	}

	public String getNome() {
		return Nome;
	}

	public void setNome(String nome) {
		Nome = nome;
	}

	public String getIdentidade() {
		return Identidade;
	}

	public void setIdentidade(String identidade) {
		Identidade = identidade;
	}
	
}
