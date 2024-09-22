/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package User;

import Product.BookDTO;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import utils.DBUtil;

/**
 *
 * @author Admin
 */
public class UserDAO {
    private static final String SEARCH="SELECT userID, fullName, roleID FROM tblUsers WHERE fullName like ?";
    private static final String SEARCHBOOK="SELECT SKU, Name, Price, Description, Quantity FROM tblBooks WHERE Name like ?";
    private static final String DELETE="DELETE tblUsers WHERE userID=?";
    private static final String UPDATE="UPDATE tblUsers SET fullName=?, roleID=? WHERE userID=?";
    private static final String CHECK_DUPLICATE="SELECT userID FROM tblUsers WHERE userID=?  ";
    private static final String CHECK_BOOK="SELECT SKU FROM tblBooks WHERE SKU=?  ";
    private static final String INSERT="INSERT INTO tblUsers(userId, fullName, roleID, password) "
            + "                         VALUES(?,?,?,?)";
    private static final String INSERTBOOK="Insert into tblBooks (SKU, Name, Price, Description, Quantity)\n" +
                            "Values (?,?,?,?,?)";
    public UserDTO checkLogin(String userID, String password) throws SQLException{
        UserDTO user = null;
        Connection conn = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        String sql = "SELECT fullName, roleID FROM tblUsers WHERE userID = ? AND password = ?";
        try{
            conn = DBUtil.getConnection();
            if(conn != null){
                stm = conn.prepareStatement(sql);
                stm.setString(1, userID);
                stm.setString(2, password);
                rs = stm.executeQuery();
                if(rs.next()){
                  String fullName = rs.getString("fullName");
                  String roleID = rs.getString("roleID");
                  user = new UserDTO(userID, fullName, roleID, password);
                }
            }
        }catch(Exception ex){
            ex.printStackTrace();
        }finally{
            if(rs != null){
                rs.close();
            }
            if(stm != null){
                stm.close();
            }
            if(conn != null){
                conn.close();
            }
        }
        
        return user;
    }
    
