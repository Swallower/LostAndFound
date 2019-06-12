package dao;
import java.sql.*;
import java.util.ArrayList;
import java.util.jar.JarEntry;


import thingsBean.thingsInformation;
import userBean.Users;


public class UserDao {
	
	
	    BaseDao dao = new BaseDao();
		Connection conn=null;
		PreparedStatement ps=null;
		ResultSet rs=null;	
		//修改用户的个人信息
		public int updateUsersByXuehao(Users users){
			int i =0 ;
			String sql="update t_user set username=?,userpass=?,phoneNum=?,email=? where xuehao=?";
			String arr[]={users.getUsername(),users.getUserpass(),users.getPhoneNum()+"",
					users.getEmail(),users.getXuehao()};
			
	    	  i=dao.doExcuteSql(sql, arr);
			return i ;
		}
		
		
//		public Users getUsersById(int id){
//			String sql="select * from t_user where id=?";
//			Users users = new Users();
//			try {
//			conn=dao.getMysqlConn();
//			ps=conn.prepareStatement(sql);
//			ps.setInt(1, xuehao);
//			rs=ps.executeQuery();
//			if(rs.next()){
//				users.setId(rs.getInt("id"));
//				users.setAddr(rs.getString("addr"));
//				users.setSex(rs.getInt("sex"));
//				users.setUsername(rs.getString("username"));
//				users.setUserpass(rs.getString("userpass"));
//			}
//			} catch (Exception e) {
//				e.printStackTrace();
//			}
//			return users;
//		}
		
