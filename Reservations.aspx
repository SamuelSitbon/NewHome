<%@ Page Title="" Language="C#" MasterPageFile="~/ClientConnected.Master" AutoEventWireup="true" CodeBehind="Reservations.aspx.cs" Inherits="NewHome.Reservations" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ConnectedContent" runat="server">
    <script src="https://kit.fontawesome.com/061b36ae1c.js"></script>
    <link href="/Content/Image.css" rel="stylesheet" id="bootstrap-css">
    <div class="d-flex w border bg-light p-2 mb-1">
        <div class="border">
            <img id="thumbnail" style="width: 600px" class="thumbnail" data-toggle="modal" data-target="#imagemodalzoom" src="<%= reservation.Photo %>">
        </div>
        <div class="container">

            <h4 class="d-flex justify-content-between align-items-center mb-3">
                <span class="text-muted">Votre Réservation</span>
            </h4>
            <ul class="list-group mb-3">
                <li class="list-group-item d-flex justify-content-between lh-condensed">
                    <div>
                        <h6 class="my-0">Nom</h6>
                        <small class="text-muted"><%= reservation.Nom %></small>
                    </div>
                </li>
                <li class="list-group-item d-flex justify-content-between lh-condensed">
                    <div>
                        <h6 class="my-0">Type</h6>
                        <small class="text-muted"><%= reservation.Type %></small>
                    </div>
                </li>
                <li class="list-group-item d-flex justify-content-between lh-condensed">
                    <div>
                        <h6 class="my-0">Adresse</h6>
                        <small class="text-muted"><%= reservation.Adresse.Numero + " " + reservation.Adresse.Voie %> (<%= reservation.Adresse.Ville %>, <%= reservation.Adresse.CodePostal %>)</small>
                    </div>
                </li>
                <li class="list-group-item d-flex justify-content-between bg-light">
                    <div class="text-success">
                        <small>Prix par nuit (€)</small>
                    </div>
                    <span class="text-success"><%= reservation.PrixDeBase %></span>
                </li>
                <li class="list-group-item d-flex justify-content-between">
                    <span>Total</span>
                    <strong>Truc à mettre ici</strong>
                </li>
            </ul>
        </div>
    </div>

    <div class="border bg-light text-center p-2 mb-1">
            <h4 class="mb-3">
                <span class="text-muted">Choisissez vos dates de Réservation</span>
            </h4>
            <asp:TextBox ID="Calendar" Style="width: 300px" runat="server" CssClass="form-control d-inline"></asp:TextBox>
         <a ID="PaiementRedirection" class="btn btn-success" href="Paiement?id=<%=reservation.IdHebergement%>"><i class="fas fa-coins">&nbsp;&nbsp;Passer au Paiement</i></a>
    </div>





    <%--MODAL--%>
    <div class="modal fade" id="imagemodalzoom" tabindex="-1" role="dialog" aria-hidden="true">
        <div class="modal-dialog modal-lg">
            <div class="modal-content">
                <span class="close">&times;</span>
                <img src="#" id="imagepreview" class="modal-content">
            </div>
        </div>
    </div>

    <%--JS POUR MODAL--%>
    <script>
        $(".thumbnail").on("click", function (e) {
            $("#imagepreview").attr("src", e.target.getAttribute("src"));
        });

        $('#<%=Calendar.ClientID%>').daterangepicker({
            "minDate": new Date(),
            "locale": {
                "format": "DD/MM/YYYY",
                "separator": " - ",
                "applyLabel": "Valider",
                "cancelLabel": "Annuler",
                "fromLabel": "Du",
                "toLabel": "Au",
                "customRangeLabel": "Custom",
                "weekLabel": "W",
                "daysOfWeek": [
                    "D",
                    "L",
                    "M",
                    "Me",
                    "J",
                    "V",
                    "S"
                ],
                "monthNames": [
                    "Janvier",
                    "Février",
                    "Mars",
                    "Avril",
                    "Mai",
                    "Juin",
                    "Juillet",
                    "Août",
                    "Septembre",
                    "Octobre",
                    "Novembre",
                    "Décembre"
                ],
                "firstDay": 1
            },
        }, function (start, end, label) {
            console.log('New date range selected: ' + start.format('YYYY-MM-DD') + ' to ' + end.format('YYYY-MM-DD') + ' (predefined range: ' + label + ')');
        });
    </script>

</asp:Content>
