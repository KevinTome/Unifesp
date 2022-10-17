
public class ConstrutorConcreto implements Construtor  {
	
	private Pessoa pessoa;
	private Empresa empresa;
	
	@Override
	public void pessoaNova(String nome, String identidade) {
		this.pessoa = new Pessoa(nome, identidade);
	}
	
	@Override
	public String pessoaGetNome() {
		return this.pessoa.getNome();		
	}

	@Override
	public String pessoaGetIdentidade() {
		return this.pessoa.getIdentidade();			
	}

	@Override
	public void empresaNova(String nomeEmpresa, String nomeResponsavel, String identificacaoResponsavel) {		
		Pessoa responsavel = new Pessoa(nomeResponsavel, identificacaoResponsavel);
		this.empresa = new Empresa(nomeEmpresa, responsavel);
	}
		
	@Override
	public String empresaGetNome() {
		return this.empresa.getNome();			
	}

	@Override
	public String empresaGetResponsavel() {
		return this.empresa.getResponsavel();	
	}

}
