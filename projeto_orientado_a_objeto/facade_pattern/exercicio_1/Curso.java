package main;

public class Curso {

	private String nome;
	
	private Curso() {}
	
	public static Curso create() {
		return new Curso();
	}
	
	public String getNome() {
		return this.nome;
	}
	
	public void setNome(String nome) {
		this.nome = nome;
	}
}
