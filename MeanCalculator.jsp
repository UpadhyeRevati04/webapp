<%-- 
    Document   : MeanCalculator
    Created on : Feb 9, 2024, 1:25:05 PM
    Author     : Asus
--%>

<%@page language="java" contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.Arrays" %>
<%@page import="java.util.stream.DoubleStream"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Mean And Standard Deviation Calculator</title>
    </head>
    <body>
        <h2> Mean And Standard Deviation Calculator </h2>
        <form action="" method="post">
            Enter data (Comma separated) : <input type="text" name="data" size="100" value="<%= request.getParameter("data") %>" required><br>
            <input type="submit" value="Calculate">
        </form>
        <%
                    if(request.getMethod().equals("POST"))
                    {
                            String[] dataPoints = request.getParameter("data").split(",");
                            double[] values = new double[dataPoints.length];
                            for(int i=0;i< dataPoints.length;i++)
                            {
                                        values[i] = Double.parseDouble(dataPoints[i]);
                            }
                            double sum=0;
                            for(double value : values )
                            {
                                    sum += value;
                            }
                            double mean = sum / values.length;
                            double variance =0;
                            for(double value : values)
                            {
                                    variance += Math.pow(value-mean, 2);
                            }
                            variance /=values.length;
                            
                            double stdDeviation = Math.sqrt(variance);
                            
                            out.println("<br><br>");
                            out.println("Mean : "+mean);
                            out.println("<br><br>");
                            out.println("Standard Deviation :  " +stdDeviation+"<br>");
                    }
         %>
    </body>
</html>
