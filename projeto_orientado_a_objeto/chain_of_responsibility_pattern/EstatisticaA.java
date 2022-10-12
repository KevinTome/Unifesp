
public class EstatisticaA implements Chain{

	private Chain proximoElo;
	
	public void adicionaElo(Chain proximoElo) {		
		this.proximoElo = proximoElo;		
	}
	
	public void executa(String requisicao) {
		
		System.out.println("\nEstatísticas do dígito: A");
		
		 int ocorrencias = 0;

		 for(int i=0; i < requisicao.length(); i++){    
			 if(Character.toUpperCase(requisicao.charAt(i)) == 'A')
				 ocorrencias++;
		 }		
		 
		 float porcentagem = (float) (ocorrencias * 100.0 / requisicao.length());
		 
		 System.out.println("Aparece " + String.valueOf(ocorrencias) + " vezes.");
		 System.out.println("Isso corresponde a " + String.format("%.02f", porcentagem) + "% do texto.");	
		 
		 this.proximoElo.executa(requisicao);
	}
}