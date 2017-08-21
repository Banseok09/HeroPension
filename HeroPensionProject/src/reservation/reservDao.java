package reservation;

public class reservDao implements IreservDao {
	
	private static reservDao resDao = null;
	
	public reservDao() {}
	
	// singleton »ý¼º
	public static reservDao getInstance() {
		if (resDao == null) {
			resDao = new reservDao();
		}
		return resDao;		
	}
	
	

}
