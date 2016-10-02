/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.jovana.videoklubzajednicko.dto;

import com.fasterxml.jackson.annotation.JsonView;
import com.fasterxml.jackson.databind.annotation.JsonSerialize;
import com.jovana.videoklubzajednicko.json_view.View;
import javax.xml.bind.annotation.XmlRootElement;

/**
 *
 * @author jmoldovan
 */
@XmlRootElement
@JsonSerialize
public class WsDto <T extends Object> {
    
    @JsonView(View.Normal.class)
    private T object;
    @JsonView(View.Normal.class)
    private int status;
    @JsonView(View.Normal.class)
    private String errorMessage;
    
    public final static int SUCCESS = 1;
    public final static int ERROR = -1;

    public WsDto() {
    }

    public WsDto(T object, int status, String errorMessage) {
        this.object = object;
        this.status = status;
        this.errorMessage = errorMessage;
    }

    public T getObject() {
        return object;
    }

    public void setObject(T object) {
        this.object = object;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public String getErrorMessage() {
        return errorMessage;
    }

    public void setErrorMessage(String errorMessage) {
        this.errorMessage = errorMessage;
    }
    
     @Override
    public String toString() {
        return "WsDTO{" + "object=" + object + ", status=" + status + ", errorMessage=" + errorMessage + '}';
    }
    
}
