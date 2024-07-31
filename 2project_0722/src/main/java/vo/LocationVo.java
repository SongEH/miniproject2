package vo;

public class LocationVo {

	int l_idx;
	String l_cate; //약국/병원/펜션
	String l_name; //상호묭
	String l_addr; //도로명주소
	String l_opentime; //운영시간
	String l_price;    // 가격
	String l_sido;
	String l_URL; //홈페이지url
	
	public String getL_sido() {
		return l_sido;
	}
	public void setL_sido(String l_sido) {
		this.l_sido = l_sido;
	}
	
	
	public int getL_idx() {
		return l_idx;
	}
	public void setL_idx(int l_idx) {
		this.l_idx = l_idx;
	}
	public String getL_cate() {
		return l_cate;
	}
	public void setL_cate(String l_cate) {
		this.l_cate = l_cate;
	}
	public String getL_opentime() {
		return l_opentime;
	}
	public void setL_opentime(String l_opentime) {
		this.l_opentime = l_opentime;
	}
	public String getL_price() {
		return l_price;
	}
	public void setL_price(String l_price) {
		this.l_price = l_price;
	}

	/*
	 * public String getL_content() { return l_content; } public void
	 * setL_content(String l_content) { this.l_content = l_content; }
	 */
	public String getL_addr() {
		return l_addr;
	}
	public void setL_addr(String l_addr) {
		this.l_addr = l_addr;
	}
	public String getL_URL() {
		return l_URL;
	}
	public void setL_URL(String l_URL) {
		this.l_URL = l_URL;
	}
	public String getL_name() {
		return l_name;
	}
	public void setL_name(String l_name) {
		this.l_name = l_name;
	}
	
	
}
