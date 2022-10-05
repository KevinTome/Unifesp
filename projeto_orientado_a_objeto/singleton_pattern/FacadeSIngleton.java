//Classe FacadeSingleton - antiga classe facade, agora transformada em singleton
//vou deixar o exercicio 5.2 junto com o 5.1 para testar tudo em um main

public class FacadeSingleton {
	private BancoDeDados banco;
	private static FacadeSingleton facade;
	
	public static FacadeSingleton getFacade() {
		//estrutura do singleton para limitar o nº de instancias
		if (facade == null)
			facade = new FacadeSingleton();
		
		return facade;
	}
	
        public void registrar(int id, String nome) {
	        Cliente c = new Cliente(id, nome);
		Carrinho carrinho = new Carrinho();
		
		c.setCarrinhoCliente(carrinho);
	}
	
	public void comprar(Produto p, long codCliente) {
		banco.selectCliente(codCliente);
		Cliente c = new Cliente("teste_1", codCliente);
		
		c.getCarrinhoCliente().adicionar(p);
	}
	
	public void fecharCompra(long codCliente) {
		banco.selectCliente(codCliente);
		Cliente c = new Cliente("teste_2", codCliente);
		
		double total = c.getCarrinhoCliente().getTotal();
		banco.processarPagamento();
	}
}