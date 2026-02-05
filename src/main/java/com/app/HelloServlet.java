package com.app;
import java.io.IOException;
import javax.servlet.http.*;
import javax.servlet.annotation.WebServlet;
@WebServlet("/hello")
public class HelloServlet extends HttpServlet {
protected void doGet(HttpServletRequest req, HttpServletResponse res)
throws IOException {
res.setContentType("text/html");
res.getWriter().println("<h1>Hello from Java Web App!</h1>");
}
}
