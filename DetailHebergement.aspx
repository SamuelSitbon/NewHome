<%@ Page Title="DetailHebergement" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="DetailHebergement.aspx.cs" Inherits="NewHome.DetailHebergement" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <script src="https://kit.fontawesome.com/061b36ae1c.js"></script>
    <link href="/Content/Image.css" rel="stylesheet" id="bootstrap-css">
     <div class="d-flex w border bg-light p-2 mb-1">
                <div class="border">
                    <img id="thumbnail" style="width: 500px" class = "thumbnail" data-toggle="modal" data-target="#imagemodalzoom" src="<%= detail.Photo %>">
                </div>
                <div class="d-flex flex-column px-4">
                    <div>
                        <h3><%= detail.Nom %></h3>
                    </div>
                    <div>
                        <h5>Type: <%= detail.Type %></h5>
                    </div>
                    <div>
                        <p class="text-danger"><%= detail.Adresse.Numero + " " + detail.Adresse.Voie %> (<%= detail.Adresse.Ville %>, <%= detail.Adresse.CodePostal %>)</p>
                    </div>

                    <div>
                        <p><%= detail.Description %></p>
                    </div>
                    <div>
                        <p class="text-success"><%= detail.PrixDeBase %>€/nuit</p>
                    </div>
                     <div>
                    <asp:LinkButton ID="FavLinkButton2" class="btn btn-danger mb-1" runat="server" OnClick="FavLinkButton2_Click"><i class="fas fa-shopping-cart">&nbsp;&nbsp;Ajouter aux Favoris</i></asp:LinkButton>
                    </div>
                    <div>
                    <a ID="ReserverRedirection2" class="btn btn-success" href="Reservations?id=<%=detail.IdHebergement%>"><i class="fas fa-key">&nbsp;&nbsp;Réserver l'hébergement</i></a>
                    </div>
                </div>
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
    </script>
</asp:Content>
