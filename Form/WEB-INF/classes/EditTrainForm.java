import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.WebServlet;
import java.sql.*;

@WebServlet("/editTrainForm")
public class EditTrainForm extends HttpServlet {

	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
        try{
            Class.forName("org.postgresql.Driver");
            Connection con = DriverManager.getConnection("jdbc:postgresql://localhost:5432/trainDB", "postgres","Admin@123");
            Statement stmt = con.createStatement() ;
            String number = request.getParameter("number");
            number = number.trim();
            ResultSet rs =stmt.executeQuery("SELECT * FROM trains where train_number ='"+number+"'") ;
            if(rs.next()){
            String num =  request.getParameter("number");  
            num = num.trim();
            String name = request.getParameter("name");
            String starting = request.getParameter("starting");
            String startTime = request.getParameter("stTime");
            String ending = request.getParameter("ending");
            String endTime = request.getParameter("edTime");
            PreparedStatement ps = con.prepareStatement("update trains set train_number=?,train_name=?,starting_point=?,starting_time=?,ending_point=?,ending_time=?,distance=? where train_number ='"+num+"'");
            ps.setString(1,num);
            ps.setString(2,name);
            ps.setString(3,starting);
            ps.setString(4,startTime);
            ps.setString(5,ending);
            ps.setString(6,endTime);
            ps.setInt(7,Integer.valueOf(request.getParameter("distance")));
            ps.executeUpdate();
           
           response.sendRedirect("editTrain.jsp");
                }
               
}


        catch(Exception e ){
            e.printStackTrace();

        }
    }
}