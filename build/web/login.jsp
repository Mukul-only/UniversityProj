<%-- 
    Document   : login
    Created on : 15-Feb-2023, 10:02:03 pm
    Author     : Mukul
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" language="java" import="java.sql.*" %>
<%String login=request.getParameter("email");
     String pass=request.getParameter("pass");
     if("".equals(login)||"".equals(pass))
    response.sendRedirect("login&register.html?msg=blank");
    else    {
    try
            {  boolean flag=false;
        Class.forName("oracle.jdbc.driver.OracleDriver");
        Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","sis","sis");
     Statement stmt=con.createStatement();
     String qry="select * from student_info";
     ResultSet rs=stmt.executeQuery(qry);
     while(rs.next())
         { String dbid=rs.getString("email");
         String dbpass=rs.getString("password");
         if(login.equals(dbid) && pass.equals(dbpass) )
             { flag=true; } }
        if(flag) { out.print("Successfully Login...."); }
        else { response.sendRedirect("login&register.html?msg=error");} }
    catch(Exception e)  {    }}%>
