package command2;

public class NullCommand implements Command{

	@Override
	public void execute(String[] parametros) {
		System.out.println("Comando inválido!");
	}

}
