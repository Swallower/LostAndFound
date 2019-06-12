package upload;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;
 
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

 
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import thingsBean.thingsInformation;
 
import dao.*;
/**
 * Servlet implementation class UploadServlet
 */
public class UploadServletLost extends HttpServlet {
    private static final long serialVersionUID = 1L;
     
    // 上传文件存储目录
    private static final String UPLOAD_DIRECTORY = "upload";
 
    // 上传配置
    private static final int MEMORY_THRESHOLD   = 1024 * 1024 * 3;  // 3MB
    private static final int MAX_FILE_SIZE      = 1024 * 1024 * 40; // 40MB
    private static final int MAX_REQUEST_SIZE   = 1024 * 1024 * 50; // 50MB
    
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
    		throws ServletException, IOException {
    	// TODO Auto-generated method stub
    	this.doPost(req, resp);
    }

    /**
     * 上传数据及保存文件
     */
    protected void doPost(HttpServletRequest request,
        HttpServletResponse response) throws ServletException, IOException {
        // 检测是否为多媒体上传
        if (!ServletFileUpload.isMultipartContent(request)) {
            // 如果不是则停止
            PrintWriter writer = response.getWriter();
            writer.println("Error: 表单必须包含 enctype=multipart/form-data");
            writer.flush();
            return;
        }
 
        // 配置上传参数
        DiskFileItemFactory factory = new DiskFileItemFactory();
        // 设置内存临界值 - 超过后将产生临时文件并存储于临时目录中
        factory.setSizeThreshold(MEMORY_THRESHOLD);
        // 设置临时存储目录
        factory.setRepository(new File(System.getProperty("java.io.tmpdir")));
 
        ServletFileUpload upload = new ServletFileUpload(factory);
         
        // 设置最大文件上传值
        upload.setFileSizeMax(MAX_FILE_SIZE);
         
        // 设置最大请求值 (包含文件和表单数据)
        upload.setSizeMax(MAX_REQUEST_SIZE);
        
        // 中文处理
        upload.setHeaderEncoding("UTF-8"); 

        // 构造临时路径来存储上传的文件
        // 这个路径相对当前应用的目录
        String uploadPath =  getServletContext().getRealPath("images");

       
        
        // 如果目录不存在则创建
        File uploadDir = new File(uploadPath);
        if (!uploadDir.exists()) {
            uploadDir.mkdir();
        }
        
        try {
            // 解析请求的内容提取文件数据
            @SuppressWarnings("unchecked")
//            List<FileItem> formItems = upload.parseRequest(request);
            List<FileItem> parseRequest = null;
    		try {
    			parseRequest = upload.parseRequest(request);
    		} catch (FileUploadException e) {
    			e.printStackTrace();
    		}
            
            String things = null;
            
            for (FileItem item : parseRequest) {
    			String fieldName = item.getFieldName();
    			
    			if ("things".equals(fieldName))
    			{
    				things = item.getString();
    				break;
    			}
    		}
    		UserDao  uDao = new UserDao();
    		
            if (parseRequest != null && parseRequest.size() > 0) {
                // 迭代表单数据
                for (FileItem item : parseRequest) {
                    // 处理不在表单中的字段
                    if (!item.isFormField()) {
                    	Date d = new Date();  
                    	HttpSession session = request.getSession();
                        String fileName = d.hashCode()+".jpg";
                        String filePath = uploadPath + File.separator + fileName;
                        ArrayList list =uDao.getListLost();
                        thingsInformation lost =(thingsInformation)list.get(0);
                        int id=lost.getId();
                        if(things.equals("lost")==true){
                        	sqlImageLost(fileName, id);
                        	
                        }else{
                            ArrayList listt =uDao.getListPick();
                            thingsInformation pick =(thingsInformation)listt.get(0);
                            int idd=pick.getId();
                        	sqlImagePick(fileName, idd);
                        }
                        
                        File storeFile = new File(filePath);
                        // 在控制台输出文件的上传路径
                        System.out.println(filePath);
                        // 保存文件到硬盘
                        item.write(storeFile);
                        request.setAttribute("message",
                            "文件上传成功!");

                    }
                }
            }
        } catch (Exception ex) {
            request.setAttribute("message",
                    "错误信息: " + ex.getMessage());
        }
        // 跳转到 message.jsp
        getServletContext().getRequestDispatcher("/message.jsp").forward(
                request, response);
    }


public void sqlImageLost(String imgName, int stuID) {
    Connection conn=null;
    PreparedStatement ps =null;
    ResultSet rs=null;
    String name=null;
    BaseDao dao = new BaseDao();
    String sql="update t_lost set img=? where id=?";
    conn=BaseDao.getMysqlConn();
    try {
		ps=conn.prepareStatement(sql);
		ps.setString(1, imgName);
		ps.setInt(2, stuID);
	    int i = ps.executeUpdate();
	} catch (SQLException e) {
		// TODO 自动生成的 catch 块
		e.printStackTrace();
	}
    
}

public void sqlImagePick(String imgName, int stuID) {
    Connection conn=null;
    PreparedStatement ps =null;
    ResultSet rs=null;
    String name=null;
    BaseDao dao = new BaseDao();
    String sql="update t_pick set img=? where id=?";
    conn=BaseDao.getMysqlConn();
    try {
		ps=conn.prepareStatement(sql);
		ps.setString(1, imgName);
		ps.setInt(2, stuID);
	    int i = ps.executeUpdate();
	} catch (SQLException e) {
		// TODO 自动生成的 catch 块
		e.printStackTrace();
	}
    
}
}
