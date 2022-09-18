<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="resetPassword.aspx.cs" Inherits="HomeService.resetPassword" culture="auto" meta:resourcekey="PageResource1" uiculture="auto" %>
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
                           <h4><asp:Localize ID="Localize1" text="Reset Password" runat="server" meta:resourcekey="Localize1Resource1"></asp:Localize></h4>
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
                            <div class="col">
                                <center>
    <!-- Icon -->
      <img src="assets/img/generaluser.png" style="height:150px; width:150px;" alt="User Icon" />
    </center>
                            </div>
                        </div>
                        <!-- Forgot Password Form -->
                        <br />
                        <div class="row">
                            <div class="col-md-8" style="margin-left: 17%">
                                       <asp:Label ID="lblNewPassword" runat="server" Text="New Password:" meta:resourcekey="newPasswordResource1"></asp:Label>
                                <asp:TextBox ID="txtNewPassword" CssClass="form-control" runat="server" placeholder="New Password" TextMode="Password"></asp:TextBox>
                            </div>
                        </div>
                        <br />
                        <div class="row">
                            <div class="col-md-8" style="margin-left: 17%">
                                <asp:Label ID="lblConfirmPassword" runat="server" Text="Confirm Password:" meta:resourcekey="confirmPasswordResource1"></asp:Label>
                                <asp:TextBox ID="txtConfirmPassword" CssClass="form-control" runat="server" placeholder="Confirm Password" TextMode="Password"></asp:TextBox>
                            </div>
                        </div>
                        <br />
                        <div class="row">
                            <div class="col-md-8" style="margin-left: 17%">
                                <asp:Button ID="btnSubmit" class="btn btn-md btn-block btn-success" runat="server" Text="Submit" OnClick="btnSubmit_Click" meta:resourcekey="btnSubmitResource1" />
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
