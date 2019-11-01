import com.nddmwdf.program.dao.GarbageDao;
import com.nddmwdf.program.entity.Garbage;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet("/GarbageSearch")
public class GarbageSearch extends HttpServlet{
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doPost(request,response);
    }


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String garbage_name = new String(request.getParameter("garbage_name").getBytes("iso-8859-1"),"utf-8");
        //user.setAddr(user_addr);

        GarbageDao dao = new GarbageDao();
        List<Garbage> user_list = dao.search(garbage_name);

        if(user_list.isEmpty())
        {
            request.setAttribute("search_info", "查询失败，数据库中未查询到相关信息");
            request.getRequestDispatcher("/forjsp/index.jsp").forward(request, response);
        }
        else {
            request.setAttribute("search_info", "查询信息成功");
            request.setAttribute("user_list",user_list);
            int a = user_list.size();
            request.setAttribute("list_size",a);
            request.getRequestDispatcher("/forjsp/search_result.jsp").forward(request, response);
        }
    }
}
