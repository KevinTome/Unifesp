package main;

import java.util.ArrayList;
import java.util.List;

public class BancoDeDados {
	
	private static List<Turma> turmas = new ArrayList<Turma>();
	private static List<Aluno> alunos = new ArrayList<Aluno>();

	public static Turma getTurmaByCodigo(String codTurma) {
		for(Turma turma: turmas ) {
			if(turma.getCodigo() == codTurma) return turma;
		}
		
		return null;
	}
	
	public static Aluno getAlunoByMatricula(String matriculaAluno) {
		for(Aluno aluno: alunos ) {
			if(aluno.getMatricula() == matriculaAluno) return aluno;
		}
		
		return null;
	}
	
	public static void addTurma(Turma turma) {
		turmas.add(turma);
	}
	
	public static void addAluno(Aluno aluno) {
		alunos.add(aluno);
	}
	
}
