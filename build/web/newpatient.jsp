<%-- 
    Document   : newpatient
    Created on : 18.04.2017, 21:04:24
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
        <li><a href="index.jsp">Home</a></li>
        <li class='<%=path.endsWith("newpatient.jsp")?"active":""%>'><a href="#">Neuen Patienten anlegen</a></li>
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
        <div id="formContainer">

            <form action="patientdata.jsp" method="post">
                <h1>Neuen Patienten anlegen</h1>
                <table class="table table-striped">
                    <thead>
                    <tr>
                        <th>Beschriftung</th>
                        <th>Feld</th>
                    </tr>
                    </thead>
                    <tbody>
                    <tr>
                        <td><label for="firstName">Vorname:</label></td>
                        <td><input type="text" class="form-control" id="firstName" name="firstName" placeholder="Martina" required>*</td>
                    </tr>
                    <tr>
                        <td><label for="lastName">Nachname:</label></td>
                        <td><input type="text" class="form-control" id="lastName" name="lastName" placeholder="Musterfrau" required>*</td>
                    </tr>
                    <tr>
                        <td><label for="email">E-Mail:</label></td>
                        <td><input type="email" class="form-control" id="email" name="email" placeholder="me@home.at" required>*</td>
                    </tr>
                    <tr>
                        <td><label for="svn">SVN:</label></td>
                        <td><input type="number" max="9999" min="0" id="svn" name="svn" placeholder="1234" required>*</td>
                    </tr>
                    <tr>
                        <td><label for="dateOfBirth">Geburtsdatum:</label></td>
                        <td><input type="date" class="form-control" id="dateOfBirth" name="dateOfBirth" required>*</td>
                    </tr>
                    <tr>
                        <td><label>Geschlecht:</label></td>
                        <td>
                            <label class="radio-inline">
                                <input type="radio" name="gender" id="genderOptionMale" value="m">m
                            </label>
                            <label class="radio-inline">
                                <input type="radio" name="gender" id="genderOptionFemale" value="f">f
                            </label>
                            <label class="radio-inline">
                                <input type="radio" name="gender" id="genderOptionNA" value="na" checked="checked">keine Angabe
                            </label>
                        </td>
                    </tr>
                    <tr>
                        <td><label for="bloodPressureDia">Blutdruck Diastolisch:</label></td>
                        <td><input type="number" max="200" min="0" id="bloodPressureDia" name="bloodPressureDia" required>*</td>
                    </tr>
                    <tr>
                        <td><label for="bloodPressureSys">Blutdruck Systolisch:</label></td>
                        <td><input type="number" max="200" min="0" id="bloodPressureSys" name="bloodPressureSys" required>*</td>
                    </tr>
                    <tr>
                        <td><label for="pulse">Puls:</label></td>
                        <td><input type="number" max="200" min="0" id="pulse" name="pulse" required>*</td>
                    </tr>
                    <tr>
                        <td><label for="notes">Anmerkungen:</label></td>
                        <td><textarea class="form-control" rows="3" id="notes" name="notes"></textarea></td>
                    </tr>
                    <tr>
                        <td>
                            <button type="reset" class="btn btn-default">Abbrechen</button>
                        </td>
                        <td>
                            <input type="submit" class="btn btn-default" name="submit" value="Abschicken">
                        </td>
                    </tr>
                    </tbody>
                </table>
            </form>
        </div>
    </div>
</main>
<footer>
</footer>
    </div>
    </body>
</html>
