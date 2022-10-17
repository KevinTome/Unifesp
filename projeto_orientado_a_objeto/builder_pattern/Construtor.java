
public interface Construtor {
	
	public void pessoaNova(String nome, String identidade);
	public String pessoaGetNome();
	public String pessoaGetIdentidade();	
	
	public void empresaNova(String nomeEmpresa, String nomeResponsavel, String identificacaoResponsave);
	public String empresaGetNome();
	public String empresaGetResponsavel();
	
}
