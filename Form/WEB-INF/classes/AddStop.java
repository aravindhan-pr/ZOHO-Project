import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.WebServlet;
import java.sql.*;
@WebServlet("/stop")
public class AddStop extends HttpServlet {

	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out = response.getWriter();
        try{
            Class.forName("org.postgresql.Driver");
            Connection con = DriverManager.getConnection("jdbc:postgresql://localhost:5432/trainDB", "postgres","Admin@123");
            Statement stmt = con.createStatement() ;
            String prev_station = request.getParameter("prev_station");
            ResultSet pr = stmt.executeQuery("select * from stations where station_name = '"+prev_station+"'");
            if(pr.next()){
                int prev_station_id = pr.getInt("station_id");
            int stop_no = Integer.valueOf(request.getParameter("stop_no"));
            ResultSet r = stmt.executeQuery("select next_station_id from route_stations where station_id = "+prev_station_id);
            if(r.next()){
                int temp = r.getInt("next_station_id");
           
            String number = request.getParameter("number");
            number = number.trim();
            String  next_station = request.getParameter("next_station");
            next_station = next_station.trim();
            ResultSet ns = stmt.executeQuery("select * from stations where station_name = '"+next_station+"' ");
            if(ns.next()){
             int next_station_id = ns.getInt("station_id");
            stmt.executeUpdate("update route_stations set next_station_id = "+next_station_id+"where station_id ="+prev_station_id+"");
            ResultSet rs =stmt.executeQuery("select '" + stop_no + "' from route_stations where train_number ='"+number+"'");
            if(rs.next()){
                stmt.executeUpdate("update route_stations set stop_no = stop_no + 1 where stop_no >= '" + stop_no + "' and train_number = '" + number + "'");
            }
            
            PreparedStatement ps = con.prepareStatement("insert into route_stations (stop_no,reach_Time,halt_Time,distance,train_number,station_id,next_station_id) values(?,?,?,?,?,?,?)");
            ps.setInt(1,stop_no);
            ps.setString(2,request.getParameter("reachTime"));
            ps.setString(3, request.getParameter("haltTime"));
            ps.setInt(4,Integer.valueOf(request.getParameter("distance")));
            ps.setString(5,number);
            ps.setInt(6,next_station_id);
            ps.setInt(7,temp);
            ps.executeUpdate();
            out.println("<html><body><b> Station added !!" + "</b></body></html>");
            request.getRequestDispatcher("schedule.jsp").include(request,response);
        }
        }
        }
}
        catch(Exception e ){
            e.printStackTrace();

        }
    }
}