    public List<UserDTO> getListUser(String search) throws SQLException {
        List<UserDTO> list= new ArrayList<>();
        Connection conn= null;
        PreparedStatement ptm= null;
        ResultSet rs= null;
        try {
            conn= DBUtil.getConnection();
            if(conn!= null){
                ptm= conn.prepareStatement(SEARCH);
                ptm.setString(1, "%"+search+"%");
                rs= ptm.executeQuery();
                while(rs.next()){
                    String userID= rs.getString("userID");
                    String fullName= rs.getString("fullName");
                    String roleID= rs.getString("roleID");
                    String password= "***";
                    list.add(new UserDTO(userID, fullName, roleID, password));
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }finally{
            if(rs!= null) rs.close();
            if(ptm!= null) ptm.close();
            if(conn!= null) conn.close();
        }
        return list;
    }
    
    
    public List<BookDTO> getListBook (String searchBook) throws SQLException {
        List<BookDTO> list1= new ArrayList<>();
        Connection conn= null;
        PreparedStatement ptm= null;
        ResultSet rs= null;
        try {
            conn= DBUtil.getConnection();
            if(conn!= null){
                ptm= conn.prepareStatement(SEARCHBOOK);
                ptm.setString(1, "%"+searchBook+"%");
                rs= ptm.executeQuery();
                while(rs.next()){
                    String SKU= rs.getString("SKU");
                    String Name= rs.getString("Name");
                    double price= rs.getDouble("Price");
                    String Description=rs.getString("Description");
                    int Quantity=rs.getInt("Quantity");
                    list1.add(new BookDTO(SKU, Name, price, Description, Quantity));
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }finally{
            if(rs!= null) rs.close();
            if(ptm!= null) ptm.close();
            if(conn!= null) conn.close();
        }
        return list1;
    }

    public boolean delete(String userID) throws SQLException {
        boolean checkDelete= false;
        Connection conn= null;
        PreparedStatement ptm= null;
        try {
            conn= DBUtil.getConnection();
            if(conn!= null){
                ptm= conn.prepareStatement(DELETE);
                ptm.setString(1, userID);
                checkDelete= ptm.executeUpdate()>0?true:false;
            }
        } catch (Exception e) {
        }finally{
            if(ptm!= null) ptm.close();
            if(conn!= null) conn.close();
        }
        return checkDelete;
    }

    public boolean update(UserDTO user) throws SQLException {
        boolean checkUpdate= false;
        Connection conn= null;
        PreparedStatement ptm= null;
        try {
            conn= DBUtil.getConnection();
            if(conn!= null){
                ptm= conn.prepareStatement(UPDATE);
                ptm.setString(1, user.getFullName());
                ptm.setString(2, user.getRoleID());
                ptm.setString(3, user.getUserID());
                checkUpdate= ptm.executeUpdate()>0?true:false;
            }
        } catch (Exception e) {
        }finally{
            if(ptm!= null) ptm.close();
            if(conn!= null) conn.close();
        }
        return checkUpdate;
    }

    /**
     * Check Duplicate book
     * @param SKU
     * @return
     * @throws SQLException 
     */
    public boolean checkDuplicateBook(String SKU) throws SQLException {
        boolean check= false;
        Connection conn= null;
        PreparedStatement ptm= null;
        ResultSet rs= null;
        try {
            conn= DBUtil.getConnection();
            if(conn!= null){
                ptm= conn.prepareStatement(CHECK_BOOK);
                ptm.setString(1, SKU);
                rs= ptm.executeQuery();
                if(rs.next()){
                    check= true;
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }finally{
            if(rs!= null) rs.close();
            if(ptm!= null) ptm.close();
            if(conn!= null) conn.close();
        }
        return check;
    }
    public boolean checkDuplicate(String userID) throws SQLException {
        boolean check= false;
        Connection conn= null;
        PreparedStatement ptm= null;
        ResultSet rs= null;
        try {
            conn= DBUtil.getConnection();
            if(conn!= null){
                ptm= conn.prepareStatement(CHECK_DUPLICATE);
                ptm.setString(1, userID);
                rs= ptm.executeQuery();
                if(rs.next()){
                    check= true;
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }finally{
            if(rs!= null) rs.close();
            if(ptm!= null) ptm.close();
            if(conn!= null) conn.close();
        }
        return check;
    }

    public boolean insert(UserDTO user) throws SQLException {
        boolean checkInsert= false;
        Connection conn= null;
        PreparedStatement ptm= null;
        try {
            conn= DBUtil.getConnection();
            if(conn!= null){
                ptm= conn.prepareStatement(INSERT);
                ptm.setString(1, user.getUserID());
                ptm.setString(2, user.getFullName());
                ptm.setString(3, user.getRoleID());
                ptm.setString(4, user.getPassword());
                checkInsert= ptm.executeUpdate()>0?true:false;
            }
        } catch (Exception e) {
        }finally{
            if(ptm!= null) ptm.close();
            if(conn!= null) conn.close();
        }
        return checkInsert;
    }

    public void insertBook(BookDTO book) throws SQLException {
        Connection conn= null;
        PreparedStatement ptm= null;
        String sql = "Insert into tblBooks values(?,?,?,?,?)";
        try {
            conn= DBUtil.getConnection();
            if(conn!= null){
                ptm= conn.prepareStatement(sql);
                ptm.setString(1, book.getSKU());
                ptm.setString(2, book.getName());
                ptm.setDouble(3, book.getPrice());
                ptm.setString(4, book.getDescription());
                ptm.setInt(5, book.getQuantity());
                ptm.executeUpdate();
            }
        } catch (Exception e) {
        }finally{
            if(ptm!= null) ptm.close();
            if(conn!= null) conn.close();
        }
    }
    public BookDTO getABook(String SKU) throws ClassNotFoundException, SQLException {
        String sql = "SELECT * from tblBooks WHERE SKU=?";
        Connection conn= DBUtil.getConnection();
        try {
          PreparedStatement ptm= conn.prepareStatement(sql) ;
          ptm.setString(1, SKU);
          ResultSet rs = ptm.executeQuery();
          if(rs.next()){
              BookDTO b = new BookDTO(rs.getString(1),rs.getString(2),rs.getDouble(3), rs.getString(4),rs.getInt(5));
              return b;
          }
        } catch (Exception e) {
        }
        return null;
    }
    public boolean insertV2(UserDTO user) throws ClassNotFoundException, SQLException {
        boolean checkInsert= false;
        Connection conn= null;
        PreparedStatement ptm= null;
        try {
            conn= DBUtil.getConnection();
            if(conn!= null){
                ptm= conn.prepareStatement(INSERT);
                ptm.setString(1, user.getUserID());
                ptm.setString(2, user.getFullName());
                ptm.setString(3, user.getRoleID());
                ptm.setString(4, user.getPassword());
                checkInsert= ptm.executeUpdate()>0?true:false;
            }
        } finally{
            if(ptm!= null) ptm.close();
            if(conn!= null) conn.close();
        }
        return checkInsert;
    }
    
    
    public static void main(String[] args) throws SQLException, ClassNotFoundException {
        UserDAO a = new UserDAO();
//        List<BookDTO> list = a.getListBook("B");
        BookDTO moi = a.getABook("BOOK01");
        System.out.println(moi);
    }
}
