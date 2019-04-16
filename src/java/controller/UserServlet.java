/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.util.List;
import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;
import models.Profile;
import models.User;
import services.ProfileFacadeLocal;
import services.UserFacadeLocal;
import utilitaire.Upload;

/**
 *
 * @author THIAM
 */
@WebServlet(name = "UserServlet", urlPatterns = {"/user"})
@MultipartConfig(fileSizeThreshold = 1024*1024*2,//taille du fichier temporaire en octet sur le disque
                maxFileSize = 1024*1024*10, //taille de tous les fichier
                maxRequestSize = 1024*1024*50) //all files
public class UserServlet extends HttpServlet {

    @EJB
    private UserFacadeLocal userEJB;
    @EJB
    private ProfileFacadeLocal roleEJB;

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet UserServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet UserServlet at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
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

        String action = (request.getParameter("action") != null ? request.getParameter("action") : "");

        switch (action) {
            case "inscription":
                List<Profile> roles = roleEJB.findAll();
                request.setAttribute("roles", roles);
                getServletContext().getRequestDispatcher("/WEB-INF/register.jsp").forward(request, response);
                break;
            default:
                getServletContext().getRequestDispatcher("/WEB-INF/index.jsp").forward(request, response);
        }

    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    private static final String chemin ="D://Developpement/JEE/IntroJEE/web/WEB-INF/images/";
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        //processRequest(request, response);

        //response.getWriter().println("formulaire poster");
        String action = (request.getParameter("action") != null ? request.getParameter("action") : "");

        switch (action) {
            case "login":
                String login = request.getParameter("login");
                String pass = request.getParameter("pass");
                User u = userEJB.getUser(login, pass);
                if (u != null) {
                    HttpSession session = request.getSession(true);
                    session.setAttribute("userOnline", u);
                    getServletContext().getRequestDispatcher("/WEB-INF/main.jsp").forward(request, response);
                } else {
                    request.setAttribute("message", "Login ou mot de pass incorrect");
                    getServletContext().getRequestDispatcher("/WEB-INF/index.jsp").forward(request, response);
                }
                break;
            case "logon":
                
                
                
                Part p = null;
                
                
                if(request.getPart("photo_user") != null){
                    p = request.getPart("photo_user");
                    
                    String filePath = chemin + p.getSubmittedFileName();
                    
                    InputStream stream = p.getInputStream();
                    
                    Upload.saveFile(stream, filePath);
                }
                break;
            default:
                getServletContext().getRequestDispatcher("/WEB-INF/index.jsp").forward(request, response);
        }
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
