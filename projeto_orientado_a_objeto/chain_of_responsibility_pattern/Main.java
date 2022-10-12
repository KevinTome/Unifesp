import java.util.*;  

public class Main {

	public static void main(String[] args) {
		
		Chain Elo1 = new EstatisticaEspaco();
		Chain Elo2 = new EstatisticaA();
		Chain Elo3 = new EstatisticaPontos();		
		
		Elo1.adicionaElo(Elo2);
		Elo2.adicionaElo(Elo3);
				
		Scanner oScanner = new Scanner(System.in);
		System.out.print("Informe o texto: ");  
		String requisicao = oScanner.nextLine();       
		
		Elo1.executa(requisicao);
		
	}
}
