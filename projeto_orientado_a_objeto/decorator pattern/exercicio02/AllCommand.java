package command2;

public class AllCommand implements Command{

	@Override
	public void execute(String[] parametros) {
		pessoa.all();
	}

}
