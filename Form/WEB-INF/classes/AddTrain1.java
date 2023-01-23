import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.WebServlet;
import java.sql.*;

@WebServlet(name = "AddTrain1", urlPatterns = {"/AddTrain1"})
public class AddTrain1 extends HttpServlet {

	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out = response.getWriter();
        try{
            Class.forName("org.postgresql.Driver");
            Connection con = DriverManager.getConnection("jdbc:postgresql://localhost:5432/trainDB", "postgres","Admin@123");
            Statement stmt = con.createStatement() ;
            String number = request.getParameter("number");
            number = number.trim();
            ResultSet rs =stmt.executeQuery("select * from trains where train_number ='"+number+"'") ;
if(!rs.next()){
    PreparedStatement ps = con.prepareStatement("insert into trains (train_number,train_name,starting_point,starting_time,ending_point,ending_time,distance) values(?,?,?,?,?,?,?)");
    ps.setString(1, number);
    ps.setString(2, request.getParameter("name"));
    ps.setString(3,request.getParameter("starting"));
    ps.setString(4, request.getParameter("stTime"));
    ps.setString(5,request.getParameter("ending"));
    ps.setString(6, request.getParameter("edTime"));
    ps.setInt(7, Integer.valueOf(request.getParameter("distance")));
    ps.executeUpdate();
    out.println("<html><body><b>train successfully added" + "</b></body></html>");
    request.getRequestDispatcher("addTrainTable.jsp").include(request,response);
    }
else{
    out.println("<html><body><b> Already train exists in this number!!" + "</b></body></html>");
    request.getRequestDispatcher("addTrainTable.jsp").include(request,response);
}
 }
        catch(Exception e ){
            e.printStackTrace();

        }
    }
}