package command2;

import java.util.HashMap;
import java.util.Map;

public class Invoker {

	public static Map<String, Command> comandos = new HashMap<String, Command>();
	
	static {
		comandos.put("new", new NewCommand());
		comandos.put("all", new AllCommand());
		comandos.put("delete", new DeleteCommand());
		comandos.put("get", new GetCommand());
	}
	
	public static void invoke(String texto) {

		String comando, parametros[];
		int qtdEspacos = texto.length() - texto.replaceAll(" ", "").length() + 1;
		String [] input = texto.split(" ", qtdEspacos);
		
		comando = input[2];		
		parametros = new String[2];
		int j = 0;
		for(int i = 3; i < input.length; i++) {
			parametros[j] = input[i].replace(",", "");
			j++;
		}
		
		comandos.get(comando).execute(parametros);
	}
	
}
