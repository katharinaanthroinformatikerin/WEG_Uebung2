<%-- 
    Document   : index
    Created on : 18.04.2017, 21:04:09
    Author     : Katharina
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
                    <li class='<%=path.endsWith("patientdata.jsp")?"active":""%>'><a href="#">Patientendaten abrufen</a></li>
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
            </main>
          </div>
    </body>
</html>
