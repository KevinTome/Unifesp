import java.util.Arrays;
import java.util.Collections;

public class Main {

	public static void main(String[] args) {
		
		String[] palavras = { "Jato", "Piranha", "Diagrama", "Ver", "Trombone" };
		
		Arrays.sort(palavras);
		System.out.println("Ordem Crescente: ");
		print(palavras);
		
		Arrays.sort(palavras, Collections.reverseOrder());
		System.out.println("\nOrdem Decrescente: ");
		print(palavras);
		
	}
	
	public static void print(String[] palavras) {
		for (String palavra : palavras) {
			System.out.println(palavra);
		}
	}

}
