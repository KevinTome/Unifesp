package main;

import java.util.List;

public class Aplicacao {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		
		
		
		
		Facade f = new Facade();
		
		f.popularInformacoes(); // adicionando turmas e alunos estaticamente (seriam puxados do BD)
		f.matricular("135540", "POO I", "POO");
		f.matricular("140000", "POO I", "POO");
		f.exibirStatus("POO I");
		
	}
	
	

}
