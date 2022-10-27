package command2;
import java.util.Scanner;

public class Main {

	public static void main(String[] args) {

		Reader RD = new Reader();
		
		while(true){
			String comando;
			System.out.println("");
		    Scanner oScanner = new Scanner(System.in);
		    comando = oScanner.nextLine();
		    
		    RD.setComando(comando);
			Invoker.invoke(RD.read());

			if(comando.equals("exit"))
				break;
		}
	}
}
