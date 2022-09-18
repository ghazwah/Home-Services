<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="customerProfile.aspx.cs" Inherits="HomeService.customerProfile" culture="auto" meta:resourcekey="PageResource1" uiculture="auto" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
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
                           <h4><asp:Localize ID="Localize1" text="Profile" runat="server" meta:resourcekey="Localize1Resource1"></asp:Localize></h4>
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
                        <!-- User Profile Form -->
                        <br />
                        <div class="row">
                            <div class="col">
                                <asp:Label ID="lblCustomerId" runat="server" Text="Customer Id:" meta:resourcekey="lblCustomerIdResource1"></asp:Label>
                                <asp:TextBox class="form-control" ID="txtCustomerId" runat="server" placeholder="ID Number" ReadOnly="True"></asp:TextBox>
                            </div>
                        </div>
                        <br />
                        <div class="form-group">
                            <div class="row">
                                <div class="col">
                                    <asp:Label ID="lblFName" runat="server" Text="First Name:" meta:resourcekey="lblFNameResource1"></asp:Label>
                                    <asp:TextBox ID="txtFName" CssClass="form-control" runat="server" placeholder="First Name"></asp:TextBox>
                                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txtFName" ErrorMessage="The name is invalid"
                                        ForeColor="Red" ValidationExpression="^[A-Za-z]*$" meta:resourcekey="RegularExpressionValidator1Resource1"></asp:RegularExpressionValidator>
                                </div>
                                <div class="col">
                                    <asp:Label ID="lblLName" runat="server" Text="Last Name:" meta:resourcekey="lblLNameResource1"></asp:Label>
                                    <asp:TextBox ID="txtLName" CssClass="form-control" runat="server" placeholder="Last Name"></asp:TextBox>
                                    <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="txtLName" ErrorMessage="The name is invalid"
                                        ForeColor="Red" ValidationExpression="^[A-Za-z]*$" meta:resourcekey="RegularExpressionValidator2Resource1"></asp:RegularExpressionValidator>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col">
                                    <asp:Label ID="lblEmail" runat="server" Text="Email:" meta:resourcekey="lblEmailResource1"></asp:Label>
                                    <asp:TextBox ID="txtEmail" CssClass="form-control" runat="server" placeholder="Email" TextMode="Email"></asp:TextBox>
                                </div>
                                <div class="col">
                                    <asp:Label ID="lblPhone" runat="server" Text="Phone Number:" meta:resourcekey="lblPhoneResource1"></asp:Label>
                                    <asp:TextBox ID="txtPhone" CssClass="form-control" runat="server" placeholder="Phone Number"></asp:TextBox>
                                    <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ControlToValidate="txtPhone" ErrorMessage="The phone number is invalid"
                                        ForeColor="Red" ValidationExpression="\d+" meta:resourcekey="RegularExpressionValidator3Resource1"></asp:RegularExpressionValidator>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col">
                                <asp:Label ID="lblOldPassword" runat="server" Text="Old Password:" meta:resourcekey="lblOldPasswordResource1"></asp:Label>
                                <asp:TextBox ID="txtOldPassword" CssClass="form-control" runat="server" placeholder="Old Password" ReadOnly="True"></asp:TextBox>
                            </div>
                            <div class="col">
                                <asp:Label ID="lblNewPassword" runat="server" Text="New Password:" meta:resourcekey="lblNewPasswordResource1"></asp:Label>
                                <asp:TextBox ID="txtNewPassword" CssClass="form-control" runat="server" placeholder="New Password" TextMode="Password"></asp:TextBox>
                            </div>
                        </div>
                        <br />
                         <div class="row">
                             <div class="col">
                                 <asp:ScriptManager ID="ScriptManager1" runat="server">
                                 </asp:ScriptManager>
                                <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                                    <ContentTemplate>
                                        <asp:Label ID="lblAjax" runat="server"></asp:Label>
                                        <br />
                                        <asp:Button ID="btnUpdatePassword" class="btn btn-md btn-block btn-success" runat="server" Text="Update Password" OnClick="btnUpdatePassword_Click" meta:resourcekey="btnUpdatePasswordResource1"/>
                                    </ContentTemplate>
                                    <Triggers>
                                        <asp:AsyncPostBackTrigger ControlID="btnUpdatePassword" EventName="Click" />
                                    </Triggers>
                                </asp:UpdatePanel>
                                </div>
                                </div>
                        <br />
                        <div class="row">
                            <div class="col">
                                <asp:Button ID="btnUpdate" class="btn btn-md btn-block btn-success" runat="server" Text="Update" OnClick="btnUpdate_Click" meta:resourcekey="btnUpdateResource1"/>
                            </div>
                            </div>
                        <br />
                        <div class="row">
                            <div class="col-md-8" style="margin-left: 17%">
                                <asp:Button ID="btnDelete" class="btn btn-md btn-block btn-danger" runat="server" Text="Delete" OnClick="btnDelete_Click" meta:resourcekey="btnDeleteResource1" />
                            </div>
                        </div>
                        <div class="row">
                            <div class="col">
                                <asp:CheckBox ID="ChBoxDelete" runat="server" AutoPostBack="True" Text="Delete this Account?" meta:resourcekey="ChBoxDeleteResource1" />
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

