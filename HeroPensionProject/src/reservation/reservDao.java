package reservation;

public class reservDao implements IreservDao {
	
	private static reservDao resDao = null;
	
	public reservDao() {}
	
	// singleton 생성
	public static reservDao getInstance() {
		if (resDao == null) {
			resDao = new reservDao();
		}
		return resDao;		
	}
	
	

}
