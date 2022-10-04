package main;

import java.util.List;

public class Facade {

	public Facade() {}
	
	
	public void matricular(String matriculaAluno, String codTurma, String nomeCurso) {
		Turma turma = BancoDeDados.getTurmaByCodigo(codTurma);
		if(turma == null) {
			 turma = Turma.create();
			 Curso curso = Curso.create();
			 
			 curso.setNome(nomeCurso);
			 turma.setCurso(curso);
		}
		
		Aluno aluno = BancoDeDados.getAlunoByMatricula(matriculaAluno);
		if(aluno == null) {
			System.out.println("Aluno não encontrado");
			return;
		}
		
		
		turma.addAluno(aluno);
	}
	
	public void exibirStatus(String codTurma) {
		Turma turma = BancoDeDados.getTurmaByCodigo(codTurma);
		
		System.out.println("--------------------");
		System.out.println("Curso: " + turma.getCurso().getNome());
		System.out.println("Código da turma: " + turma.getCodigo());
		
		List<Aluno> alunos = turma.getAlunos();

		for(Aluno aluno: alunos ) {
			System.out.println("\nNome: " + aluno.getNome());
			System.out.println("Matricula: " + aluno.getMatricula());
		}
		System.out.println("--------------------");
	}
	
	public void popularInformacoes() {
		//criando alguns alunos que seriam puxados do banco de dados
		Aluno pedro = Aluno.create("Pedro", "135540");
		BancoDeDados.addAluno(pedro);
		Aluno joao = Aluno.create("João", "140000");
		BancoDeDados.addAluno(joao);
		
		//criando turma que seria puxada do banco de dados
		Curso poo = Curso.create();
		poo.setNome("POO");
		Turma turmaPoo = Turma.create();
		turmaPoo.setCurso(poo);
		turmaPoo.setCodigo("POO I");
		BancoDeDados.addTurma(turmaPoo);
	}

	
}
