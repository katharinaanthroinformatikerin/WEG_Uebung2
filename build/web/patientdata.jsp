<%-- 
    Document   : patientdata
    Created on : 18.04.2017, 21:04:42
    Author     : Katharina
--%>

<%@page import="java.time.LocalDate"%>
<%@page import="java.util.Enumeration"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean class="model.Patient" id="MyPatient"></jsp:useBean>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Patientenverwaltung</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"
          integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"
            integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa"
            crossorigin="anonymous"></script>
    <link rel="stylesheet" href="css/styles.css">

    </head>
    <body>
          <div class="container">
        
            <header>
                <h1>Patientenverwaltung</h1>
                <% 
                    String path = request.getServletPath();
                %>
            </header>
            <nav>
                <ul class="nav nav-pills">
                    <li class='<%=path.endsWith("index.jsp")?"active":""%>'><a href="index.jsp">Home</a></li>
                    <li class='<%=path.endsWith("newpatient.jsp")?"active":""%>'><a href="newpatient.jsp">Neuen Patienten anlegen</a></li>
                    <li class='<%=path.endsWith("patientdata.jsp")?"active":""%>'><a href="patientdata.jsp">Patientendaten abrufen</a></li>
                    <li><a href="mailto:patientenverwaltung@technikum.at">Kontakt</a></li>
                </ul>
            </nav>
            <main>
                <div class="col-md-4">
        <div id="welcome_logo_container">
            <div class="welcome_text"><h4>Willkommen im Krankenhausinformationssystem</h4></div>
            <img src="images/logo.png" alt="logo"/>
        </div>
                    
    </div>
    <div class="col-md-8">
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
                    } else if (!(paramName.equals("bloodPressureDia")
                            && Integer.parseInt(paramValues[0]) <= 85
                            && Integer.parseInt(paramValues[0]) >= 60)) {
                        styleClass = "alert alert-danger";
                    } else if (!(paramName.equals("bloodPressureSys")
                            && Integer.parseInt(paramValues[0]) <= 130
                            && Integer.parseInt(paramValues[0]) >= 100)) {
                        styleClass = "alert alert-danger";
                    } else if (!(paramName.equals("pulse")
                            && Integer.parseInt(paramValues[0]) <= 80
                            && Integer.parseInt(paramValues[0]) >= 60)) {
                        styleClass = "alert alert-danger";
                    }

                    String logOutput = paramName + " = ";
                    for (int i = 0; i < paramValues.length; i++) {
                        String paramValue = paramValues[i];
                        logOutput += (i == paramValues.length - 1) ? paramValue : paramValue + ", ";
                    }
                    out.println("<li class=\"" + styleClass + "\">");
                    out.println(logOutput);
                    out.println("</li>");
                }
                out.println("</ul>");
            %>

            <h1>Patientendaten anzeigen</h1>
                <table class="table table-striped">
                    <thead>
                    <tr>
                        <th>Beschriftung</th>
                        <th>Feld</th>
                    </tr>
                    </thead>
                    <tr><td>FirstName: </td><td><%= MyPatient.getVorname() %></td></tr>
                    <tr><td>LastName:</td><td><%= MyPatient.getNachname() %></td></tr>
                    <tr><td>email: </td><td><%= MyPatient.getEmail() %></td></tr>
                    <tr><td>svn:</td><td><%= MyPatient.getSvn() %></td></tr>
                    <tr><td>dateOfBirth:</td><td><%= MyPatient.getGeburtsdatum() %></td></tr>
                    <tr><td>gender: </td><td><%= MyPatient.getGeschlecht() %></td></tr>
                    <tr><td>bloodPressureDia:</td><td><%= MyPatient.getDiastolisch() %></td></tr>
                    <tr><td>bloodPressureSys: </td><td><%= MyPatient.getSystolisch() %></td></tr>
                    <tr><td>pulse:</td><td><%= MyPatient.getPuls() %></td></tr>
                    <tr><td>notes: </td><td><%= MyPatient.getAnmerkungen() %></td></tr>
                </table>
    </div>
            </main>
        </div>
    </body>
</html>