package jdbc_market;

public class Stock {
	public int id;
	public String code;
	public String name;
	public String price;
	public String raterf;
	public String updn;
	public String rspeed;
	public String vratio;
	public String amplitude;
	public String turnover;
	public String tradestock;
	public String marketvalue;
	public String peratio;
//	public Stock(int id, String code, String name, String price, String raterf, String updn,
//			String rspeed, String vratio, String amplitude, String turnover, String tradestock, String marketvalue,
//			String peratio) {
//		this.id=id;
//		this.code=code;
//		this.name=name;
//		this.price=price;
//		this.raterf=raterf;
//		this.updn=updn;
//		this.rspeed=rspeed;
//		this.vratio=vratio;
//		this.amplitude=amplitude;
//		this.turnover=turnover;
//		this.tradestock=tradestock;
//		this.marketvalue=marketvalue;
//		this.peratio=peratio;
//	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getCode() {
		return code;
	}
	public void setCode(String code) {
		this.code = code;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPrice() {
		return price;
	}
	public void setPrice(String price) {
		this.price = price;
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
	public String getRspeed() {
		return rspeed;
	}
	public void setRspeed(String rspeed) {
		this.rspeed = rspeed;
	}
	public String getVratio() {
		return vratio;
	}
	public void setVratio(String vratio) {
		this.vratio = vratio;
	}
	public String getAmplitude() {
		return amplitude;
	}
	public void setAmplitude(String amplitude) {
		this.amplitude = amplitude;
	}
	public String getTurnover() {
		return turnover;
	}
	public void setTurnover(String turnover) {
		this.turnover = turnover;
	}
	public String getTradestock() {
		return tradestock;
	}
	public void setTradestock(String tradestock) {
		this.tradestock = tradestock;
	}
	public String getMarketvalue() {
		return marketvalue;
	}
	public void setMarketvalue(String marketvalue) {
		this.marketvalue = marketvalue;
	}
	public String getPeratio() {
		return peratio;
	}
	public void setPeratio(String peratio) {
		this.peratio = peratio;
	}
	@Override
    public String toString() {
        return  
                "id='" + id + '\'' +
                ", code='" + code + '\'' +
                ", name='" + name +'\''+
                ", price='" + price +'\''+
                ", raterf='" + raterf +'\''+
                ", updn='" + updn +'\'' +
                ", rspeed='" + rspeed +'\'' +
                ", vratio='" + vratio +'\'' +
                ", amplitude='" + amplitude +'\'' +
                ", turnover='" + turnover +'\'' +
                ", tradestock='" + tradestock +'\'' +
                ", marketvalue='" + marketvalue +'\'' +
                ", peratio='" + peratio +'\'' 
                ;
    	}
}
