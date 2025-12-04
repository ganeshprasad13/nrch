package cris.servlet;

import java.io.File;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;

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

        HttpSession session = request.getSession(false);
        boolean notLoggedIn = (session == null || session.getAttribute("DBAusername") == null);

        // Detect if this is a TinyMCE upload (AJAX call)
        boolean isAjax = "XMLHttpRequest".equals(request.getHeader("X-Requested-With"));

        if (notLoggedIn) {

            if (isAjax) {
                // TinyMCE can NOT follow redirects, so return error instead
                response.setStatus(HttpServletResponse.SC_UNAUTHORIZED);
                response.getWriter().write("NOT_LOGGED_IN");
                return;
            } else {
                // Browser request → safe redirect
                response.sendRedirect(request.getContextPath() + "/index.jsp");
                return;
            }
        }

        // ==== Continue Upload If Logged In ====
        Part filePart = request.getPart("file");

        if (filePart == null) {
            response.getWriter().write("NO_FILE");
            return;
        }

        String fileName = filePart.getSubmittedFileName();

        String uploadPath = getServletContext().getRealPath("/") + "uploads";

        File uploadDir = new File(uploadPath);
        if (!uploadDir.exists()) uploadDir.mkdirs();
        String milli = String.valueOf(System.currentTimeMillis());
        filePart.write(uploadPath + File.separator + milli+"_"+fileName);

        String fileUrl = request.getScheme() + "://" +
                request.getServerName() + ":" +
                request.getServerPort() +
                request.getContextPath() + "/uploads/" + milli+"_"+fileName;
        response.getWriter().write(fileUrl);
    }
}

