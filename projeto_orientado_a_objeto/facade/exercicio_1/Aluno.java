package main;

public class Aluno {
	private String nome;
	private String matricula;
	
	private Aluno() {}
	
	public static Aluno create(String nome, String matricula) {
		Aluno aluno = new Aluno();
		
		aluno.setNome(nome);
		aluno.setMatricula(matricula);
		return aluno;
	}
	
	public String getNome() {
		return this.nome;
	}
	
	public String getMatricula() {
		return this.matricula;
	}
	
	public void setNome(String nome) {
		this.nome = nome;
	}
	
	public void setMatricula(String matricula) {
		this.matricula = matricula;
	}
	
}
