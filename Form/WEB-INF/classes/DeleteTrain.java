import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.WebServlet;
import java.sql.*;

@WebServlet(name="deleteTrain", urlPatterns={"/del"})
public class DeleteTrain extends HttpServlet {

	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out = response.getWriter();
        try{
            Class.forName("org.postgresql.Driver");
            Connection con = DriverManager.getConnection("jdbc:postgresql://localhost:5432/trainDB", "postgres","Admin@123");
            Statement stmt = con.createStatement() ;
            String number = request.getParameter("number");
             number = number.trim();
           ResultSet rs =stmt.executeQuery("select * from trains where train_number ='"+number+"'") ;
if(rs.next()){
    stmt.executeUpdate("delete  from trains where train_number ='"+number+"'");
    stmt.executeUpdate("delete  from route_stations where train_number ='"+number+"'");
    out.println("<html><body><b> Train deleted Succussfully!!" + "</b></body></html>");
    request.getRequestDispatcher("deleteTrain.jsp").include(request,response);
}
else{
    out.println("<html><body><b> No train found in this number!!" + "</b></body></html>");
    request.getRequestDispatcher("admin.jsp").include(request,response);
}
}
        catch(Exception e ){
            e.printStackTrace();

        }
    }
}