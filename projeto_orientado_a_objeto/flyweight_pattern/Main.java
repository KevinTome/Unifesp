import java.util.ArrayList;
import java.util.List;
import java.math.*;

public class Main {

	public static void main(String[] args) {
						
		// Lista com os algarismos em mem�ria
		List<IntFlyweight> integersEmMemoria = new ArrayList<>();
		int algarismo;
		
		// Gera 10 n�meros
		for (int i = 0; i < 10; i++) {
			  System.out.println("Numero: " + (i + 1));
			  
			  // Cada um com 10 algarismos
			  for (int j = 0; j < 10; j++) {
				  algarismo = (int) Math.round(Math.random() * 10);
				  
				  // Adiciona o algarismo em mem�ria caso ele n�o esteja armazenado
				  integersEmMemoria.add(IntFactory.getFlyweight(algarismo));
				  
				  // Printa
				  System.out.print(algarismo);
			}
		System.out.println("\n");		
		}	
	}
}
