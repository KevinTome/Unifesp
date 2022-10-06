public class PCDData extends PCDObservado 
{
	private float Temp;
	private float pA; 
	private int ph;

	public PCDData(float temp, float pa, int ph)
	{
		super();
		this.Temp = temp;
		this.pA = pa;
		this.ph = ph;
	}

        public void setTemp(float Temp) {
		this.Temp = Temp;
	}

	public float getTemp() {
		return Temp;
	}

        public void setPA(float pA) {
		this.pA = pA;
	}
	
	public float getPA() {
		return pA;
	}
        
        public void setPH(int ph) {
		this.ph = ph;
	}

	public int getPH() {
		return ph;
	}

	
	
	
	
}