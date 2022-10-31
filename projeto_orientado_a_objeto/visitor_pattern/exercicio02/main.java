
public class main {

	public static void main(String[] args) {
		Operacao OP = new Adicao();
		OP.aceitar(new RealizarOperacao(10, 20));		
		if (((Boolean)OP.aceitar(new Validar())).booleanValue()) {
			System.out.println(OP.Imprimir());
		}
		
		OP = new Multiplicacao();
		OP.aceitar(new RealizarOperacao(10, 20));		
		if (((Boolean)OP.aceitar(new Validar())).booleanValue()) {
			System.out.println(OP.Imprimir());
		}
		
	}
}
