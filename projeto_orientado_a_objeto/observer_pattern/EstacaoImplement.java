public class EstacaoImplement implements EstacaoObserver
{
	String nome;
	public EstacaoImplement(String nome)
	{
		this.nome = nome;
	}
	@Override
	public void update(PCDObservado pcd, String alt)
	{
		PCDData pcdData = (PCDData) pcd;
		System.out.println(nome + " recebendo notificação " +
						alt + " alterado");
		
		System.out.println(pcdData.getPH() + " " +
				pcdData.getPA() + " " +
				pcdData.getTemp());
	
	}
	
}