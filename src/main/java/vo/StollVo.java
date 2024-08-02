package vo;

public class StollVo {
    private int s_idx;
    private int m_idx;
    private int p_idx;
    private String s_rdate;
    private String s_etime;
    private String s_stime;
    private int s_distance;
    private String s_memo;
    private String p_name;
    
    
    
	public String getP_name() {
		return p_name;
	}
	public void setP_name(String p_name) {
		this.p_name = p_name;
	}
	public int getS_idx() {
		return s_idx;
	}
	public void setS_idx(int s_idx) {
		this.s_idx = s_idx;
	}
	public int getM_idx() {
		return m_idx;
	}
	public void setM_idx(int m_idx) {
		this.m_idx = m_idx;
	}
	public int getP_idx() {
		return p_idx;
	}
	public void setP_idx(int p_idx) {
		this.p_idx = p_idx;
	}
	public String getS_rdate() {
		return s_rdate;
	}
	public void setS_rdate(String s_rdate) {
		this.s_rdate = s_rdate;
	}
	public String getS_etime() {
		return s_etime;
	}
	public void setS_etime(String s_etime) {
		this.s_etime = s_etime;
	}
	public String getS_stime() {
		return s_stime;
	}
	public void setS_stime(String s_stime) {
		this.s_stime = s_stime;
	}
	public int getS_distance() {
		return s_distance;
	}
	public void setS_distance(int s_distance) {
		this.s_distance = s_distance;
	}
	public String getS_memo() {
		return s_memo;
	}
	public void setS_memo(String s_memo) {
		this.s_memo = s_memo;
	}
	@Override
	public String toString() {
		return "StollVo [s_idx=" + s_idx + ", m_idx=" + m_idx + ", p_idx=" + p_idx + ", s_rdate=" + s_rdate
				+ ", s_etime=" + s_etime + ", s_stime=" + s_stime + ", s_distance=" + s_distance + ", s_memo=" + s_memo
				+ "]";
	}
    
    
	
    
    
}
