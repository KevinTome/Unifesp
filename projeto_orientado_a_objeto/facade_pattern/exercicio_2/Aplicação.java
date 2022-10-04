
public class Aplicação {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		Facade f = new Facade(); // Obtem instancia f
		
		f.registrar("Pedro", 12);
		f.comprar(1, 12);
		f.comprar(4, 12);
		f.fecharCompra(12);
	}

}
