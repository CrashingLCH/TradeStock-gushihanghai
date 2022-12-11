package jdbc_trade;

public class STrade {
	protected String name;
	protected String code;
	protected double nprice;
	protected double sell;
	protected int snum;
	protected int mnum;
	protected String wttime;
	protected String zt;
	protected double shiz;
	protected double yingk;
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getCode() {
		return code;
	}
	public void setCode(String code) {
		this.code = code;
	}
	public double getNprice() {
		return nprice;
	}
	public void setNprice(double nprice) {
		this.nprice = nprice;
	}
	public double getSell() {
		return sell;
	}
	public void setSell(double sell) {
		this.sell = sell;
	}
	public int getSnum() {
		return snum;
	}
	public void setSnum(int snum) {
		this.snum = snum;
	}
	public int getMnum() {
		return mnum;
	}
	public void setMnum(int mnum) {
		this.mnum = mnum;
	}
	public String getWttime() {
		return wttime;
	}
	public void setWttime(String wttime) {
		this.wttime = wttime;
	}
	public String getZt() {
		return zt;
	}
	public void setZt(String zt) {
		this.zt = zt;
	}
	public double getShiz() {
		return shiz;
	}
	public void setShiz(double shiz) {
		this.shiz = shiz;
	}
	public double getYingk() {
		return yingk;
	}
	public void setYingk(double yingk) {
		this.yingk = yingk;
	}
	public String toString() {
		return 
				"code='" + code +'\'' +
				",name='" + name + '\'' +
				",nprice='" + nprice + '\'' +
				",sell='" + sell + '\'' +
				",snum='" + snum + '\''+
				",mnum='" + mnum + '\''+
				",wttime='" + wttime + '\''+
				",zt='" + zt +'\''+
				",shiz='" + shiz + '\''+
				",yingk='" + yingk + '\''
				;
	}

}
