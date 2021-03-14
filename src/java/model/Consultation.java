/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

/**
 *
 * @author Admin
 */
public class Consultation {
    
    int OCID, OCUserID;
    String OCName, OCEmail, OCQuestion, OCAnswer;

    public int getOCID() {
        return OCID;
    }

    public void setOCID(int OCID) {
        this.OCID = OCID;
    }

    public int getOCUserID() {
        return OCUserID;
    }

    public void setOCUserID(int OCUserID) {
        this.OCUserID = OCUserID;
    }

    public String getOCName() {
        return OCName;
    }

    public void setOCName(String OCName) {
        this.OCName = OCName;
    }

    public String getOCEmail() {
        return OCEmail;
    }

    public void setOCEmail(String OCEmail) {
        this.OCEmail = OCEmail;
    }

    public String getOCQuestion() {
        return OCQuestion;
    }

    public void setOCQuestion(String OCQuestion) {
        this.OCQuestion = OCQuestion;
    }

    public String getOCAnswer() {
        return OCAnswer;
    }

    public void setOCAnswer(String OCAnswer) {
        this.OCAnswer = OCAnswer;
    }

    

    
}
