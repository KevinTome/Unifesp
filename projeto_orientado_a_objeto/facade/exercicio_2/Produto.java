
public class Produto {
	
	private String nome;
	private int id;
	private double preco; 

	private Produto(String nome, int id, double preco) {
		this.nome = nome;
		this.id = id;
		this.preco = preco;
	}
	
	public static Produto create(String nome, int id,double preco) {
		Produto produto = new Produto(nome, id, preco);
		
		return produto;
	}
	
	public double getPreco() {
		return this.preco;
	}
	
	public int getId() {
		return this.id;
	}
	
	public String getNome() {
		return this.nome;
	}
}
