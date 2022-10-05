//Classe Cliente - Constroi o cliente e o atrela ao seu carrinho

public class Cliente {
	long id;
	String nome;
	Carrinho carrinhoCliente;
	
    public Cliente(long id, String nome) {
	        this.id = id;
	        this.nome = nome;
	}

	public Carrinho getCarrinhoCliente() {
		return carrinhoCliente;
	}

	public void setCarrinhoCliente(Carrinho carrinhoCliente) {
		this.carrinhoCliente = carrinhoCliente;
	}
	
	
	
	
}