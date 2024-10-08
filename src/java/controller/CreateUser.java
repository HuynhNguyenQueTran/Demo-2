/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import User.UserDAO;
import User.UserDTO;
import User.UserError;

/**
 *
 * @author hd
 */
@WebServlet(name = "CreateUser", urlPatterns = {"/CreateUser"})
public class CreateUser extends HttpServlet {

    private static final String ERROR="create.jsp";
    private static final String SUCCESS="login.jsp";
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url= ERROR;
        UserDAO dao= new UserDAO();
        UserError userError= new UserError();
        try {
            String userID= request.getParameter("userID");
            String fullName= request.getParameter("fullName");
            String roleID= request.getParameter("roleID");
            String password= request.getParameter("password");
            String confirm= request.getParameter("confirm");
            
            boolean checkValidation= true;
            if(userID.length()>50 || userID.length()<2){
                userError.setUserID("User ID must [2,50]");
                checkValidation= false;
            }
//            boolean checkDuplicate= dao.checkDuplicate(userID);
//            if(checkDuplicate){
//                userError.setUserID("Duplicate userID!");
//                checkValidation= false;
//            }
            if(fullName.length()>50 || fullName.length()<5){
                userError.setFullName("fullName  must [5,50]");
                checkValidation= false;
            }
            if(!password.equals(confirm)){
                userError.setConfirm("hai Password khong giong nhau");
                checkValidation= false;
            }
            if(checkValidation){
                UserDTO user= new UserDTO(userID, fullName, roleID, password);
//                boolean checkInsert= dao.insert(user);
                boolean checkInsert= dao.insertV2(user);
                if(checkInsert){
                    url= SUCCESS;
                }
            }else{
                request.setAttribute("USER_ERROR", userError);
            }
        } catch (Exception e) {
            log("Error at CreateController: "+ e.toString());
            if(e.toString().contains("duplicate")){
                userError.setUserID("Trung id roi!");
                request.setAttribute("USER_ERROR", userError);
            }
            
        }finally{
            request.getRequestDispatcher(url).forward(request, response);
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
