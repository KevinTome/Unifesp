//Classe Produto - Cria um produto e atrela-se seu preço

public class Produto {
	long id;
	String nome;
	double preco;
	
	public Produto(long id, String nome, float preco) {
		this.id = id;
		this.nome = nome;
		this.preco = preco;
	}

	public double getPreco() {
		return preco;
	}
}