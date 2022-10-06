//Nomes: Kevin Tomé 135065
//       Vitor Carvalho 111840

public class classMain 
{
	public static void main(String[] args) 
	{
		EstacaoObserver EstSP = new EstacaoImplement("EstSP");
		EstacaoObserver EstRJ = new EstacaoImplement("EstRJ");
		EstacaoObserver EstMG = new EstacaoImplement("EstMG");
                EstacaoObserver EstPR = new EstacaoImplement("EstPR");
                EstacaoObserver EstSC = new EstacaoImplement("EstSC");
                EstacaoObserver EstMT = new EstacaoImplement("EstMT");
                EstacaoObserver EstAM = new EstacaoImplement("EstAM");
                EstacaoObserver EstPA = new EstacaoImplement("EstPA");
                EstacaoObserver EstBA = new EstacaoImplement("EstBA");
                EstacaoObserver EstPE = new EstacaoImplement("EstPE");
		
		PCDData pcd1 = new PCDData(24, 5, 2);
		PCDData pcd2 = new PCDData(24, 5, 3);
		
		pcd1.add(EstSP);
		pcd1.add(EstRJ);
		pcd1.add(EstMG);
                pcd1.add(EstPR);
                pcd1.add(EstSC);
                pcd1.add(EstMT);
                pcd1.add(EstAM);
                pcd1.add(EstPA);
                pcd1.add(EstBA);
                pcd1.add(EstPE);
		
		pcd1.setPH(4);
		pcd1.notifyObserver("ph");
		
		pcd2.add(EstMG);
		pcd2.add(EstRJ);
                pcd2.add(EstSC);
                pcd2.add(EstBA);
                pcd2.add(EstAM);
		pcd2.setPA(12);
		pcd2.notifyObserver("pA");
		
	}
	
	
}