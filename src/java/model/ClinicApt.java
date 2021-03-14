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
public class ClinicApt implements Serializable{

    int bookingID;
    String Bbookingname, BDate, BTime, BDesc, BStatus;
    
    public ClinicApt() {
    }

    public int getBookingID() {
        return bookingID;
    }

    public void setBookingID(int bookingID) {
        this.bookingID = bookingID;
    }

    public String getBbookingname() {
        return Bbookingname;
    }

    public void setBbookingname(String Bbookingname) {
        this.Bbookingname = Bbookingname;
    }

    public String getBDate() {
        return BDate;
    }

    public void setBDate(String BDate) {
        this.BDate = BDate;
    }

    public String getBTime() {
        return BTime;
    }

    public void setBTime(String BTime) {
        this.BTime = BTime;
    }

    public String getBDesc() {
        return BDesc;
    }

    public void setBDesc(String BDesc) {
        this.BDesc = BDesc;
    }

    public String getBStatus() {
        return BStatus;
    }

    public void setBStatus(String BStatus) {
        this.BStatus = BStatus;
    }
    
    
}
