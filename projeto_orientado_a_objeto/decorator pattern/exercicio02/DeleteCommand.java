package command2;

public class DeleteCommand implements Command{

	@Override
	public void execute(String[] parametros) {
		pessoa.delete(Integer.parseInt(parametros[0]));
	}

}
