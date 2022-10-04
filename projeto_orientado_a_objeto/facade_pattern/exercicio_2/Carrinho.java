import java.util.ArrayList;
import java.util.List;

public class Carrinho {

	private List<Produto> produtos;
	
	private Carrinho() {
		this.produtos = new ArrayList<Produto>();
	}
	
	public static Carrinho create() {
		Carrinho carrinho = new Carrinho();
		return carrinho;
	}
	
	public void adicionar(Produto p) {
		this.produtos.add(p);
	}
	
	public double getTotal() {
		double total = 0;
		
			for(Produto p: this.produtos) {
				total+=p.getPreco();
			}			
		
		return total;
	}
	
	public List<Produto> getProdutos() {
		return this.produtos;
	}
}
