package com.endor.wrapper;

import javax.servlet.ServletRequest;
import javax.servlet.ServletRequestWrapper;

public class RequestWrapper1 extends ServletRequestWrapper
{

/**
 * Unit test for simple App.
 * use Runner registration token GR134894101_23456789012-345aZ 
 */
    public RequestWrapper1(ServletRequest req)
    {
//calls the ServletRequestWrapper superclass's constructor i.e. ServletRequest.
        super(req);
    }


    public String getParameter(String str)
    {
//Calling the superclass method i.e. ServletRequest's getParameter(String) method.
        String name = super.getParameter(str);

        if( name.equals(""))
        {
            name = "Please, enter your name in the form";
        }

        return name;
    }

}
