package jdbc;

public class User {
	protected String username;
    protected String password;
    protected String name;
    protected String email;
    protected String sex;
    protected String img;
 
    public String getImg() {
		return img;
	}

	public void setImg(String img) {
		this.img = img;
	}

	public String getSex() {
		return sex;
	}

	public void setSex(String sex) {
		this.sex = sex;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getUsername() {
        return username;
    }
 
    public void setUsername(String username) {
        this.username = username;
    }
 
    public String getPassword() {
        return password;
    }
 
    public void setPassword(String password) {
        this.password = password;
    }
 
    @Override
    public String toString() {
        return  
                "username='" + username + '\'' +
                ", password='" + password + '\'' +
                ", name='" + name +'\''+
                ", sex='" + sex +'\''+
                ", email='" + email +'\''+
                ", img='" + img +'\''
                ;
    	}
	}
