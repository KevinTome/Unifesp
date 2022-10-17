
public class Empresa {

	private String Nome;
	private Pessoa Responsavel;
	
	public Empresa(String nome, Pessoa responsavel) {
		this.Nome = nome;
		this.Responsavel = responsavel;		
	}

	public String getNome() {
		return Nome;
	}

	public void setNome(String nome) {
		Nome = nome;
	}

	public String getResponsavel() {
		return "Responsável: " + Responsavel.getNome() + " ID: " + Responsavel.getIdentidade();
	}

	public void setResponsavel(Pessoa responsavel) {
		Responsavel = responsavel;
	}
	
}
