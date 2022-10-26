package command2;

import java.util.HashMap;
import java.util.Map;

public class Pessoas {
	
	private Map<Integer, String> pessoas = new HashMap<Integer, String>();
	
	public void insert(int ID, String nome) {
		pessoas.put(ID, nome);  
		System.out.println("Registro inserido com sucesso!");
	}

	public void delete(int ID) {
		pessoas.remove(ID);
		System.out.println("Registro excluído com sucesso!");
	}
	
	public void all() {
		for (Integer ID: pessoas.keySet()) {
		    System.out.println(ID.toString() + " " + pessoas.get(ID).toString());
		}
	}
	
	public void get(int ID) {
		System.out.println(ID + " " + pessoas.get(ID).toString());
	}
	
}
