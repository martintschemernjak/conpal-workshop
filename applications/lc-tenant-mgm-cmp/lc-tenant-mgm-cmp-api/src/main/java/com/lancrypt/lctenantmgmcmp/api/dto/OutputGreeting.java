package com.lancrypt.lctenantmgmcmp.api.dto;

public class OutputGreeting {
    public String casual;
    public String formal;

    public OutputGreeting(String casual, String formal) {
        this.casual = casual;
        this.formal = formal;
    }

    public String getCasual() {
        return casual;
    }

    public void setCasual(String casual) {
        this.casual = casual;
    }

    public String getFormal() {
        return formal;
    }

    public void setFormal(String formal) {
        this.formal = formal;
    }
}
