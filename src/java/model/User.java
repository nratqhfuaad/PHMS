/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import java.io.Serializable;

/**
 *
 * @author 0wner
 */
public class User implements Serializable{
    
    int pid;
    String pname;
    String ppassword;
    String pemail;
    String pic;
    String pphone;
    String paddress;
    String pgender;
    String poccupation;
    String pbirthdate;
    String phealthstatus;
    
    public User(){}

    public String getPhealthstatus() {
        return phealthstatus;
    }

    public void setPhealthstatus(String phealthstatus) {
        this.phealthstatus = phealthstatus;
    }

    public String getPgender() {
        return pgender;
    }

    public void setPgender(String pgender) {
        this.pgender = pgender;
    }

    public String getPoccupation() {
        return poccupation;
    }

    public void setPoccupation(String poccupation) {
        this.poccupation = poccupation;
    }

    public String getPbirthdate() {
        return pbirthdate;
    }

    public void setPbirthdate(String pbirthdate) {
        this.pbirthdate = pbirthdate;
    }

    public String getPGender() {
        return pgender;
    }

    public void setPGender(String gender) {
        this.pgender = gender;
    }

    public int getPid() {
        return pid;
    }

    public void setPid(int pid) {
        this.pid = pid;
    }

    public String getPname() {
        return pname;
    }

    public void setPname(String pname) {
        this.pname = pname;
    }

    public String getPpassword() {
        return ppassword;
    }

    public void setPpassword(String ppassword) {
        this.ppassword = ppassword;
    }

    public String getPemail() {
        return pemail;
    }

    public void setPemail(String pemail) {
        this.pemail = pemail;
    }

    public String getPic() {
        return pic;
    }

    public void setPic(String pic) {
        this.pic = pic;
    }

    public String getPphone() {
        return pphone;
    }

    public void setPphone(String pphone) {
        this.pphone = pphone;
    }

    public String getPaddress() {
        return paddress;
    }

    public void setPaddress(String paddress) {
        this.paddress = paddress;
    } 

    
}
