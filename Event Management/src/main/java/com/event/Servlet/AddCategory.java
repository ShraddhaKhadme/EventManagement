package com.event.Servlet;

import java.io.File;
import java.io.IOException;

import com.event.DAO.EventCategoryDAO;
import com.event.DAO.EventCategoryDAOImpl;
import com.event.DTO.EventCategory;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;

@WebServlet(urlPatterns = "/add")
@MultipartConfig(
    fileSizeThreshold = 1024 * 1024 * 2, // 2MB
    maxFileSize = 1024 * 1024 * 10,      // 10MB
    maxRequestSize = 1024 * 1024 * 50   // 50MB
)
public class AddCategory extends HttpServlet {

    private static final String UPLOAD_DIRECTORY = "uploads";

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        // Get the category name from the form
        String categoryName = request.getParameter("categoryName");

        // Get the uploaded file
        Part filePart = request.getPart("eventImg");
        String fileName = extractFileName(filePart);

        // Define the path where the file will be saved
        String uploadPath = getServletContext().getRealPath("") + File.separator + UPLOAD_DIRECTORY;
        File uploadDir = new File(uploadPath);
        if (!uploadDir.exists()) {
            uploadDir.mkdir();
        }

        String filePath = uploadPath + File.separator + fileName;
        String fileUrl = UPLOAD_DIRECTORY + "/" + fileName;

        try {
            // Save the file to the server
            filePart.write(filePath);

            // Save the category details to the database
            EventCategory eventCategory = new EventCategory();
            eventCategory.setName(categoryName);
            eventCategory.setImage(fileUrl);

            EventCategoryDAO eventCategoryDAO = new EventCategoryDAOImpl();
            boolean isSaved = eventCategoryDAO.AddCategory(eventCategory);

            if (isSaved &&eventCategory!=null) {
                request.setAttribute("success", "Category added successfully!");
                
            } else {
                request.setAttribute("failure", "Failed to add category.");
            }
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("failure", "Error occurred: " + e.getMessage());
        }

        // Redirect back to the JSP page
        request.getRequestDispatcher("addCategory.jsp").forward(request, response);
    }

    private String extractFileName(Part part) {
        String contentDisp = part.getHeader("content-disposition");
        for (String content : contentDisp.split(";")) {
            if (content.trim().startsWith("filename")) {
                return content.substring(content.indexOf("=") + 2, content.length() - 1);
            }
        }
        return "";
    }
}
