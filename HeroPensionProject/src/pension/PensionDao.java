package pension;

public class PensionDao implements IPensionDao {
	
	private static PensionDao pendao = null;
	
	public PensionDao() { 	}
	
	public static PensionDao getInstance() {
		if(pendao == null){
			pendao = new PensionDao();
		}
		return pendao;
	}

}
