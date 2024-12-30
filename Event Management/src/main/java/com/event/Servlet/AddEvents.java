package com.event.Servlet;

import java.io.File;
import java.io.IOException;

import com.event.DAO.EventDAOImpl;
import com.event.DAO.EventsDAO;
import com.event.DTO.Events;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;

@WebServlet(urlPatterns = "/event")
@MultipartConfig(
    fileSizeThreshold = 1024 * 1024 * 2, // 2MB
    maxFileSize = 1024 * 1024 * 10, // 10MB
    maxRequestSize = 1024 * 1024 * 50 // 50MB
)
public class AddEvents extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // Retrieve form data
        String eventName = req.getParameter("eventName");
        String eventLocation = req.getParameter("eventLocation");
        String eventDate = req.getParameter("eventdate");
        String eventDesc = req.getParameter("eventDesc");
        String eventCategory = req.getParameter("eventCategory");
        Part imgPart = req.getPart("eventImg");

        // Input validation
        if (eventName == null || eventName.isEmpty() ||
            eventLocation == null || eventLocation.isEmpty() ||
            eventDate == null || eventDate.isEmpty() ||
            eventDesc == null || eventDesc.isEmpty() ||
            eventCategory == null || eventCategory.isEmpty() ||
            imgPart == null || imgPart.getSize() == 0) {
        	
            req.setAttribute("failure", "All fields are required.");
            req.getRequestDispatcher("addEvents.jsp").forward(req, resp);
            return;
        }

        // Save uploaded image to server
        String uploadPath = getServletContext().getRealPath("/uploaded_images");
        File uploadDir = new File(uploadPath);
        if (!uploadDir.exists()) {
            boolean dirsCreated = uploadDir.mkdirs();
            if (!dirsCreated) {
                req.setAttribute("failure", "Failed to create directory for file uploads.");
                req.getRequestDispatcher("addEvents.jsp").forward(req, resp);
                return;
            }
        }

        String filename = imgPart.getSubmittedFileName();
        String filePath = uploadPath + File.separator + filename;
        imgPart.write(filePath);

        // Generate the accessible URL for the uploaded image
        String imageUrl = req.getContextPath() + "/uploaded_images/" + filename;

        // Save event details to the database
        Events event = new Events();
        event.setEvent_name(eventName);
        event.setLocation(eventLocation);
        event.setDate(eventDate);
        event.setDescription(eventDesc);
        event.setCategory_id(Integer.parseInt(eventCategory));
        event.setImage(imageUrl);

        EventsDAO eventDAO = new EventDAOImpl();
        boolean isAdded = eventDAO.addEvents(event);

        // Redirect with success or failure message
        if (isAdded) {
            req.setAttribute("success", "Event added successfully.");
        } else {
            req.setAttribute("failure", "Failed to add the event.");
        }

        RequestDispatcher dispatcher = req.getRequestDispatcher("addEvents.jsp");
        dispatcher.forward(req, resp);
    }
}
