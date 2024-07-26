package vo;

import java.util.Date;

public class HealthVO {
    private int h_idx;
    private int m_idx;
    private int p_idx;
    private String h_type;
    private Date h_date;
    private Date h_time;
    private double h_cost;
    private String h_content;
    private String h_hname;
    private Date h_ndate;
    private String m_name;
    private String pet_name;

    public int getH_idx() {
        return h_idx;
    }

    public void setH_idx(int h_idx) {
        this.h_idx = h_idx;
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

    public String getH_type() {
        return h_type;
    }

    public void setH_type(String h_type) {
        this.h_type = h_type;
    }

    public Date getH_date() {
        return h_date;
    }

    public void setH_date(Date h_date) {
        this.h_date = h_date;
    }

    public Date getH_time() {
        return h_time;
    }

    public void setH_time(Date h_time) {
        this.h_time = h_time;
    }

    public double getH_cost() {
        return h_cost;
    }

    public void setH_cost(double h_cost) {
        this.h_cost = h_cost;
    }

    public String getH_content() {
        return h_content;
    }

    public void setH_content(String h_content) {
        this.h_content = h_content;
    }

    public String getH_hname() {
        return h_hname;
    }

    public void setH_hname(String h_hname) {
        this.h_hname = h_hname;
    }

    public Date getH_ndate() {
        return h_ndate;
    }

    public void setH_ndate(Date h_ndate) {
        this.h_ndate = h_ndate;
    }

    public String getM_name() {
        return m_name;
    }

    public void setM_name(String m_name) {
        this.m_name = m_name;
    }

    public String getPet_name() {
        return pet_name;
    }

    public void setPet_name(String pet_name) {
        this.pet_name = pet_name;
    }
}
