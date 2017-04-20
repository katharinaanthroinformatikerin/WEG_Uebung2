/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import javax.enterprise.context.Dependent;
import javax.inject.Named;


/**
 *
 * @author Katharina
 */
@Named(value = "patient") //managed bean
@Dependent //scope
public class Patient {
    
    private String vorname = "Susanne";
    private String nachname = "Muster";
    private String email = "meinPostfach@mail.com";
    private int svn = 1234;
    private String geburtsdatum = "01.01.1990";
    private String geschlecht = "w";
    private int diastolisch = 75;
    private int diaMin = 60;
    private int diaMax = 85;
    private int systolisch = 115;
    private int sysMin = 100;
    private int sysMax = 130;
    private int puls = 75;
    private int pulsMin = 60;
    private int pulsMax = 80;
    private String anmerkungen = "Ihr Kommentar";
   
    public int getDiaMin() {
        return diaMin;
    }

    public void setDiaMin(int diaMin) {
        this.diaMin = diaMin;
    }

    public int getDiaMax() {
        return diaMax;
    }

    public void setDiaMax(int diaMax) {
        this.diaMax = diaMax;
    }

    public int getSysMin() {
        return sysMin;
    }

    public void setSysMin(int sysMin) {
        this.sysMin = sysMin;
    }

    public int getSysMax() {
        return sysMax;
    }

    public void setSysMax(int sysMax) {
        this.sysMax = sysMax;
    }

    public int getPulsMin() {
        return pulsMin;
    }

    public void setPulsMin(int pulsMin) {
        this.pulsMin = pulsMin;
    }

    public int getPulsMax() {
        return pulsMax;
    }

    public void setPulsMax(int pulsMax) {
        this.pulsMax = pulsMax;
    }

    public String getVorname() {
        return vorname;
    }

    public void setVorname(String vorname) {
        this.vorname = vorname;
    }

    public String getNachname() {
        return nachname;
    }

    public void setNachname(String nachname) {
        this.nachname = nachname;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public int getSvn() {
        return svn;
    }

    public void setSvn(int svn) {
        this.svn = svn;
    }

    public String getGeburtsdatum() {
        return geburtsdatum;
    }

    public void setGeburtsdatum(String geburtsdatum) {
        this.geburtsdatum = geburtsdatum;
    }

    public String getGeschlecht() {
        return geschlecht;
    }

    public void setGeschlecht(String geschlecht) {
        this.geschlecht = geschlecht;
    }

    public int getDiastolisch() {
        return diastolisch;
    }

    public void setDiastolisch(int diastolisch) {
        this.diastolisch = diastolisch;
    }

    public int getSystolisch() {
        return systolisch;
    }

    public void setSystolisch(int systolisch) {
        this.systolisch = systolisch;
    }

    public int getPuls() {
        return puls;
    }

    public void setPuls(int puls) {
        this.puls = puls;
    }

    public String getAnmerkungen() {
        return anmerkungen;
    }

    public void setAnmerkungen(String anmerkungen) {
        this.anmerkungen = anmerkungen;
    }
    
    public String submit() {
        return "patientdata.xhtml";
    }
}
