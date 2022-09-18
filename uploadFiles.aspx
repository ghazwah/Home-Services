<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="uploadFiles.aspx.cs" Inherits="HomeService.uploadFiles" culture="auto" meta:resourcekey="PageResource1" uiculture="auto" %>
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
            <div class="col-md-9 mx-auto">
                <div class="card">
                    <div class="card-body">
                        <div class="row">
                            <div class="col">
                                <center>
                           <h4><asp:Localize ID="Localize1" text="Services Files" runat="server" meta:resourcekey="Localize1Resource1"></asp:Localize></h4>
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
      <img  src="assets/img/Services_Files.png" style="height:200px; width:200px;" alt="File Icon" />
    </center>
                            </div>
                        </div>
                        <!-- Upload Files Form -->
                        <br />
                        <div class="row">
                            <div class="col-md-5">
                                <asp:Label ID="lblServiceId" runat="server" Text="ID: " meta:resourcekey="lblServiceIdResource1"></asp:Label>
                                <asp:TextBox ID="txtServiceId" runat="server" Class="form-control" TextMode="Number"></asp:TextBox>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col">
                                <asp:Label ID="lblServicesId" runat="server" Text="Services: " meta:resourcekey="lblServicesIdResource1"></asp:Label>
                                <asp:DropDownList ID="ddlServices" runat="server" Style="width: 200px; height: 40px;" class="btn btn-light dropdown-toggle dropdown-toggle-split" AppendDataBoundItems="True">
                                     <asp:ListItem Value="0" Text="Select one "></asp:ListItem>
                                    </asp:DropDownList>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col">
                                <asp:Label ID="lblUploadFiles" runat="server" Text="Upload Files: " meta:resourcekey="lblUploadFilesResource1"></asp:Label>

                                <asp:FileUpload ID="FileUpload" runat="server" AllowMultiple="True"
                                    ToolTip="Please upload the files!" meta:resourcekey="FileUploadResource1" />
                            </div>
                        </div>
                        <hr>
                        <div class="row">
                            <div class="col">
                                <asp:Button ID="btnSubmitMultiFiles" class="btn btn-md btn-block btn-success" runat="server" Text="Upload Files To Folder" OnClick="btnSubmitMultiFiles_Click" meta:resourcekey="btnSubmitMultiFilesResource1" />
                            </div>
                            <div class="col">
                                <asp:Button ID="btnSubmitMultiFilesToDb" class="btn btn-md btn-block btn-success" runat="server" Text="Upload Files To DB" OnClick="btnSubmitMultiFilesToDb_Click" meta:resourcekey="btnSubmitMultiFilesToDbResource1" />
                            </div>
                            <div class="col">
                                <asp:Button ID="BtnAddToDrive" class="btn btn-md btn-block btn-success" runat="server" Text="Upload Files To Drive" OnClick="BtnAddToDrive_Click" meta:resourcekey="BtnAddToDriveResource1" />
                            </div>
                        </div>
                        <hr>
                        <div class="row">
                            <div class="col">
                                <asp:Button ID="btnShowFiles" class="btn btn-md btn-block btn-success" runat="server" Text="Show Files" OnClick="btnShowFiles_Click" meta:resourcekey="btnShowFilesResource1" />
                            </div>
                            <div class="col">
                                <asp:Button ID="ShowServiceFiles" class="btn btn-md btn-block btn-success" runat="server" Text="Show Service Files" OnClick="ShowServicefiles_Click" meta:resourcekey="ShowServiceFilesResource1" />
                            </div>
                            <div class="col">
                                <asp:Button ID="btnShowFilesInDb" class="btn btn-md btn-block btn-success" runat="server" Text="Show Files In DB" OnClick="btnShowFilesInDb_Click" meta:resourcekey="btnShowFilesInDbResource1" />
                            </div>
                        </div>
                        <hr>
                        <div class="row">
                            <div class="col">
                                <asp:GridView
                                    ID="gvServiceFiles"
                                    SkinID="UploadsView"
                                    runat="server"
                                    AutoGenerateColumns="False" Width="100%" CellPadding="4" GridLines="Horizontal" BackColor="White" BorderColor="#336666" BorderStyle="Double" BorderWidth="3px">
                                    <Columns>
                                        <asp:TemplateField HeaderText="Files" meta:resourcekey="TemplateFieldResource1">
                                            <ItemStyle Width="100%" />
                                            <ItemTemplate>
                                                <asp:HyperLink
                                                    ID="FileLink"
                                                    NavigateUrl='<%# "~/Uploads/" + Container.DataItem.ToString() %>'
                                                    Text='<%# Container.DataItem.ToString() %>'
                                                    runat="server"/>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                    </Columns>
                                    <FooterStyle BackColor="White" ForeColor="#333333" />
                                    <HeaderStyle BackColor="#336666" Font-Bold="True" ForeColor="White" />
                                    <PagerStyle BackColor="#336666" ForeColor="White" HorizontalAlign="Center" />
                                    <RowStyle BackColor="White" ForeColor="#333333" />
                                    <SelectedRowStyle BackColor="#339966" Font-Bold="True" ForeColor="White" />
                                    <SortedAscendingCellStyle BackColor="#F7F7F7" />
                                    <SortedAscendingHeaderStyle BackColor="#487575" />
                                    <SortedDescendingCellStyle BackColor="#E5E5E5" />
                                    <SortedDescendingHeaderStyle BackColor="#275353" />
                                </asp:GridView>
                            </div>
                        </div>
                        <hr>
                        <div class="row">
                            <div class="col">
                                <asp:CheckBox ID="cbSelectAll" runat="server" Text="Select All" AutoPostBack="True" OnCheckedChanged="cbSelectAll_CheckedChanged" meta:resourcekey="cbSelectAllResource1" />
                                <asp:Button ID="btnDeleteAll" runat="server" class="btn btn-outline-danger" Text="Delete All"
                                    OnClick="btnDeleteAll_Click"
                                    OnClientClick="return confirm('Are you sure? want to delete All Selected files!');" meta:resourcekey="btnDeleteAllResource1" />
                                <br />
                                <br />
                                <asp:GridView ID="gvDocs" runat="server" AutoGenerateColumns="False" CssClass="gv" DataKeyNames="documentId"
                                    EmptyDataText="No files were found!"
                                    ShowHeaderWhenEmpty="True"
                                    PageSize="3" HorizontalAlign="Center" BackColor="White" BorderColor="#336666" BorderStyle="Double" BorderWidth="3px" CellPadding="4" GridLines="Horizontal" meta:resourcekey="gvDocsResource1">
                                    <Columns>
                                        <asp:TemplateField HeaderText="Document Id " meta:resourcekey="TemplateFieldResource2">
                                            <ItemTemplate>
                                                <asp:CheckBox ID="chkSelect" runat="server" Text='<%# Bind("documentId") %>'/>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Services Id" meta:resourcekey="TemplateFieldResource3">
                                            <ItemTemplate>
                                                <asp:Label ID="lblServicesId" runat="server" Text='<%# Bind("servicesId") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Service Id" meta:resourcekey="TemplateFieldResource4">
                                            <ItemTemplate>
                                                <asp:Label ID="lblserviceId" runat="server" Text='<%# Bind("serviceId") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField ItemStyle-HorizontalAlign="Center" HeaderText="Document Name" meta:resourcekey="TemplateFieldResource5">
                                            <ItemTemplate>
                                                <asp:LinkButton ID="lnkDownload" runat="server" OnClick="DownloadFile"
                                                    CommandArgument='<%# Bind("documentId") %>' Text='<%# Eval("documentName") %>'></asp:LinkButton>
                                            </ItemTemplate>
                                            <ItemStyle HorizontalAlign="left"></ItemStyle>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Action" ItemStyle-Width="110px" meta:resourcekey="TemplateFieldResource6">
                                            <ItemTemplate>
                                                <asp:Button ID="btnDeleteServiceDoc" class="btn btn-outline-danger" runat="server" Text="Delete"
                                                    OnClientClick="return confirm('Are you sure? want to delete the document.');"
                                                    OnClick="btnDeleteServiceDoc_Click" CommandArgument='<%# Bind("documentId") %>' meta:resourcekey="btnDeleteServiceDocResource1" />
                                            </ItemTemplate>

                                            <ItemStyle Width="110px"></ItemStyle>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Date Uploaded " meta:resourcekey="TemplateFieldResource7">
                                            <ItemTemplate>
                                                <asp:Label ID="lblDateUploaded" runat="server" Text='<%# Bind("dateUploaded") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                    </Columns>
                                    <FooterStyle BackColor="White" ForeColor="#333333" />
                                    <HeaderStyle BackColor="#336666" Font-Bold="True" ForeColor="White" />
                                    <PagerStyle BackColor="#336666" ForeColor="White" HorizontalAlign="Center" />
                                    <RowStyle BackColor="White" ForeColor="#333333" />
                                    <SelectedRowStyle BackColor="#339966" Font-Bold="True" ForeColor="White" />
                                    <SortedAscendingCellStyle BackColor="#F7F7F7" />
                                    <SortedAscendingHeaderStyle BackColor="#487575" />
                                    <SortedDescendingCellStyle BackColor="#E5E5E5" />
                                    <SortedDescendingHeaderStyle BackColor="#275353" />
                                </asp:GridView>
                                <input type="hidden" runat="server" id="hidServiceId" />
                                <input type="hidden" runat="server" id="hdnRefNo" />
                                <asp:HiddenField ID="hiddenServiceId" runat="server" />
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
