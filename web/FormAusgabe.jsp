<%-- 
    Document   : FormAusgabe
    Created on : 26.03.2017, 17:50:01
    Author     : Katharina
--%>

<%@page import="java.time.LocalDate"%>
<%@page import="java.util.Enumeration"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <!-- Das neueste kompilierte und minimierte CSS -->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">

        <!-- Optionales Theme -->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap-theme.min.css">

        <!-- Das neueste kompilierte und minimierte JavaScript -->
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
        <link rel="stylesheet" href="css/styles.css">
    </head>
    <body>
        <div class="container">
            <h1>Anzeige Formulardaten</h1>
            <h2>Ihre Eingaben als Ausgabe in Skriptlet</h2>
            <%
                out.println("<ul>");
                Enumeration<String> parameterNames = request.getParameterNames();

                while (parameterNames.hasMoreElements()) {
                    String paramName = parameterNames.nextElement();
                    String[] paramValues = request.getParameterValues(paramName);
                    String styleClass = "";

                    if ((paramName.equals("firstName") || paramName.equals("lastName"))
                            && paramValues[0].length() < 3) {
                        styleClass = "alert alert-danger";
                    } else if (paramName.equals("email") && !paramValues[0].endsWith(".at")) {
                        styleClass = "alert alert-danger";
                    } else if (paramName.equals("age")) {
                        int year = Integer.parseInt(paramValues[0]);
                        int month = Integer.parseInt(paramValues[1]);
                        int day = Integer.parseInt(paramValues[2]);

                        LocalDate birthdate = LocalDate.of(year, month, day);
                        LocalDate now = LocalDate.now();
                        int age = now.getYear() - birthdate.getYear();
                        if (!(age >= 18)) {
                            styleClass = "alert alert-danger";
                        }
                    } else if (paramName.equals("bloodPressureDia")
                            && !(Integer.parseInt(paramValues[0]) <= 85
                            && Integer.parseInt(paramValues[0]) >= 60)) {
                        styleClass = "alert alert-danger";
                    } else if (paramName.equals("bloodPressureSys")
                            && !(Integer.parseInt(paramValues[0]) <= 130
                            && Integer.parseInt(paramValues[0]) >= 100)) {
                        styleClass = "alert alert-danger";
                    } else if (paramName.equals("pulse")
                            && !(Integer.parseInt(paramValues[0]) <= 80
                            && Integer.parseInt(paramValues[0]) >= 60)) {
                        styleClass = "alert alert-danger";
                    }

                    String logOutput = paramName + " = " + paramValues;
                    /*
                    for (int i = 0; i < paramValues.length; i++) {
                        String paramValue = paramValues[i];
                        logOutput += (i == paramValues.length - 1) ? paramValue : paramValue + ", ";
                    }
                    */
                    out.println("<li class=\"" + styleClass + "\">");
                    out.println(logOutput);
                    out.println("</li>");
                }
                out.println("</ul>");
            %>

            <h2>Ihre Eingaben als Ausgabe mit Expressions</h2>
            <ul>
                <li>FirstName: <%= request.getParameter("firstName")%></li>
                <li>LastName: <%= request.getParameter("lastName")%></li>
                <li>email: <%= request.getParameter("email")%></li>
                <li>svn: <%= request.getParameter("svn")%></li>
                <li>dateOfBirth: <%= request.getParameter("dateOfBirth")%></li>
                <li>gender: <%= request.getParameter("gender")%></li>
                <li>bloodPressureDia: <%= request.getParameter("bloodPressureDia")%></li>
                <li>bloodPressureSys: <%= request.getParameter("blossPressureSys")%></li>
                <li>pulse: <%= request.getParameter("pulse")%></li>
                <li>notes: <%= request.getParameter("notes")%></li>
                <li>submit: <%= request.getParameter("submit")%></li>
            </ul>
        </div>
    </body>
</html>
