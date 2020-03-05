<%@ Page Title="Paiement" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Paiement.aspx.cs" Inherits="NewHome.Paiement" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <script src="https://kit.fontawesome.com/061b36ae1c.js"></script>
    <link href="/Content/Image.css" rel="stylesheet" id="bootstrap-css">
    <div class="d-flex w border bg-light p-2 mb-1">
        <div class="border">
            <img id="thumbnail" style="width: 600px" class="thumbnail" data-toggle="modal" data-target="#imagemodalzoom" src="<%= paiement.Photo %>">
        </div>
        <div class="container">

            <h4 class="d-flex justify-content-between align-items-center mb-3">
                <span class="text-muted">Votre Réservation</span>
            </h4>
            <ul class="list-group mb-3">
                <li class="list-group-item d-flex justify-content-between lh-condensed">
                    <div>
                        <h6 class="my-0">Nom</h6>
                        <small class="text-muted"><%= paiement.Nom %></small>
                    </div>
                </li>
                <li class="list-group-item d-flex justify-content-between lh-condensed">
                    <div>
                        <h6 class="my-0">Type</h6>
                        <small class="text-muted"><%= paiement.Type %></small>
                    </div>
                </li>
                <li class="list-group-item d-flex justify-content-between lh-condensed">
                    <div>
                        <h6 class="my-0">Adresse</h6>
                        <small class="text-muted"><%= paiement.Adresse.Numero + " " + paiement.Adresse.Voie %> (<%= paiement.Adresse.Ville %>, <%= paiement.Adresse.CodePostal %>)</small>
                    </div>
                </li>
                <li class="list-group-item d-flex justify-content-between bg-light">
                    <div class="text-success">
                        <small>Prix par nuit (€)</small>
                    </div>
                    <span class="text-success"><%= paiement.PrixDeBase %></span>
                </li>
                <li class="list-group-item d-flex justify-content-between">
                    <span>Total</span>
                    <strong>Truc à mettre ici</strong>
                </li>
            </ul>
        </div>
    </div>

    <aside class="col-sm-12">
        <article class="card">
            <div class="card-body p-5">

                <ul class="nav bg-light nav-pills rounded nav-fill mb-3" role="tablist">
                    <li class="nav-item">
                        <a class="nav-link active" data-toggle="pill" href="#nav-tab-card">
                            <i class="fa fa-credit-card"></i>Carte de Crédit</a></li>
                    <li class="nav-item">
                        <a class="nav-link" data-toggle="pill" href="#nav-tab-paypal">
                            <i class="fab fa-paypal"></i>Paypal</a></li>
                    <li class="nav-item">
                        <a class="nav-link" data-toggle="pill" href="#nav-tab-bank">
                            <i class="fa fa-university"></i>Virement</a></li>
                </ul>

                <div class="tab-content">
                    <div class="tab-pane fade show active" id="nav-tab-card">
                        <p class="alert alert-success">Some text success or error</p>
                        <div class="form-group">
                            <label for="username">Nom Complet (sur la carte)</label>
                            <input type="text" class="form-control" name="username" placeholder="" required="">
                        </div>
                        <!-- form-group.// -->

                        <div class="form-group">
                            <label for="cardNumber">Numéro de Carte</label>
                            <div class="input-group">
                                <input type="text" class="form-control" name="cardNumber" placeholder="">
                                <div class="input-group-append">
                                    <span class="input-group-text text-muted">
                                        <i class="fab fa-cc-visa"></i><i class="fab fa-cc-amex"></i>
                                        <i class="fab fa-cc-mastercard"></i>
                                    </span>
                                </div>
                            </div>
                        </div>
                        <!-- form-group.// -->

                        <div class="row">
                            <div class="col-sm-8">
                                <div class="form-group">
                                    <label><span class="hidden-xs">Expiration</span> </label>
                                    <div class="input-group">
                                        <input type="number" class="form-control" placeholder="Mois" name="">
                                        <input type="number" class="form-control" placeholder="Année" name="">
                                    </div>
                                </div>
                            </div>
                            <div class="col-sm-4">
                                <div class="form-group">
                                    <label data-toggle="tooltip" title="" data-original-title="3 digits code on back side of the card">CVV <i class="fa fa-question-circle"></i></label>
                                    <input type="number" class="form-control" required="">
                                </div>
                                <!-- form-group.// -->
                            </div>
                        </div>
                        <!-- row.// -->
                        <button class="subscribe btn btn-primary btn-block" type="button">Confirm  </button>
                    </div>
                    <!-- tab-pane.// -->
                    <div class="tab-pane fade" id="nav-tab-paypal">
                        <p>Paypal is easiest way to pay online</p>
                        <p>
                            <button type="button" class="btn btn-primary"><i class="fab fa-paypal"></i>Log in my Paypal </button>
                        </p>
                        <p>
                            <strong>Note:</strong> Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod
tempor incididunt ut labore et dolore magna aliqua.
                        </p>
                    </div>
                    <div class="tab-pane fade" id="nav-tab-bank">
                        <p>Bank accaunt details</p>
                        <dl class="param">
                            <dt>BANK: </dt>
                            <dd>THE WORLD BANK</dd>
                        </dl>
                        <dl class="param">
                            <dt>Accaunt number: </dt>
                            <dd>12345678912345</dd>
                        </dl>
                        <dl class="param">
                            <dt>IBAN: </dt>
                            <dd>123456789</dd>
                        </dl>
                        <p>
                            <strong>Note:</strong> Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod
tempor incididunt ut labore et dolore magna aliqua.
                        </p>
                    </div>
                    <!-- tab-pane.// -->
                </div>
                <!-- tab-content .// -->

            </div>
            <!-- card-body.// -->
        </article>
        <!-- card.// -->


    </aside>
    <!-- col.// -->
</asp:Content>
