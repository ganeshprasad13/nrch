package cris.servlet;

import java.io.File;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

/**
 * Servlet implementation class UploadFileServlet
 */
@WebServlet("/uploadFile")
@MultipartConfig(
    fileSizeThreshold = 1024 * 1024 * 1,
    maxFileSize = 1024 * 1024 * 50,        // allow 50MB
    maxRequestSize = 1024 * 1024 * 60
)
public class UploadFileServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        Part part = request.getPart("file");
        String fileName = part.getSubmittedFileName();

        // upload folder
        String uploadPath = getServletContext().getRealPath("") + File.separator + "uploads";
        File uploadDir = new File(uploadPath);
        if (!uploadDir.exists()) uploadDir.mkdir();

        // save file
        String filePath = uploadPath + File.separator + fileName;
        part.write(filePath);

        // public URL
        String fileUrl = request.getContextPath() + "/uploads/" + fileName;

        response.setContentType("text/plain");
        response.getWriter().write(fileUrl);
    }
}

