<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="loginPage.aspx.cs" Inherits="HomeService.loginPage" culture="auto" meta:resourcekey="PageResource1" uiculture="auto" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <!------ Include the above in your HEAD tag ---------->
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <!-- Tabs Titles -->
    <div class="container">
        <div class="row">
            <div class="col-md-6 mx-auto">
                <div class="card">
                    <div class="card-body">
                        <div class="row">
                            <div class="col">
                                <center>
                           <h4> <asp:Localize ID="Localize1" meta:resourceKey="Localize1Resource1" text="Log In" runat="server"></asp:Localize></h4>
                        </center>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col">
                                <hr>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col">
                                <center>
    <!-- Icon -->
      <img src="assets/img/generaluser.png" style="height:150px; width:150px;" alt="User Icon" />
    </center>
                            </div>
                        </div>
                        <!-- Login Form -->
                        <br />
                        <div class="row">
                            <div class="col-md-8" style="margin-left: 17%">
                                <asp:Label ID="lblEmail" runat="server" Text="Email:" meta:resourcekey="emailResource1"></asp:Label>
                                <asp:TextBox ID="txtEmail" CssClass="form-control" runat="server" placeholder="Email" TextMode="Email"></asp:TextBox>
                            </div>
                        </div>
                        <br />
                        <div class="row">
                            <div class="col-md-8" style="margin-left: 17%">
                                <asp:Label ID="lblPassword" runat="server" Text="Password:" meta:resourcekey="passwordResource1"></asp:Label>
                                <asp:TextBox ID="txtPassword" CssClass="form-control" runat="server" placeholder="Password" TextMode="Password"></asp:TextBox>
                            </div>
                        </div>
                        <br />
                        <div class="row">
                            <div class="col-md-5">
                                <asp:LinkButton ID="lbtnForgotPass" runat="server" OnClick="lbtnForgotPass_Click" meta:resourcekey="lbtnForgotPassResource1">Forgot Password?</asp:LinkButton>
                            </div>
                        </div>
                        <br />
                        <div class="row">
                            <div class="col">
                                <asp:Button ID="btnLogIn" class="btn btn-md btn-block btn-success" runat="server" Text="Log In" OnClick="btnLogIn_Click" meta:resourcekey="btnLogInResource1" />
                            </div>
                            <div class="col">
                                <asp:Button ID="btnSignUp" class="btn btn-md btn-block btn-success" runat="server" Text="Sign Up" OnClick="btnSignUp_Click" meta:resourcekey="btnSignUpResource1" />
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <br />
        </div>
    </div>
    <br />
    <br />
</asp:Content>
