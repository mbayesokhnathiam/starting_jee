<%-- 
    Document   : users
    Created on : 23 avr. 2019, 16:45:21
    Author     : THIAM
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Table V02</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <!-- <link rel="stylesheet" type="text/css" href="css/bootstrap-icon.min.css"> -->
        <!--===============================================================================================-->
        <link rel="icon" type="image/png" href="images/icons/favicon.ico" />

        <!--===============================================================================================-->
        <link rel="stylesheet" type="text/css" href="vendor/bootstrap/css/bootstrap.min.css">
        <!--===============================================================================================-->
        <!-- <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css"> -->
        <!--===============================================================================================-->
        <link rel="stylesheet" type="text/css" href="fonts/font-awesome-4.7.0/css/font-awesome.min.css">
        <!--===============================================================================================-->
        <link rel="stylesheet" type="text/css" href="vendor/animate/animate.css">
        <!--===============================================================================================-->
        <link rel="stylesheet" type="text/css" href="vendor/select2/select2.min.css">
        <!--===============================================================================================-->
        <link rel="stylesheet" type="text/css" href="vendor/perfect-scrollbar/perfect-scrollbar.css">
        <!--===============================================================================================-->
        <link rel="stylesheet" type="text/css" href="css/util.css">
        <link rel="stylesheet" type="text/css" href="css/main.css">
        <!--===============================================================================================-->

        <!-- <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"> -->
        <style>
            .imgcontainer {
                text-align: center;
                margin: 24px 0 12px 0;
                position: relative;
            }

            img.avatar {
                width: 40%;
                border-radius: 50%;
            }
        </style>

    </head>

    <body>

        <div class="limiter">
            <div class="container-table100">
                <div class="wrap-table100">
                    <div class="table">

                        <div class="row header">
                            <!-- <div class="cell">
                                            image
                            </div> -->
                            <div class="cell">
                                Nom
                            </div>
                            <div class="cell">
                                Login
                            </div>
                            <div class="cell">
                                Password
                            </div>
                            <div class="cell">
                                Action
                            </div>
                        </div>
                        <c:forEach items="${users}" var="u">
                            <div class="row">
                                <!-- <div class="cell" data-title="Age">
                                                <img src="images/img_avatar2.png" alt="" class="photo">
                                        </div> -->

                                <div class="cell" data-title="Full Name">
                                    <span>	<img src="images/${u.photo}" alt="" class="photo" width="60px"></span>
                                        ${u.prenom} ${u.nom}
                                </div>
                                <div class="cell" data-title="Age">
                                    ${u.login}
                                </div>
                                <div class="cell" data-title="Job Title">
                                    ********
                                </div>
                                <div class="cell" data-title="Location">
                                    <button type="button" class="btn btn-primary" data-toggle="modal"
                                            data-target="#exampleModalCenter${u.id}">
                                        Edit
                                    </button>

                                    <button type="button" class="btn btn-danger" data-toggle="modal"
                                            data-target="#exampleModal2${u.id}">
                                        Remove
                                    </button>

                                </div>
                            </div>
                            <!-- Modal -->
                            <div class="modal fade" id="exampleModalCenter${u.id}" tabindex="-1" role="dialog"
                                 aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
                                <div class="modal-dialog modal-dialog-centered" role="document">
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <h5 class="modal-title" id="exampleModalLongTitle">Edition</h5>
                                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                <span aria-hidden="true">&times;</span>
                                            </button>
                                        </div>
                                        <div class="modal-body">
                                            <form method="POST" action="">

                                                <input type="hidden" name="action"  value="edit" >
                                                <div class="imgcontainer">
                                                    <img src="images/${u.photo}" alt="Avatar" class="avatar">
                                                    <input type="hidden" name="id" value="${u.id}">
                                                </div>
                                                <div class="form-group">
                                                    <label class="form-control-label">Prenom:</label>
                                                    <input type="text" class="form-control" name="prenom" value="${u.prenom}">
                                                </div>
                                                <div class="form-group">
                                                    <label class="form-control-label">Nom:</label>
                                                    <input type="text" class="form-control" name="nom" value=" ${u.nom}">
                                                </div>
                                                
                                                <div class="form-group">
                                                    <label>Role</label>
                                                    <select class="form-control" name="role_user" required="true">



                                                        <c:forEach items="${roles}" var="r">
                                                            <option value="${r.idProfile}">${r.libelle}</option>
                                                        </c:forEach>

                                                    </select>
                                                </div>
                                                <!-- <div class="form-group">
                                                        <label class="form-control-label">Nom:</label>
                                                        <textarea class="form-control"></textarea>
                                                </div> -->
                                                <div class="modal-footer">
                                                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                                                    <button type="submit" class="btn btn-primary">Save changes</button>
                                                    <span>${message}</span>
                                                </div>
                                            </form>
                                        </div>

                                    </div>
                                </div>
                            </div>
                            <div class="modal fade" id="exampleModal2${u.id}" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
                                 aria-hidden="true">
                                <div class="modal-dialog" role="document">
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <h5 class="modal-title" id="exampleModalLabel">Suppression</h5>
                                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                <span aria-hidden="true">&times;</span>
                                            </button>
                                        </div>
                                        <div class="modal-body">
                                            Etes vous sure de supprimer l'utilisateur ${u.prenom} ${u.nom}?
                                        </div>
                                        <div class="modal-footer">
                                            <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                                            <button type="button" class="btn btn-danger">Valider</button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </c:forEach>

                    </div>
                </div>
            </div>
        </div>




        <!-- Modal -->



        <!--===============================================================================================-->
        <script src="vendor/jquery/jquery-3.2.1.min.js"></script>
        <!--===============================================================================================-->
        <script src="vendor/bootstrap/js/popper.js"></script>
        <script src="vendor/bootstrap/js/bootstrap.min.js"></script>
        <!--===============================================================================================-->
        <script src="vendor/select2/select2.min.js"></script>
        <!--===============================================================================================-->
        <script src="js/main.js"></script>

    </body>

</html>
