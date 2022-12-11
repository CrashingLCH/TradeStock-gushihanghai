package jdbc_trade;

public class Trade {
	protected String name;
	protected String code;
	protected String raterf;
	protected String updn;
	protected double nprice;
	protected double cost;
	protected int snum;
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
	public String getRaterf() {
		return raterf;
	}
	public void setRaterf(String raterf) {
		this.raterf = raterf;
	}
	public String getUpdn() {
		return updn;
	}
	public void setUpdn(String updn) {
		this.updn = updn;
	}
	public double getNprice() {
		return nprice;
	}
	public void setNprice(double nprice) {
		this.nprice = nprice;
	}
	public double getCost() {
		return cost;
	}
	public void setCost(double cost) {
		this.cost = cost;
	}
	public int getSnum() {
		return snum;
	}
	public void setSnum(int snum) {
		this.snum = snum;
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
	@Override
	public String toString() {
		return 
				"code='" + code +'\'' +
				",name='" + name + '\'' +
				",raterf='" + raterf + '\'' +
				",updn='" + updn + '\'' +
				",nprice='" + nprice + '\'' +
				",cost='" + cost + '\'' +
				",snum='" + snum + '\''+
				",wttime='" + wttime + '\''+
				",zt='" + zt +'\''+
				",shiz='" + shiz + '\''+
				",yingk='" + yingk + '\''
				;
	}
}
