
public class main {

	public static void main(String[] args) {
		
		ConstrutorConcreto C1 = new ConstrutorConcreto();

		C1.pessoaNova("Maria", "123456");
		C1.empresaNova("ProjOO LTDA", "Jo�o", "654321");
				
		System.out.println("Pessoa constru�da: " + C1.pessoaGetNome() + " ID: " + C1.pessoaGetIdentidade());		
		System.out.println("Empresa constru�da: " + C1.empresaGetNome() + " " + C1.empresaGetResponsavel());	

	}

}
