<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="signupPage.aspx.cs" Inherits="HomeService.signupPage" culture="auto" meta:resourcekey="PageResource1" uiculture="auto" %>
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
    <!-- SignUp Form -->
    <div class="container">
        <div class="row">
            <div class="col-md-6 mx-auto">
                <div class="card">
                    <div class="card-body">
                        <div class="row">
                            <div class="col">
                                <center>
                           <h4><asp:Localize ID="Localize1" meta:resourceKey="Localize1Resource1" text="Sign Up" runat="server"></asp:Localize></h4>
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
                        <!-- Sign Up Form -->
                        <br />
                        <div class="form-group">
                            <div class="row">
                                <div class="col">
                                    <asp:Label ID="lblFName" runat="server" Text="First Name:" meta:resourcekey="fNameResource1"></asp:Label>
                                    <asp:TextBox ID="txtFName" CssClass="form-control" runat="server" placeholder="First Name"></asp:TextBox>
                                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txtFName" ErrorMessage="The name is invalid"
                                        ForeColor="Red" ValidationExpression="^[A-Za-z]*$" meta:resourcekey="RegularExpressionValidator1Resource1"></asp:RegularExpressionValidator>
                                </div>
                                <div class="col">
                                           <asp:Label ID="lblLName" runat="server" Text="Last Name:" meta:resourcekey="lNameResource1"></asp:Label>
                                    <asp:TextBox ID="txtLName" CssClass="form-control" runat="server" placeholder="Last Name"></asp:TextBox>
                                    <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="txtLName" ErrorMessage="The name is invalid"
                                        ForeColor="Red" ValidationExpression="^[A-Za-z]*$" meta:resourcekey="RegularExpressionValidator2Resource1"></asp:RegularExpressionValidator>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col">
                                     <asp:Label ID="lblEmail" runat="server" Text="Email:" meta:resourcekey="emailResource1"></asp:Label>
                                    <asp:TextBox ID="txtEmail" CssClass="form-control" runat="server" placeholder="Email" TextMode="Email"></asp:TextBox>
                                </div>
                                <div class="col">
                                    <asp:Label ID="lblPhone" runat="server" Text="Phone Number:" meta:resourcekey="PhoneResource1"></asp:Label>
                                    <asp:TextBox ID="txtPhone" CssClass="form-control" runat="server" placeholder="Phone Number"></asp:TextBox>
                                    <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ControlToValidate="txtPhone" ErrorMessage="The phone number is invalid"
                                        ForeColor="Red" ValidationExpression="\d+" meta:resourcekey="RegularExpressionValidator3Resource1"></asp:RegularExpressionValidator>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col">
                                <asp:Label ID="lblPassword" runat="server" Text="Password:" meta:resourcekey="passwordResource1"></asp:Label>
                                <asp:TextBox ID="txtPassword" CssClass="form-control" runat="server" placeholder="Password" TextMode="Password"></asp:TextBox>
                            </div>
                            <div class="col">
                                <asp:Label ID="lblConfirmPassword" runat="server" Text="Confirm Password:" meta:resourcekey="confirmPasswordResource1"></asp:Label>
                                <asp:TextBox ID="txtConfirmPassword" CssClass="form-control" runat="server" placeholder="Confirm Password" TextMode="Password"></asp:TextBox>
                            </div>
                        </div>
                        <br />
                        <div class="row">
                            <div class="col-md-8" style="margin-left: 17%">
                                <asp:Button ID="btnSignUp" class="btn btn-md btn-block btn-success" runat="server" Text="Sign Up" OnClick="btnSignUp_Click" meta:resourcekey="btnSignUpResource1" />
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

