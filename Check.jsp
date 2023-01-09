<%-- 
    Document   : Check
    Created on : Jun 30, 2022, 11:48:57 PM
    Author     : Acer
--%>

<%@page import="java.sql.*"%>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.SQLException" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<%@page import="java.io.FileOutputStream"%>
<%@page import="com.itextpdf.text.Document"%>  
<%@page import="com.itextpdf.text.pdf.PdfWriter"%> 
<%@page import="com.itextpdf.text.Paragraph"%>



<%
	Connection connect = null;
	Statement s = null;
        ResultSet resultSet = null;
	
	try {
		Class.forName("com.mysql.jdbc.Driver");
		
		connect =  DriverManager.getConnection("jdbc:mysql://localhost/ids_reg" +
				"?user=root&password=");
		
			if(connect != null){
				out.println("Database Connected.");


			} else {
				out.println("Database Connect Failed.");
			}
		
		} catch (Exception e) {
			// TODO Auto-generated catch block
			out.println(e.getMessage());
			e.printStackTrace();
		}
	
//		try {
//			if(s!=null){
//				s.close();
//				connect.close();
//			}
//		} catch (SQLException e) {
//			// TODO Auto-generated catch block
//			out.println(e.getMessage());
//			e.printStackTrace();
//		}
%>

<%
    String action=request.getParameter("action");
    if (action.equals("register")) {
        String fname = request.getParameter("fname");
        String lname = request.getParameter("lname");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");
        String nation = request.getParameter("nation");
        String planid = request.getParameter("planid");
        
        Statement st= connect.createStatement();
        ResultSet rs;
        
        try {
            int i=st.executeUpdate("insert into user values ('"+fname+"','"+lname+"','"+email+"','"+phone+"','"+nation+"')");
            
            //in case mahidol recive money//
            
            //int j=st.executeUpdate("insert into payment values ('"+fname+"','"+email+"','"+planid+"','wait','wait','wait','wait')");
            int j=st.executeUpdate("insert into payment values('"+fname+"','"+email+"','"+planid+"','Suscess','wait','wait','wait')");
                                  
//                try{
//                    String file_name = "C:\\Users\\Acer\\Documents\\NetBeansProjects\\WebApplication1\\web\\gen_result\\"+email+".pdf";
//                    Document document = new Document();
//
//                    PdfWriter.getInstance(document,new FileOutputStream(file_name));
//
//                    document.open();
//
//                    Paragraph para = new Paragraph("This is IDS_test gen file of "+fname+"_"+lname+"");
//                    document.add(para);
//                    document.close();
//                    response.sendRedirect("qr_gen.jsp");
//               
                
                 response.sendRedirect("main.jsp");
//                    
//                } catch (Exception e) {
//                                System.err.println(e);
//                }

//            if(!planid.equals("non_member")){}
           
	} catch (SQLException e) {
			// TODO Auto-generated catch block
			out.println(e.getMessage());
			e.printStackTrace();
                        out.println("<script type=\"text/javascript\">");
                        out.println("alert('This Email has used');"); 
                        out.println("location='index.jsp';"); 
                        out.println("</script>");
//                        response.sendRedirect("index.jsp");
	}
        

    //String action=request.getParameter("action");
    //if (action.equals("login")) {
       // String fname = request.getParameter("fname");
        //String lname = request.getParameter("lname");
        //if(fname.equals("ice")&& lname.equals("123")){
            //session.setAttribute("username",lname);
            //response.sendRedirect("main.jsp");} 
    }
%>

