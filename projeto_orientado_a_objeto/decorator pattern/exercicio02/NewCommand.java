package command2;

public class NewCommand implements Command{

	@Override
	public void execute(String[] parametros) {
		pessoa.insert(Integer.parseInt(parametros[0]), parametros[1]);		
	}

}
