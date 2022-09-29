
public class Cliente {
	private String nome;
	private int id;
	private Carrinho carrinho;
	
	private Cliente(String nome, int id) {
		this.nome = nome;
		this.id = id;
	}

	public static Cliente create(String nome, int id) {
		Cliente cliente = new Cliente(nome, id);
		
		return cliente;
	}
	
	void adicionarCarrinho(Carrinho c) {
		this.carrinho = c;
	}
	
	
	public Carrinho getCarrinho() {
		return this.carrinho;
	}
	
	public int getId() {
		return this.id;
	}
	
	public String getNome() {
		return this.nome;
	}
}
