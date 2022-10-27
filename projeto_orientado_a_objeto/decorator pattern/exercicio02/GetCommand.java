package command2;

public class GetCommand implements Command{

	@Override
	public void execute(String[] parametros) {
		pessoa.get(Integer.parseInt(parametros[0]));
	}

}
