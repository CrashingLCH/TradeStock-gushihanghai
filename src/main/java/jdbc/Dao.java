package jdbc;

public interface Dao {
	
	public boolean save(User user);
    public boolean checkLogin(String username, String password);
}
