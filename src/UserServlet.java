import com.nddmwdf.program.dao.UserDao;
import com.nddmwdf.program.entity.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/UserServlet")
public class UserServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doPost(request,response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=utf-8");
        String name = new String(request.getParameter("username").getBytes("iso-8859-1"),"utf-8");
        String pass = new String(request.getParameter("password").getBytes("iso-8859-1"),"utf-8");
        String akaname = new String(request.getParameter("akaname").getBytes("iso-8859-1"),"utf-8");
        String sex= new String(request.getParameter("usex").getBytes("iso-8859-1"),"utf-8");
        UserDao userDao=new UserDao();
        User user=new User();
        user.setLoginName(name);
        user.setLoginPass(pass);
        try {
            if(userDao.isExists(name)==0) {
                userDao.addUser(name, pass, akaname, sex);
                request.getRequestDispatcher("forjsp/login.jsp").forward(request, response);
            }
            else
            {
                request.getRequestDispatcher("forjsp/register.jsp").forward(request,response);
            }
        }
        catch (Exception e)
        {
            e.printStackTrace();

        }
    }
}
