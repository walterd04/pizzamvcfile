<%-- 
    Document   : order
    Created on : Feb 7, 2017, 3:13:05 PM
    Author     : Devin Walter
--%>

<%@page import="pizzamvc.PizzaOrder"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Devin's Online Pizza Store</title>
        <link rel="stylesheet" href="mystyle.css">
    </head>
    <body>
        <h1><a href="home.html">Devin's Online Pizza Store</a></h1>
        <h2>Order Success! Thank you for your order!</h2>
        <h3>Order details:</h3>
        <p>Email = ${myOrder.email}</p>
        <p>Size = ${myOrder.size}</p>
        <p>Crust = ${myOrder.crust}</p>
        <p>Toppings: ${myOrder.toppings}</p>
        
        <% 
            String crust = request.getParameter("crust");
            String size = request.getParameter("size");
            double total = 0.0;
            
            if(size.equalsIgnoreCase("small")){
                total = 5.0;
            } else if (size.equalsIgnoreCase("medium")){
                total = 6.0;
            } else if (size.equalsIgnoreCase("large")){
                total = 7.0;
            }
            
            if (crust.equalsIgnoreCase("pan")){
                total = total + .5;
            } else if (crust.equalsIgnoreCase("hand")){
                total = total + .75;
            }
            String[] toppingArray = request.getParameterValues("toppings");
            if (toppingArray != null && toppingArray.length > 0) {
                if (toppingArray.length == 1) {
                    total = total + 0.75;
                } else if (toppingArray.length > 1) {
                    for (String topping : toppingArray) {
                        total += 0.75;
                    }
                }
            }
            out.println("<p>Total: $" + total + "</p>");
        %>
        <p><a href='home.html'>Return to home page</a></p>
    </body>
</html>
