<%@ Page Title="ListHebergements" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ListHebergements.aspx.cs" Inherits="NewHome.ListHebergements" %>
<%@ PreviousPageType VirtualPath="~/Default.aspx" %>


<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <link href="/Content/Image.css" rel="stylesheet" id="bootstrap-css">

    <asp:ListView ID="lvwHebergement" runat="server" OnPagePropertiesChanging="lvwHebergement_PagePropertiesChanging">
        <ItemTemplate>
            <div class="d-flex border bg-light p-2 mb-1">
                <div class="border">
                    <img id ="thumbnail" class = "thumbnail" style="width: 400px" data-toggle="modal" data-target="#imagemodalzoom" src="<%#Eval("Photo")%>">
                </div>
                <div class="d-flex flex-column px-4">
                    <div>
                        <a href ="DetailHebergement?id=<%#Eval("IdHebergement")%>"><h3><%#Eval("Nom")%></h3></a>
                        <%--<asp:LinkButton ID="LinkDetail" runat="server" CommandArgument='<%#Eval("IdHebergement")%>' OnClick="LinkDetail_Click"><h3><%#Eval("Nom")%></h3></asp:LinkButton>--%>
                    </div>
                    <div>
                        <p><%#Eval("Description")%></p>
                    </div>
                    <div>
                        <p class="text-success"><%#Eval("PrixDeBase")%>€/nuit</p>
                    </div>
                    <div>
                        <asp:LinkButton ID="FavLinkButton" class="btn btn-danger mb-1" runat="server" OnClick="FavLinkButton_Click" CommandArgument='<%#Eval("IdHebergement")%>'><i class="fas fa-shopping-cart">&nbsp;&nbsp;Ajouter aux Favoris</i></asp:LinkButton>
                    </div>
                    <div>
                        <a ID="ReserverRedirection" href="Reservations?id=<%#Eval("IdHebergement")%>" class="btn btn-success"><i class="fas fa-key">&nbsp;&nbsp;Réserver l'hébergement</i></a>
                    </div>
                </div>
            </div>

        </ItemTemplate>

    </asp:ListView>

    <div class="bg-light">
        <asp:DataPager ID="dtpHebergement" PagedControlID="lvwHebergement" PageSize="5" runat="server">
            <Fields>

                <asp:NumericPagerField />

            </Fields>
        </asp:DataPager>
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

