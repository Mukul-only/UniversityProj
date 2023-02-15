<%-- 
    Document   : inserthandler
    Created on : 15-Feb-2023, 9:18:19 pm
    Author     : Mukul
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" language="java" import="java.sql.*"%>
<%
String fn=request.getParameter("fn");
String email=request.getParameter("email");
String gender=request.getParameter("gender");
String course=request.getParameter("course");
String year=request.getParameter("year");
String phno=request.getParameter("phno");
String password=request.getParameter("pass");
if("".equals(fn)||"".equals(email)||"".equals(gender)||"".equals(course)||"".equals(year)||"".equals(phno)||"".equals(password))
{    response.sendRedirect("login&register.html?msg=blank");}
else    {
    try{        Class.forName("oracle.jdbc.driver.OracleDriver");
        Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","sis","sis");
        String qry="insert into student_info values(?,?,?,?,?,?,?)";
       PreparedStatement prestmt=con.prepareStatement(qry);
       prestmt.setString(1,fn);
       prestmt.setString(2,email);
       prestmt.setString(3,gender);
       prestmt.setString(4,course);
       prestmt.setString(5, year);
       prestmt.setString(6,phno);
       prestmt.setString(7, password);
      prestmt.executeUpdate();
      con.close();
      prestmt.close();
       out.print("Thanks for Registration");
       %><a href="index.html">GoBack</a><%     }
    catch(Exception e)
            { out.println(e); } }%>
