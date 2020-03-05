<%@ Page Title="Favoris" Language="C#" MasterPageFile="~/ClientConnected.Master" AutoEventWireup="true" CodeBehind="Favoris.aspx.cs" Inherits="NewHome.Favoris" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ConnectedContent" runat="server">
     <link href="/Content/Favoris.css" rel="stylesheet" id="bootstrap-css">
    <asp:Label id ="noFav" runat ="server"></asp:Label>

    <asp:GridView ID="gdvHebergement" CssClass ="table table-dark table-hover table-bordered table-sm" runat="server" GridLines="None" AutoGenerateColumns="False" DataKeyNames="IdHebergement">
    <Columns>
        <%--<asp:imagefield dataimageurlfield="Photo" alternatetext="Book Photo" nulldisplaytext="No image on file." headertext="Photo"  readonly="true"/>--%>
        <asp:TemplateField HeaderText ="Image" SortExpression="FirstName">
            <ItemTemplate>
                <img class ="imageFav" src ='<%#Eval("Photo") %>' />
            </ItemTemplate>
        </asp:TemplateField>
        <asp:BoundField DataField="Nom" HeaderText="Nom" SortExpression="Nom"/>
        <asp:BoundField DataField="Description" HeaderText="Description" SortExpression="Description"/>
        <asp:BoundField DataField="PrixDeBase" HeaderText="Prix (en €/nuit)" SortExpression="Prix"/>
        
        <asp:TemplateField>
            <ItemTemplate>
                <div>
                    <asp:Button ID="bSuppr" class="btn btn-danger" runat="server" Text="Supprimer" OnClick="bSuppr_Click" CommandArgument='<%#Eval("IdHebergement")%>'/>
                </div>
            </ItemTemplate>
        </asp:TemplateField>
    </Columns>
</asp:GridView>
</asp:Content>
