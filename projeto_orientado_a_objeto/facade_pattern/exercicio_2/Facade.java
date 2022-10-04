public class Facade {
	
	public void registrar(String nome, int id) {
		Cliente cliente = Cliente.create(nome, id);
		Carrinho carrinho = Carrinho.create();
		
		cliente.adicionarCarrinho(carrinho);
		
 		BancoDeDados.addCliente(cliente);		
	}
	
	public void comprar(int prodID, int clienteID) {
		Cliente cliente = BancoDeDados.selectCliente(clienteID);
		Produto produto = BancoDeDados.selectProduto(prodID);
		
		cliente.getCarrinho().adicionar(produto);
	}
	
	public void fecharCompra(int clienteID) {
		Cliente cliente = BancoDeDados.selectCliente(clienteID);
		
		double valor = cliente.getCarrinho().getTotal();
		
		BancoDeDados.processarPagamento(cliente);
	}
	
}