import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.WebServlet;
import java.sql.*;

@WebServlet(name = "BookTicket", urlPatterns = {"/ticket"})
public class BookTicket extends HttpServlet {

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
    PreparedStatement ps = con.prepareStatement("insert into tickets (name,train_number,from,to,departure,arrive,distance) values(?,?,?,?,?,?,?)");
    ps.setString(1,rs.getString("train_name") );
    ps.setString(2,number);
    ps.setString(3,rs.getString("starting_point"));
    ps.setString(4,rs.getString("ending_point"));
    ps.setString(5,rs.getString("starting_time"));
    ps.setString(6, rs.getString("ending_time"));
    ps.setInt(7, rs.getInt("distance"));
    ps.executeUpdate();
    
    request.getRequestDispatcher("booked.jsp").include(request,response);
    }
else{
    out.println("<html><body><b> Already Ticket Booked!!" + "</b></body></html>");
    request.getRequestDispatcher("trainlist.jsp").include(request,response);
}
 }
        catch(Exception e ){
            e.printStackTrace();

        }
    }
}