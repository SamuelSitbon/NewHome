    <%@ Page Title="Connexion" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Connexion.aspx.cs" Inherits="NewHome.Connexion" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <link href="/Content/Connexion.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<!------ Include the above in your HEAD tag ---------->

<div class="wrapper fadeInDown">
  <div id="formContent">
    <!-- Tabs Titles -->

    <!-- Icon -->
    <div class="fadeIn first">
      <img src="/Images/logo.jpg" id="icon" alt="User Icon" />
    </div>
      <div>
        <asp:Label ID="connexionError" runat="server"></asp:Label>
      </div>

    <!-- Login Form -->
    <div>
      <asp:TextBox ID="login" class="fadeIn second" name="login" placeholder="Login" runat="server"></asp:TextBox>
      <asp:TextBox ID="password" class="fadeIn third" name="password" placeholder="Password" runat="server"></asp:TextBox>
      <asp:Button ID="ConnexionButton" class="fadeIn fourth" runat="server" Text="Se Connecter" OnClick="ConnexionButton_Click"/>
    </div>

    <!-- Remind Passowrd -->
    <div id="formFooter">
      <a class="underlineHover" href="CreerCompte.aspx">Créer votre compte</a>
    </div>

  </div>
</div>
</asp:Content>