		//通过学号查询
		public Users getUsersByxuehao(String xuehao){
			String sql="select  * from t_user where xuehao=?";
			Users users =new Users();
			
			try {
				conn=dao.getMysqlConn();
				ps=conn.prepareStatement(sql);
				ps.setString(1, xuehao);
				rs=ps.executeQuery();
				if(rs.next()){
					users.setXuehao(rs.getString("xuehao"));
					users.setUsername(rs.getString("username"));
					users.setUserpass(rs.getString("userpass"));
					users.setPhoneNum(rs.getString("phoneNum"));
					users.setEmail(rs.getString("email"));
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}			
			return users;
		}
	   
		//通过学号查询所有信息111
		public ArrayList<thingsInformation> getUsersByUserId(String userid,String  i,String  j, int page,int pageSize){
	    	ArrayList<thingsInformation> list = new ArrayList<thingsInformation>();
			//String sql="select  * from t_allInformation where userid=?";
	    	String sql="select * from t_allinformation "
		    	  		+ " where (userId=?) and (state=? or state=?)  order by id limit "+pageSize+ " offset " +(page-1)*pageSize;
			
			try {
				
				conn=dao.getMysqlConn();
				ps=conn.prepareStatement(sql);
				ps.setString(1, userid);
				ps.setString(2, i);
				ps.setString(3, j);
				rs=ps.executeQuery();
				while(rs.next()){
					thingsInformation thingsInformation =new thingsInformation();
					thingsInformation.setId(rs.getInt("id"));
					thingsInformation.setUserId(rs.getString("userId"));
					thingsInformation.setState(rs.getInt("state"));
					thingsInformation.setTitle(rs.getString("title"));
					thingsInformation.setContent(rs.getString("content"));
					thingsInformation.setType(rs.getString("type"));
					thingsInformation.setLosttime(rs.getDate("losttime"));
					thingsInformation.setUpdatetime(rs.getDate("updatetime"));
					thingsInformation.setImg(rs.getString("img"));
					list.add(thingsInformation);
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}			
			return list;
		}
    //查询t_lost
    public ArrayList<thingsInformation> getUsersByUserIdLost(String userid,String  i,String  j, int page,int pageSize){
        ArrayList<thingsInformation> list = new ArrayList<thingsInformation>();
        //String sql="select  * from t_allInformation where userid=?";
        String sql="select * from t_lost "
                + " where (userId=?) and (state=? or state=?)  order by id limit "+pageSize+ " offset " +(page-1)*pageSize;

        try {

            conn=dao.getMysqlConn();
            ps=conn.prepareStatement(sql);
            ps.setString(1, userid);
            ps.setString(2, i);
            ps.setString(3, j);
            rs=ps.executeQuery();
            while(rs.next()){
                thingsInformation thingsInformation =new thingsInformation();
                thingsInformation.setId(rs.getInt("id"));
                thingsInformation.setUserId(rs.getString("userId"));
                thingsInformation.setState(rs.getInt("state"));
                thingsInformation.setTitle(rs.getString("title"));
                thingsInformation.setContent(rs.getString("content"));
                thingsInformation.setType(rs.getString("type"));
                thingsInformation.setLosttime(rs.getDate("losttime"));
                thingsInformation.setUpdatetime(rs.getDate("updatetime"));
                thingsInformation.setImg(rs.getString("img"));
                list.add(thingsInformation);
            }
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        return list;
    }
    //查询t_pick
    public ArrayList<thingsInformation> getUsersByUserIdPick(String userid,String  i,String  j, int page,int pageSize){
        ArrayList<thingsInformation> list = new ArrayList<thingsInformation>();
        //String sql="select  * from t_allInformation where userid=?";
        String sql="select * from t_pick "
                + " where (userId=?) and (state=? or state=?)  order by id limit "+pageSize+ " offset " +(page-1)*pageSize;

        try {

            conn=dao.getMysqlConn();
            ps=conn.prepareStatement(sql);
            ps.setString(1, userid);
            ps.setString(2, i);
            ps.setString(3, j);
            rs=ps.executeQuery();
            while(rs.next()){
                thingsInformation thingsInformation =new thingsInformation();
                thingsInformation.setId(rs.getInt("id"));
                thingsInformation.setUserId(rs.getString("userId"));
                thingsInformation.setState(rs.getInt("state"));
                thingsInformation.setTitle(rs.getString("title"));
                thingsInformation.setContent(rs.getString("content"));
                thingsInformation.setType(rs.getString("type"));
                thingsInformation.setLosttime(rs.getDate("losttime"));
                thingsInformation.setUpdatetime(rs.getDate("updatetime"));
                thingsInformation.setImg(rs.getString("img"));
                list.add(thingsInformation);
            }
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        return list;
    }
//    //通过place查询所有信息
//    public ArrayList<thingsInformation> getUsersByUserId(String userid,String  i,String  j, int page,int pageSize){
//        ArrayList<thingsInformation> list = new ArrayList<thingsInformation>();
//        //String sql="select  * from t_allInformation where userid=?";
//        String sql="select * from t_allinformation "
//                + " where (place=?) and (state=? or state=?)  order by id limit "+pageSize+ " offset " +(page-1)*pageSize;
//
//        try {
//
//            conn=dao.getMysqlConn();
//            ps=conn.prepareStatement(sql);
//            ps.setString(1, userid);
//            ps.setString(2, i);
//            ps.setString(3, j);
//            rs=ps.executeQuery();
//            while(rs.next()){
//                thingsInformation thingsInformation =new thingsInformation();
//                thingsInformation.setId(rs.getInt("id"));
//                thingsInformation.setUserId(rs.getString("userId"));
//                thingsInformation.setState(rs.getInt("state"));
//                thingsInformation.setTitle(rs.getString("title"));
//                thingsInformation.setContent(rs.getString("content"));
//                thingsInformation.setType(rs.getString("type"));
//                thingsInformation.setLosttime(rs.getDate("losttime"));
//                thingsInformation.setUpdatetime(rs.getDate("updatetime"));
//                thingsInformation.setImg(rs.getString("img"));
//                list.add(thingsInformation);
//            }
//        } catch (SQLException e) {
//            // TODO Auto-generated catch block
//            e.printStackTrace();
//        }
//        return list;
//    }

    public boolean login(String username,String userpass){
	    	  boolean bl=false;
	    	  String sql="select * from t_user where xuehao=? "
	    	  		+ "and userpass=? ";
	    	  conn=dao.getMysqlConn();
	    	  try {
				ps=conn.prepareStatement(sql);
				ps.setString(1, username);
				ps.setString(2, userpass);
				rs=ps.executeQuery();
				if(rs.next()){
					bl=true;
				}
			} catch (Exception e) {
				e.printStackTrace();
			}finally{
				dao.close(rs, ps, conn);
			}
	    	  return bl;
	      }
	      
	      public String username(String xuehao){
	    	  String username = null;
	    	  String sql="select username from t_user where xuehao=?";
	    	  conn=dao.getMysqlConn();
	    	  try {
				ps=conn.prepareStatement(sql);
				ps.setString(1, xuehao);
				rs=ps.executeQuery();
				if(rs.next()){
					username=rs.getString(1);
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
	    	  
	    	  return username;
	      }
	      
	      public int LastPageLost(int pageSize){
	    	   int page = 0;
	    	   int pageCount=0;
	    	   String sql="select COUNT(*) as pagecount from t_lost ";
	    	   conn=dao.getMysqlConn();
	    	   try {
				ps=conn.prepareStatement(sql);
				rs=ps.executeQuery();
				if(rs.next()){
					pageCount=rs.getInt("pagecount");
				}
				if(pageCount%pageSize==0){
					page=pageCount/pageSize;
				}else{
					page=pageCount/pageSize+1;
				}
				
			} catch (Exception e) {
				e.printStackTrace();
			}finally{
				dao.close(rs, ps, conn);
			}
	    	   return page;
	      }
	      
	      public int LastPagePick(int pageSize){
	    	   int page = 0;
	    	   int pageCount=0;
	    	   String sql="select COUNT(*) as pagecount from t_pick ";
	    	   conn=dao.getMysqlConn();
	    	   try {
				ps=conn.prepareStatement(sql);
				rs=ps.executeQuery();
				if(rs.next()){
					pageCount=rs.getInt("pagecount");
				}
				if(pageCount%pageSize==0){
					page=pageCount/pageSize;
				}else{
					page=pageCount/pageSize+1;
				}
				
			} catch (Exception e) {
				e.printStackTrace();
			}finally{
				dao.close(rs, ps, conn);
			}
	    	   return page;
	      }
//	      
//	      public int deleteByIds(String[] ids){
//	    	  String sql = "delete from inf_web where id in (";	    	  
//	          for(int i=0;i<ids.length;i++){
//	              sql+=ids[i]+",";
//	              
//	          }
//	          
//	          //)
//	          sql = sql.substring(0, sql.length()-1);
//	          sql+=")";
//
//	    	 // String sql="delete from inf_web where id  in ("+ids+")";
//	    	 
//	    	  conn=dao.getMysqlConn();
//	    	  try {
//	    		  //
//				ps=conn.prepareStatement(sql);
//				ps.addBatch();
//				ps.executeBatch();
//			} catch (Exception e) {
//				e.printStackTrace();
//			}
//	    	  finally{
//					dao.close(rs, ps, conn);
//				}
//	    	  return 1;
//	      }
//	      
	      //删除丢失的信息表信息
	      public int deleteByIdLost(int id){
		    System.out.print("222"+id);
	    	  String sql="delete from t_lost where id=?";
	    	  String arr[]={id+""};
	    	int  i=dao.doExcuteSql(sql, arr);
	    	  return i;
	      }
	      
	      //删除拾到的信息表信息
	      public int deleteByIdPick(int id){
	    	  String sql="delete from t_pick where id=?";
	    	  String arr[]={id+""};
	    	int  i=dao.doExcuteSql(sql, arr);
	    	  return i;
	      }
//	      
	      //丢失信息表
	      public ArrayList<thingsInformation> getListByPageLost(int page,int pageSize){
	    	  ArrayList<thingsInformation> list = new ArrayList<thingsInformation>();
	    	  String sql="select * from t_lost "
		    	  		+ " where id not in (select x.id from (select * from t_lost order by id asc limit "+ (page-1)*pageSize+")as x)"
		    	  		+ " order by id asc limit "+pageSize;
	    	  conn=dao.getMysqlConn();
	    	  try {
				ps=conn.prepareStatement(sql);
				rs=ps.executeQuery();
			
				while(rs.next()){
					
					thingsInformation lost=new thingsInformation();
					lost.setId(rs.getInt("id"));
					lost.setUserId(rs.getString("userId"));
					lost.setState(rs.getInt("state"));
					lost.setTitle(rs.getString("title"));
					lost.setContent(rs.getString("content"));
					lost.setType(rs.getString("type"));
					lost.setLosttime(rs.getDate("losttime"));
					lost.setUpdatetime(rs.getDate("updatetime"));
					lost.setPlace(rs.getString("place"));
					lost.setImg(rs.getString("img"));
					list.add(lost);
				}
			} catch (Exception e) {
				e.printStackTrace();
			}finally{
				dao.close(rs, ps, conn);
			}
	    	   return list;
	      }
    //查询丢失地址
    public ArrayList<thingsInformation> getListByLostBuild(int page,int pageSize,String place){
        ArrayList<thingsInformation> list = new ArrayList<thingsInformation>();
        String sql="select * from t_lost "
                + " where place='"+place+"'and id not in (select x.id from (select * from t_lost order by id asc limit "+ (page-1)*pageSize+")as x)"
                + " order by id asc limit "+pageSize;
        conn=dao.getMysqlConn();
        try {
            ps=conn.prepareStatement(sql);
            rs=ps.executeQuery();

            while(rs.next()){

                thingsInformation lost=new thingsInformation();
                lost.setId(rs.getInt("id"));
                lost.setUserId(rs.getString("userId"));
                lost.setState(rs.getInt("state"));
                lost.setTitle(rs.getString("title"));
                lost.setContent(rs.getString("content"));
                lost.setType(rs.getString("type"));
                lost.setLosttime(rs.getDate("losttime"));
                lost.setUpdatetime(rs.getDate("updatetime"));
                lost.setPlace(rs.getString("place"));
                lost.setImg(rs.getString("img"));
                list.add(lost);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }finally{
            dao.close(rs, ps, conn);
        }
        return list;
    }

    //拾到物品信息表
	      public ArrayList<thingsInformation> getListByPagePick(int page,int pageSize){
	    	  ArrayList<thingsInformation> list = new ArrayList<thingsInformation>();
	    	  String sql="select * from t_pick "
		    	  		+ " where id not in (select x.id from (select * from t_pick order by id asc limit "+ (page-1)*pageSize+")as x)"
		    	  		+ " order by id asc limit "+pageSize;
	    	  conn=dao.getMysqlConn();
	    	  try {
				ps=conn.prepareStatement(sql);
				rs=ps.executeQuery();
			
				while(rs.next()){
					
					thingsInformation pick=new thingsInformation();
					pick.setId(rs.getInt("id"));
					pick.setUserId(rs.getString("userId"));
					pick.setState(rs.getInt("state"));
					pick.setTitle(rs.getString("title"));
					pick.setContent(rs.getString("content"));
					pick.setType(rs.getString("type"));
					pick.setLosttime(rs.getDate("losttime"));
					pick.setUpdatetime(rs.getDate("updatetime"));
					pick.setImg(rs.getString("img"));
					pick.setPlace(rs.getString("place"));
					list.add(pick);
				}
			} catch (Exception e) {
				e.printStackTrace();
			}finally{
				dao.close(rs, ps, conn);
			}
	    	   return list;
	      } 

	      //查询lost表中的最后一条数据
	      public ArrayList getListLost(){
	    	  ArrayList list = new ArrayList();
	    	  String sql="select   *   from   t_lost   order   by   id   desc   limit   1";
	    	  conn=dao.getMysqlConn();
	    	  try {
				ps=conn.prepareStatement(sql);
				rs=ps.executeQuery();
			
				while(rs.next()){
					thingsInformation lost=new thingsInformation();
					lost.setId(rs.getInt("id"));
					lost.setUserId(rs.getString("userId"));
					lost.setState(rs.getInt("state"));
					lost.setTitle(rs.getString("title"));
					lost.setContent(rs.getString("content"));
					lost.setType(rs.getString("type"));
					lost.setLosttime(rs.getDate("losttime"));
					lost.setUpdatetime(rs.getDate("updatetime"));
			
					list.add(lost);
				}
			} catch (Exception e) {
				e.printStackTrace();
			}finally{
				dao.close(rs, ps, conn);
			}
	    	   return list;
	      } 
	      
	      //查询Pick表中的最后一条数据
	      public ArrayList getListPick(){
	    	  ArrayList list = new ArrayList();
	    	  String sql="select   *   from   t_pick   order   by   id   desc   limit   1";
	    	  conn=dao.getMysqlConn();
	    	  try {
				ps=conn.prepareStatement(sql);
				rs=ps.executeQuery();
			
				while(rs.next()){
					thingsInformation pick=new thingsInformation();
					pick.setId(rs.getInt("id"));
					pick.setUserId(rs.getString("userId"));
					pick.setState(rs.getInt("state"));
					pick.setTitle(rs.getString("title"));
					pick.setContent(rs.getString("content"));
					pick.setType(rs.getString("type"));
					pick.setLosttime(rs.getDate("losttime"));
					pick.setUpdatetime(rs.getDate("updatetime"));
					list.add(pick);
				}
			} catch (Exception e) {
				e.printStackTrace();
			}finally{
				dao.close(rs, ps, conn);
			}
	    	   return list;
	      } 
	      
	      public static void main(String ars[]){
	    	  BaseDao baseDao = new  BaseDao();
	    	  Connection conn=null;
	    		  String sql="insert into t_user (xuehao,id,username,userpass,phoneNum)"
		  	    	  		+ "values('123456','1','admin','123456','123456') ";
	    		  conn=baseDao.getMysqlConn();
	    		  try {
	    			  PreparedStatement pss=null;
	    			  pss=conn.prepareStatement(sql);
	    			  pss.executeUpdate();
				} catch (Exception e) {
					// TODO: handle exception
				}
	    	  
	    	 
	      }

}
