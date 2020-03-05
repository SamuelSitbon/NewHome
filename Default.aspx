<%@ Page Title="Accueil" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="NewHome._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <link href="/Content/Carousel.css" rel="stylesheet" id="bootstrap-css">

<div class="container-fluid">
    <div class="row pt-1 pb-1">
        <div class="col-lg-12">
            <div class="col-md-12">
			<h2>New<b>Home</b></h2>
            </div>
        </div>
    </div>
</div>
        <section>
        <div id="carouselExampleFade" class="carousel slide carousel-fade" data-ride="carousel">
            <ol class="carousel-indicators carousel-bottom">
                <li data-target="#carouselExampleCaptions" data-slide-to="0" class="active"></li>
                <li data-target="#carouselExampleCaptions" data-slide-to="1"></li>
                <li data-target="#carouselExampleCaptions" data-slide-to="2"></li>
                <li data-target="#carouselExampleCaptions" data-slide-to="3"></li>
                <li data-target="#carouselExampleCaptions" data-slide-to="4"></li>
            </ol>

            <div class="carousel-inner" role ="listbox">
                <%for (int i = 0; i < _carousel.Count; i++)
                    { %>

                <div class="carousel-item <%= i == 0 ? "active" : "" %>">
                    <a href ="DetailHebergement?id=<%= _carousel[i].IdHebergement.ToString() %>">
                        <img class ="d-block w-100" src="<%= _carousel[i].Photo %>" alt ="" />
                        <div class="carousel-caption carousel-bottom">
                            <h5><%= _carousel[i].Nom %></h5>
                            <p>20 €</p>
                        </div>
                        </a>
                    </div>
                <% } %>

                   <%-- <asp:LinkButton ID="Carousel1" runat="server" CommandArgument="1" OnClick="Carousel1_Click">
                        <asp:Image ID="Image1" ImageUrl="Images/appartement1.jfif" runat="server" class="d-block w-100 img-fluid" alt="..."/>
                    </asp:LinkButton>
                    <div class="carousel-caption d-none d-md-block">
                        <h5>Appartement 1</h5>
                        <p>Appartement de toute beauté.</p>
                    </div> --%>
                
            </div>
            <a class="carousel-control-prev" href="#carouselExampleFade" role="button" data-slide="prev">
                <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                <span class="sr-only">Previous</span>
            </a>
            <a class="carousel-control-next" href="#carouselExampleFade" role="button" data-slide="next">
                <span class="carousel-control-next-icon" aria-hidden="true"></span>
                <span class="sr-only">Next</span>
            </a>
        </div>
    </section>

<section class="search-sec">
    <div class="container">
        <div>
            <div class="row">
                <div class="col-lg-12">
                    <div class="row">
                         <!-- Code Postal -->
                        <div class="col-lg-3 col-md-3 col-sm-12 p-0">
                            <asp:DropDownList ID="ddlDepartement" class="form-control search-slt" runat="server">
                                <asp:ListItem Selected="True" Value="" Text ="Séléctionner"></asp:ListItem>
                                <asp:ListItem Value ="75000">75000, PARIS</asp:ListItem>
                                <asp:ListItem Value ="33100">33100, BORDEAUX</asp:ListItem>
                                <asp:ListItem Value ="69005">69005, LYON</asp:ListItem>
                                <asp:ListItem Value ="06000">06000, NICE</asp:ListItem>
                            </asp:DropDownList>
                       </div>

                       <!-- Type d'Hébergement -->
                       <div class="col-lg-3 col-md-3 col-sm-12 p-0">
                            <asp:DropDownList ID="ddlTypeHebergement" class="form-control search-slt" runat="server">
                                    <asp:ListItem Selected="True" Value="" Text="Séléctionner"></asp:ListItem>
                                    <asp:ListItem Value ="Maison">Maison</asp:ListItem>
                                    <asp:ListItem Value ="Appartement">Appartement</asp:ListItem>
                                    <asp:ListItem Value ="Mas">Mas</asp:ListItem>
                                    <asp:ListItem Value ="Villa">Villa</asp:ListItem>
                                </asp:DropDownList>
                       </div>

                        <div class="col-lg-3 col-md-3 col-sm-12 p-0">
                            <asp:Button ID="Button1" runat="server" Text="Valider" class="btn btn-success btn-block wrn-btn" OnClick="Button1_Click" />
                        </div>

                        </div>
                    </div>
              </div>
        </div>
    </div>
</section>

    <%--<div id="formulaire">
        <div class="form-group d-flex justify-content-center">
            <asp:DropDownList ID="DropDownList1" runat="server">
                <asp:ListItem Selected="True">Code Postal</asp:ListItem>
                <asp:ListItem>75000, PARIS</asp:ListItem>
                <asp:ListItem>33100, BORDEAUX</asp:ListItem>
                <asp:ListItem>69005, LYON</asp:ListItem>
                <asp:ListItem>06000, NICE</asp:ListItem>
            </asp:DropDownList>
        </div>

        
        <div class="form-group d-flex justify-content-center">
            <asp:DropDownList ID="DropDownList2" runat="server">
                <asp:ListItem Selected="True">Type d&#39;H&#233;bergement</asp:ListItem>
                <asp:ListItem>Maison</asp:ListItem>
                <asp:ListItem>Appartement</asp:ListItem>
                <asp:ListItem>Mas</asp:ListItem>
                <asp:ListItem>Villa</asp:ListItem>
            </asp:DropDownList>
        </div>
        <div class="d-flex justify-content-center">
            <asp:Button ID="ButtonValider" runat="server" Text="Valider" class="btn btn-success btn-block" Onclick="ButtonValider_Click"/>
        </div>
    </div>--%>

</asp:Content>
