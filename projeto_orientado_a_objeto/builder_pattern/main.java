
public class main {

	public static void main(String[] args) {
		
		ConstrutorConcreto C1 = new ConstrutorConcreto();

		C1.pessoaNova("Maria", "123456");
		C1.empresaNova("ProjOO LTDA", "João", "654321");
				
		System.out.println("Pessoa construída: " + C1.pessoaGetNome() + " ID: " + C1.pessoaGetIdentidade());		
		System.out.println("Empresa construída: " + C1.empresaGetNome() + " " + C1.empresaGetResponsavel());	

	}

}
