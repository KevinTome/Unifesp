package main;

import java.util.ArrayList;
import java.util.List;

public class Turma {

	private Curso curso;
	private List<Aluno> alunos = new ArrayList<Aluno>();
	private String codigo;
	
	private Turma() {}
	
	public static Turma create() {
		return new Turma();
	}
	
	public void setCurso(Curso curso) {
		this.curso = curso;
	}
	
	public void setCodigo(String codigo) {
		this.codigo = codigo;
	}
	
	public void addAluno(Aluno aluno) {
		this.alunos.add(aluno);
	}
	
	public Curso getCurso() {
		return this.curso;
	}
	
	public List<Aluno> getAlunos() {
		return this.alunos;
	}
	
	public String getCodigo() {
		return this.codigo;
	}
}
