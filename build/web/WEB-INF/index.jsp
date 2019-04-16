<%-- 
    Document   : index
    Created on : 19 mars 2019, 20:05:34
    Author     : THIAM
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
        <title>JSP Page</title>
    </head>
    <body>
        <div class="container centered">
            <div class="row">
                <div class="col-offset-3 col-lg-6 col-offset-3 centered">
                    <form class="form-signin" method="POST" action="">
                        <input type="hidden" name="action" value="login">

                        <h1 class="h3 mb-3 font-weight-normal"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">Veuillez vous connecter</font></font><img class="mb-4" src="/docs/4.3/assets/brand/bootstrap-solid.svg" alt="" width="72" height="72"></h1>
                        <label for="inputEmail" class="sr-only"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">Adresse électronique</font></font></label>
                        <input type="text" name="login" id="inputLogin" class="form-control" placeholder="Email address" required="" autofocus="" >
                        <label for="inputPassword" class="sr-only"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">Mot de passe</font></font></label>
                        <input type="password" name="pass" id="inputPassword" class="form-control" placeholder="Password" required="">
                        <div class="checkbox mb-3">
                            <label>
                                <input type="checkbox" value="remember-me"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;"> Souviens-toi de moi
                                </font></font></label>
                        </div>
                        <button class="btn btn-lg btn-primary btn-block" type="submit"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">se connecter</font></font></button>
                        <p class="mt-5 mb-3 text-muted"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">© 2017-2019</font></font></p>
                    </form>
                    
                    ${message}
                </div>
            <div>
        </div>
    </body>
</html>