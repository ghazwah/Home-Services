<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="forgotPassPage.aspx.cs" Inherits="HomeService.forgotPassPage" culture="auto" meta:resourcekey="PageResource1" uiculture="auto" %>
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
                           <h4><asp:Localize ID="Localize1" text="Forgot Password" runat="server" meta:resourcekey="Localize1Resource1"></asp:Localize></h4>
                        </center>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col">
                                <asp:Label ID="lblOutput" runat="server" Text=""></asp:Label>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col">
                                <hr>
                            </div>
                        </div>
                        <div class="row">
                            <center>
    <!-- Icon -->
      <img src="assets/img/generaluser.png" style="height:150px; width:150px;" alt="User Icon" />
    </center>
                        </div>
                        <!-- Forgot Password Form -->
                        <br />
                        <h6><asp:Localize ID="Localize2" text="*Enter the email address associated with your account and we will send you instructions for resetting your password." runat="server" meta:resourcekey="Localize2Resource1"></asp:Localize></h6>
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
                                <asp:Button ID="btnResetPassword" class="btn btn-md btn-block btn-success" runat="server" Text="Reset password" OnClick="btnSendEmail_Click" meta:resourcekey="btnResetPasswordResource1"/>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
     <br />
    <br />
</asp:Content>

