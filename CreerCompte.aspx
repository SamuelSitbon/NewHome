<%@ Page Title="CreerCompte" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="CreerCompte.aspx.cs" Inherits="NewHome.CreerCompte" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
    <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <!------ Include the above in your HEAD tag ---------->



    <div id="formulaire" class="card bg-light">
        <article class="card-body mx-auto" style="max-width: 400px;">
            <h4 class="card-title mt-3 text-center">Créer votre compte</h4>
            <div>
                <div class="form-group input-group">
                    <div class="input-group-prepend">
                        <span class="input-group-text" style="width:45px;"><i class="fas fa-user-check"></i></span>
                    </div>
                    <select ID ="sltType" class="custom-select" name="Type">
                        <option selected="" value="membre">Membre</option>
                        <option value="proprietaire">Propriétaire</option>
                    </select>
                </div>
                <!-- form-group// -->
                <div class="form-group input-group">
                    <div class="input-group-prepend">
                        <span class="input-group-text" style="width:45px;"><i class="fa fa-user"></i></span>
                    </div>
                    <asp:TextBox ID="txtNom" class="form-control" placeholder="Nom" runat="server"></asp:TextBox>
                </div>
                <!-- form-group// -->

                <div class="form-group input-group">
                    <div class="input-group-prepend">
                        <span class="input-group-text" style="width:45px;"><i class="fa fa-user"></i></span>
                    </div>
                    <asp:TextBox ID="txtPre" class="form-control" placeholder="Prénom" runat="server"></asp:TextBox>
                </div>
                <!-- form-group// -->

                <div class="form-group input-group">
                    <div class="input-group-prepend">
                        <span class="input-group-text" style="width:45px;"><i class="fas fa-home"></i></span>
                    </div>
                    <asp:TextBox ID="txtVoie" Style="max-width: 70px;" class="form-control" placeholder="Voie" runat="server"></asp:TextBox>
                    <asp:TextBox ID="txtNumero" class="form-control" placeholder="Numero" runat="server"></asp:TextBox>
                </div>
                <!-- form-group// -->

                <div class="form-group input-group">
                    <div class="input-group-prepend">
                        <span class="input-group-text" style="width:45px;"><i class="fas fa-home"></i></span>
                    </div>
                    <asp:TextBox ID="txtVil" class="form-control" placeholder="Ville" runat="server"></asp:TextBox>
                </div>

                <div class="form-group input-group">
                    <div class="input-group-prepend">
                        <span class="input-group-text" style="width:45px;"><i class="fas fa-home"></i></span>
                    </div>
                    <asp:TextBox ID="txtCodeP" class="form-control" placeholder="Code Postal" runat="server"></asp:TextBox>
                </div>
                <!-- form-group// -->

                <div class="form-group input-group">
                    <div class="input-group-prepend">
                        <span class="input-group-text" style="width:45px;"><i class="fa fa-phone"></i></span>
                    </div>
                    <select class="custom-select" style="max-width: 120px;">
                        <option selected="">+33</option>
                        <option value="1">+36</option>
                        <option value="2">+39</option>
                        <option value="3">+42</option>
                    </select>
                    <asp:TextBox ID="txtTl" class="form-control" placeholder="Téléphone" runat="server"></asp:TextBox>
                </div>
                <!-- form-group// -->

                <div class="form-group input-group">
                    <div class="input-group-prepend">
                        <span class="input-group-text" style="width:45px;"><i class="fas fa-envelope-open-text"></i></span>
                    </div>
                    <asp:TextBox ID="txtEmail" class="form-control" placeholder="Email" runat="server"></asp:TextBox>
                </div>
                <!-- form-group// -->

                <div class="form-group input-group">
                    <div class="input-group-prepend">
                        <span class="input-group-text" style="width:45px;"><i class="fas fa-user-shield"></i></span>
                    </div>
                    <asp:TextBox ID="txtLog" class="form-control" placeholder="Login" runat="server"></asp:TextBox>
                </div>
                <!-- form-group// -->

                <div class="form-group input-group">
                    <div class="input-group-prepend">
                        <span class="input-group-text" style="width:45px;"><i class="fa fa-lock"></i></span>
                    </div>
                    <asp:TextBox ID="txtPwd" TextMode="Password" class="form-control" placeholder="Password" runat="server"></asp:TextBox>
                </div>
                <!-- form-group// -->



                <div class="form-group input-group">
                    <div class="input-group-prepend">
                        <span class="input-group-text" style="width:45px;"><i class="fa fa-lock"></i></span>
                    </div>
                    <asp:TextBox ID="txtPwd2" TextMode="Password" class="form-control" placeholder="Password" runat="server"></asp:TextBox>
                </div>


                <!-- form-group// -->

                <div class="form-group input-group">
                    <asp:Button ID="btnCreer" class="btn btn-primary btn-block" style="max-width: 400px;" runat="server" Text="Créer votre compte" OnClick="CreerButton_Click" />
                </div>
                <!-- form-group// -->
                <p class="text-center">Dèjà un compte ? <a href="/Connexion">Se connecter</a> </p>
            </div>
        </article>
        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
            <Triggers>
                <asp:AsyncPostBackTrigger ControlID="btnCreer" EventName="Click" />
            </Triggers>
            <ContentTemplate>
                <div>
                    <asp:Label ID="lblResultat" runat="server" Text=""></asp:Label>
                </div>
            </ContentTemplate>
        </asp:UpdatePanel>

        <%--Ensemble de vérification des erreurs--%>
        <asp:RequiredFieldValidator ID="txtNom_valid" runat="server" ControlToValidate="txtNom" Display="Dynamic" CssClass="text-danger" ErrorMessage="Un Nom est nécessaire" SetFocusOnError="True"></asp:RequiredFieldValidator>
        <asp:RequiredFieldValidator ID="txtPre_valid" runat="server" ControlToValidate="txtPre" Display="Dynamic" CssClass="text-danger" ErrorMessage="Un Prénom est nécessaire" SetFocusOnError="True"></asp:RequiredFieldValidator>
        <asp:RequiredFieldValidator ID="txtNumero_valid" runat="server" ControlToValidate="txtNumero" Display="Dynamic" CssClass="text-danger" ErrorMessage="Un Numéro de voie est nécessaire" SetFocusOnError="True"></asp:RequiredFieldValidator>
        <asp:RequiredFieldValidator ID="txtVoie_valid" runat="server" ControlToValidate="txtVoie" Display="Dynamic" CssClass="text-danger" ErrorMessage="Une Voie est nécessaire" SetFocusOnError="True"></asp:RequiredFieldValidator>
        <asp:RequiredFieldValidator ID="txtVil_valid" runat="server" ControlToValidate="txtVil" Display="Dynamic" CssClass="text-danger" ErrorMessage="Une Ville est nécessaire" SetFocusOnError="True"></asp:RequiredFieldValidator>
        <asp:RequiredFieldValidator ID="txtCodeP_valid" runat="server" ControlToValidate="txtCodeP" Display="Dynamic" CssClass="text-danger" ErrorMessage="Un Code Postal est nécessaire" SetFocusOnError="True"></asp:RequiredFieldValidator>
        <asp:RequiredFieldValidator ID="txtTl_valid" runat="server" ControlToValidate="txtTl" Display="Dynamic" CssClass="text-danger" ErrorMessage="Un Téléphone est nécessaire" SetFocusOnError="True"></asp:RequiredFieldValidator>
        <asp:RequiredFieldValidator ID="txtEmail_valid" runat="server" ControlToValidate="txtEmail" Display="Dynamic" CssClass="text-danger" ErrorMessage="Un Email est nécessaire" SetFocusOnError="True"></asp:RequiredFieldValidator>
        <asp:RegularExpressionValidator ID="txtEmail_regularexpression_valid" runat="server" Display="Dynamic" CssClass="text-danger" ErrorMessage="Veuillez indiquer un Email valide" ControlToValidate="txtEmail" SetFocusOnError="True" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
        <asp:RequiredFieldValidator ID="txtLog_valid" runat="server" ControlToValidate="txtLog" Display="Dynamic" CssClass="text-danger" ErrorMessage="Un Login est nécessaire"></asp:RequiredFieldValidator>
        <asp:RequiredFieldValidator ID="txtPwd_valid" runat="server" ControlToValidate="txtPwd" Display="Dynamic" CssClass="text-danger" ErrorMessage="Un Password est nécessaire"></asp:RequiredFieldValidator>
        <asp:RequiredFieldValidator ID="txtPwd2_valid" runat="server" ControlToValidate="txtPwd2" Display="Dynamic" CssClass="text-danger" ErrorMessage="Un Password est nécessaire dans les deux emplacements dédiées"></asp:RequiredFieldValidator>
        <asp:CompareValidator ID="txtPassword2_compare" runat="server" ControlToCompare="txtPwd" ControlToValidate="txtPwd2" Display="Dynamic" CssClass="text-danger" ErrorMessage="Veuillez saisir le meme Password"></asp:CompareValidator>
        <asp:CompareValidator ID="CompareValidator3" runat="server" ControlToValidate="txtTl" Display="Dynamic" CssClass="text-danger" ValueToCompare="0" Type="Integer" Operator="GreaterThanEqual" ErrorMessage="Veuillez indiquer un Numéro de Téléphone valide"></asp:CompareValidator>
        <%--<asp:ValidationSummary ID="ValidationSummary1" DisplayMode="BulletList" ShowSummary="true" runat="server" CssClass="badge badge-danger" />--%>
    </div>
    <!-- card.// -->
    <!--container end.//-->
</asp:Content>
