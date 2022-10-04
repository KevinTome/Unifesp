import java.io.BufferedReader;
import java.io.File;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

public class BancoDeDados {
	
	private static String nomeArquivoClientes = "clientes.ser";
	private static List<Cliente> clientes;
	
	private static String nomeArquivoProdutos = "produtos.ser";
	private static List<Produto> produtos;

	public static Cliente selectCliente(int id) {
		if(clientes == null) clientes = carregarClientes();

			for(Cliente c: clientes) {
				if(c.getId() == id) {
					return c;
				}
			}
		
		return null;
	}
	
	public static Produto selectProduto(int id) {
		if(produtos == null) produtos = carregarProdutos();

		for(Produto p: produtos) {
			if(p.getId() == id) return p;
		}
		
		return null;
	}
	
	public static void processarPagamento(Cliente cliente) {
		System.out.println("Processando pagamento de " + cliente.getNome() + ":\n");
		
		for(Produto produto: cliente.getCarrinho().getProdutos()) {
			System.out.println(produto.getNome() + ": " + produto.getPreco());
		}
		
		System.out.println("valor total da compra: " + cliente.getCarrinho().getTotal() + "");
	}
	
	private static List<Cliente> carregarClientes() {
	    List<Cliente> cadastro = new ArrayList<Cliente>();
	    
	    try {
	      File f = new File(nomeArquivoClientes);
	      if (!f.exists())
	        return cadastro;
	      
	      BufferedReader csvReader = new BufferedReader(new FileReader(nomeArquivoClientes));
	      String row;
	      while ((row = csvReader.readLine()) != null) {
	        String[] dados = row.split(",");
	        
	        Cliente cliente = Cliente.create(dados[0], Integer.parseInt(dados[1]));
	        Carrinho carrinho = Carrinho.create();
	        cliente.adicionarCarrinho(carrinho);
	        
	        cadastro.add(cliente);
	      }
	      csvReader.close();

	    } catch (IOException ex) {
	      System.out.println("IOException lançada");
	    }
	    return cadastro;
	}
	
	private static List<Produto> carregarProdutos() {
	    List<Produto> cadastro = new ArrayList<Produto>();
	    
	    try {
	      File f = new File(nomeArquivoProdutos);
	      if (!f.exists())
	        return cadastro;
	      
	      BufferedReader csvReader = new BufferedReader(new FileReader(nomeArquivoProdutos));
	      String row;
	      while ((row = csvReader.readLine()) != null) {
	        String[] dados = row.split(",");
	        
	        Produto produto = Produto.create(dados[0], Integer.parseInt(dados[1]), Double.parseDouble(dados[2]));
	        
	        cadastro.add(produto);
	      }
	      csvReader.close();

	    } catch (IOException ex) {
	      System.out.println("IOException lançada");
	    }
	    return cadastro;
	}
	
	public static void addCliente(Cliente cliente) {
		if(clientes == null) clientes = carregarClientes();

		if(selectCliente(cliente.getId()) == null) {
			clientes.add(cliente);
			salvarClientes();
		}
		
	}
	
	private static void salvarClientes() {
		try {
			File f = new File(nomeArquivoClientes);
			if (!f.exists())
			f.createNewFile();
			FileWriter csvWriter = new FileWriter(nomeArquivoClientes);
			for (Cliente c : clientes) {
				csvWriter.append(c.getNome() + ",");
				csvWriter.append(c.getId() + "\n");
			}
			csvWriter.close();
		} catch (IOException ex) {
			System.out.println("IOException lançada.");
			ex.printStackTrace();
		}
	}
	
}
