package vo;

import java.sql.Date;
import java.util.List;

public class BoardVo {

	int b_idx;
	int m_idx;
	int b_readhit;
	
	String b_cate;
	String b_title;
	String b_content;
	
	Date b_rdate;
	Date b_udate;
	Date b_ddate;
	String m_name;

	public int getB_readhit() {
		return b_readhit;
	}
	public void setB_readhit(int b_readhit) {
		this.b_readhit = b_readhit;
	}
	
	List<BoardImagesVo> image_list;
	
	
	public List<BoardImagesVo> getImage_list() {
		return image_list;
	}
	public void setImage_list(List<BoardImagesVo> image_list) {
		this.image_list = image_list;
	}
	public int getB_idx() {
		return b_idx;
	}
	public void setB_idx(int b_idx) {
		this.b_idx = b_idx;
	}
	public int getM_idx() {
		return m_idx;
	}
	public void setM_idx(int m_idx) {
		this.m_idx = m_idx;
	}
	public String getB_cate() {
		return b_cate;
	}
	public void setB_cate(String b_cate) {
		this.b_cate = b_cate;
	}
	public String getB_title() {
		return b_title;
	}
	public void setB_title(String b_title) {
		this.b_title = b_title;
	}
	public String getB_content() {
		return b_content;
	}
	public void setB_content(String b_content) {
		this.b_content = b_content;
	}
	
	public Date getB_rdate() {
		return b_rdate;
	}
	public void setB_rdate(Date b_rdate) {
		this.b_rdate = b_rdate;
	}
	public Date getB_udate() {
		return b_udate;
	}
	public void setB_udate(Date b_udate) {
		this.b_udate = b_udate;
	}
	public Date getB_ddate() {
		return b_ddate;
	}
	public void setB_ddate(Date b_ddate) {
		this.b_ddate = b_ddate;
	}
	public String getM_name() {
		return m_name;
	}
	public void setM_name(String m_name) {
		this.m_name = m_name;
	}
	
	

	
	
}
