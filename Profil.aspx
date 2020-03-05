<%@ Page Title="" Language="C#" MasterPageFile="~/ClientConnected.Master" AutoEventWireup="true" CodeBehind="Profil.aspx.cs" Inherits="NewHome.Profil" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ConnectedContent" runat="server">
    
    <div class="container">
	<div class="row">
		<div class="col-md-3 ">
		     <div class="list-group ">
              <a href="#" class="list-group-item list-group-item-action active">Mon Profil</a>
              <a href="#" class="list-group-item list-group-item-action">Voir mes Hébergements</a>
              <a href="#" class="list-group-item list-group-item-action">Historique</a>
              
            </div> 
		</div>
		<div class="col-md-9">
		    <div class="card">
		        <div class="card-body">
		            <div class="row">
		                <div class="col-md-12">
		                    <h4>Mon Profil</h4>
		                    <hr>
		                </div>
		            </div>
		            <div class="row">
		                <div class="col-md-12">
                              <div class="form-group row">
                                <label for="firstname" class="col-4 col-form-label">Nom</label> 
                                <div class="col-8">
                                    <asp:TextBox ID="txtNom" class="form-control here" runat="server"></asp:TextBox>
                                </div>
                              </div>
                              <div class="form-group row">
                                <label for="lastname" class="col-4 col-form-label">Prénom</label> 
                                <div class="col-8">
                                 <asp:TextBox ID="txtPrenom" class="form-control here" runat="server"></asp:TextBox>
                                </div>
                              </div>
                              <div class="form-group row">
                                <label for="email" class="col-4 col-form-label">Email</label> 
                                <div class="col-8">
                                  <asp:TextBox ID="txtEmail" class="form-control here" runat="server"></asp:TextBox>
                                </div>
                              </div>
                              <div class="form-group row">
                                <label for="text" class="col-4 col-form-label">Téléphone</label> 
                                <div class="col-8">
                                  <asp:TextBox ID="txtTelephone" class="form-control here" runat="server"></asp:TextBox>
                                </div>
                              </div>
                              <div class="form-group row">
                                <label for="username" class="col-4 col-form-label">Login</label> 
                                <div class="col-8">
                                  <asp:TextBox ID="txtLogin" class="form-control here" runat="server"></asp:TextBox>
                                </div>
                              </div>
                              <div class="form-group row">
                                <label for="text" class="col-4 col-form-label">Password</label> 
                                <div class="col-8">
                                  <asp:TextBox ID="txtPassword" class="form-control here" runat="server"></asp:TextBox>
                                </div>
                              </div>
                              <div class="form-group row">
                                <div class="offset-4 col-8">
                                    <asp:Button ID="UpdateProfil" class="btn btn-primary" runat="server" Text="Modifier Mon Profil" OnClick="UpdateProfil_Click"/>
                                </div>
                              </div>
		                </div>
		            </div>
		            
		        </div>
		    </div>
		</div>
	</div>
</div>
                                      
</asp:Content>
