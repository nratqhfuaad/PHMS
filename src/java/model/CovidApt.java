/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import java.io.Serializable;

/**
 *
 * @author user
 */
public class CovidApt implements Serializable{

    int cs_bookingID;
    String cs_bookingdesc, cs_aptdate, cs_apttime, cs_screeningtype, cs_bookingstatus;
    
    public CovidApt() {
    }

    public int getCs_bookingID() {
        return cs_bookingID;
    }

    public void setCs_bookingID(int cs_bookingID) {
        this.cs_bookingID = cs_bookingID;
    }

    public String getCs_bookingdesc() {
        return cs_bookingdesc;
    }

    public void setCs_bookingdesc(String cs_bookingdesc) {
        this.cs_bookingdesc = cs_bookingdesc;
    }

    public String getCs_aptdate() {
        return cs_aptdate;
    }

    public void setCs_aptdate(String cs_aptdate) {
        this.cs_aptdate = cs_aptdate;
    }

    public String getCs_apttime() {
        return cs_apttime;
    }

    public void setCs_apttime(String cs_apttime) {
        this.cs_apttime = cs_apttime;
    }

    public String getCs_screeningtype() {
        return cs_screeningtype;
    }

    public void setCs_screeningtype(String cs_screeningtype) {
        this.cs_screeningtype = cs_screeningtype;
    }

    public String getCs_bookingstatus() {
        return cs_bookingstatus;
    }

    public void setCs_bookingstatus(String cs_bookingstatus) {
        this.cs_bookingstatus = cs_bookingstatus;
    }
       
}
