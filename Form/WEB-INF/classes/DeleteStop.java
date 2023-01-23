import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.WebServlet;
import java.sql.*;

@WebServlet(name="DeleteStop", urlPatterns={"/deleteStop"})
public class DeleteStop extends HttpServlet {

	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out = response.getWriter();
        try{
            Class.forName("org.postgresql.Driver");
            Connection con = DriverManager.getConnection("jdbc:postgresql://localhost:5432/trainDB", "postgres","Admin@123");
            Statement stmt = con.createStatement() ;
            String number = request.getParameter("number");
            System.out.println(number);
            int stop_no =Integer.valueOf(request.getParameter("stop_no"));
            number = number.trim();
           ResultSet rs =stmt.executeQuery("select * from route_stations where train_number ='"+number+"' and stop_no = "+stop_no) ;
if(rs.next()){
    stmt.executeUpdate("delete  from route_stations where train_number ='"+number+"' and stop_no ="+ stop_no);
    stmt.executeUpdate("update route_stations set stop_no = stop_no - 1 where stop_no >= '" + stop_no + "' and train_number = '" + number + "'");
    out.println("<html><body><b> stop deleted Succussfully!!" + "</b></body></html>");
   }
else{
    out.println("<html><body><b>error!!" + "</b></body></html>");
   
}
request.getRequestDispatcher("schedule.jsp").include(request,response);
}
        catch(Exception e ){
            e.printStackTrace();

        }
    }
}