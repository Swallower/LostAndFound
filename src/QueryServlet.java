import com.google.gson.Gson;
import dao.UserDao;
import thingsBean.thingsInformation;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.ArrayList;

@WebServlet("/QueryServlet")
public class QueryServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        UserDao uDao = new UserDao();
        String place=request.getParameter("place");
        System.out.println("place"+place);
        String  pages=request.getParameter("strpage");
        int lastpage=uDao.LastPageLost(10);
        int pageNum=1;//默认页
        if(pages!=null){
            try {
                pageNum=Integer.parseInt(pages);
            }catch(Exception e){
                pageNum=1;
            }
        }
        if(pageNum<1){
            pageNum=1;
        }
        if(pageNum>lastpage){
            pageNum=lastpage;
        }
        HttpSession session=request.getSession();
        ArrayList<thingsInformation> list =uDao.getListByLostBuild(pageNum, 10,place);
        System.out.println("list:"+list);
//        for(int i=0;i<list.size();i++ ){
//            thingsInformation  pick=(thingsInformation)list.get(i);
////            session.setAttribute("userID", pick.getUserId());
//        }
        response.getWriter().write(new Gson().toJson(list));
}}
