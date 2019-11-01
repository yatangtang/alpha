import com.nddmwdf.program.dao.GarbageDao;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpServlet;

public class GarbageServlet extends HttpServlet{
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setCharacterEncoding("utf-8");
        GarbageDao garbageDao=new GarbageDao();
        String gname = new String(request.getParameter("gname").getBytes("iso-8859-1"),"utf-8");
        String gdesc = new String(request.getParameter("gdesc").getBytes("iso-8859-1"),"utf-8");
        //String gpic=new String(request.getParameter("gpic").getBytes("iso-8859-1"),"utf-8");
        String gtype=new String(request.getParameter("gtype").getBytes("iso-8859-1"),"utf-8");
        String method=new String(request.getParameter("method").getBytes("iso-8859-1"),"utf-8");
        //String sql = "INSERT INTO garbage(garbage_name,garbage_content,garbage_picture,garbage_type) VALUES('"  + gname + "','" + gdesc +"','"+ gpic + "','" + gtype + "')";
        try {
            if(method.equals("addgarbage"))
             garbageDao.addGarbage(gname, gdesc, gtype);
             request.getRequestDispatcher("jsp/garbage_list.jsp").forward(request, response);
        } catch (Exception e) {
            request.getRequestDispatcher("error.jsp").forward(request, response);
            e.printStackTrace();
        }
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        this.doPost(req,resp);
    }
}
