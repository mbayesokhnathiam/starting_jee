<%-- 
    Document   : register
    Created on : 9 avr. 2019, 20:31:36
    Author     : THIAM
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
        <script src="js/jquery.min.js" type="text/javascript"></script>
        <title>JSP Page</title>
    </head>
    <body>
        <section class="content" >
            <div class="row" >
                <!-- left column -->
                <div class="col-md-6" mx-auto>
                    <!-- general form elements -->
                    <br>
                    <br>
                    <div class="box box-primary">
                        <div class="box-header with-border">
                            <h3 class="box-title">Création de votre compte d'accés </h3>
                            <input type="hidden" name="action" value="inscription">
                        </div>
                        <form id="customerform" role="form" method="post" action="" enctype="Multipart/form-data">
                            <input type="hidden" name="action" value="logon">

                            <div class="box-body">



                                <div class="form-group">
                                    <label for="inputName">Nom</label>
                                    <input type="text" name="nom_user" class="form-control" id="inputName"
                                           placeholder="Entrer votre nom">

                                </div>


                                <div class="form-group">
                                    <label for="inputLastName">Prénom</label>
                                    <input type="text" name="prenom_user" class="form-control" id="inputLastName"
                                           placeholder="Entrer votre prénom">

                                </div>
                                


                                <div class="form-group">
                                    <div class="input-group">
                                        <label for="imageUser">Photo Utilisateur</label>
                                        <input type="file" name="photo_user" id="photo">
                                    </div>


                                </div>

                            </div>


                            <div class="form-group">
                                <label>Role</label>
                                <select class="form-control" name="role_user" required="true">

                                    <option value="">Selectionner le role</option>

                                    <c:forEach items="${roles}" var="r">
                                        <option value="${r.idProfile}">${r.libelle}</option>
                                    </c:forEach>

                                </select>
                            </div>




                            <!-- /.box-body -->

                            <div class="box-footer">
                                <button type="submit" class="btn btn-primary">ENREGISTRER</button>
                            </div>

                        </form>
                    </div>
                    <!-- /.box -->


                    <!-- /input-group -->
                </div>
                <img id="image" src="images/logo.png" width="300px" height="300px">
                <span id="message"></span>
                <!-- /.box-body -->
            </div>


        </section>
    </body>

    <script type="text/javascript">
        function imageIsLoaded(e) {
            //$("#file").css("color","green");
            //$('#image_preview').css("display", "block");
            $('#image').attr('src', e.target.result);
            $('#image').attr('width', '300px');
            $('#image').attr('height', '300px');
        }
        ;
        $('#photo').change(function () {
            //alert('ok');
            var assetsBaseDir = "images/";

            $("#message").empty(); // To remove the previous error message
            var file = this.files[0];

            var imagefile = file.type;
            //alert(imagefile);
            var match = ["image/jpeg", "image/png", "image/jpg"];
            if (!((imagefile === match[0]) || (imagefile === match[1]) || (imagefile === match[2]))) {
                //alert('no match');
                $('#image').attr('src', assetsBaseDir + 'logo.png');
                $("#message").html("Selectionner une image valide, Note : Seules jpeg, jpg and png Images sont autorisé");
                return false;
            } else {
                //alert('match');
                var reader = new FileReader();
                reader.onload = imageIsLoaded;
                reader.readAsDataURL(this.files[0]);
            }
        });




    </script>

</html>
