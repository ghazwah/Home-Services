<%@ Page Title="" Language="C#" EnableEventValidation="false"  MasterPageFile="~/Site1.Master" AutoEventWireup="true" 
    CodeBehind="babySitterManagement.aspx.cs" Inherits="HomeService.babySitterManagement" culture="auto" meta:resourcekey="PageResource1" uiculture="auto" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
   
    <script src="https://code.jquery.com/jquery-3.5.1.js"></script>
    <script src="//cdn.datatables.net/1.10.25/js/jquery.dataTables.min.js"></script>
    <link href="//cdn.datatables.net/1.10.25/css/jquery.dataTables.min.css" rel="stylesheet" />
    <%--  --%>
    <script type="text/javascript">
        $(document).ready(function () {
            $(".table").prepend($("<thead></thead>").append($(this).find("tr:first"))).dataTable();
        });
    </script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    
    
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />

    <head>

        <!-- Title Page-->
        <title>Babysitter Management</title>



    </head>

    <body>
        <form>

              <div class="container">
      <div class="row">

         <div class="col-md-8 mx-auto">


                        <br />
                        <br />


                        <div class="card">
                            <div class="card-body">


                                <div class="row">
                                    <div class="col">
                                        <center>
          <h4><asp:Localize ID="Localize1" meta:resourceKey="Localize1Resource1" text="BabySitter Form" runat="server"></asp:Localize></h4>

                        </center>
                                    </div>
                                </div>


                                <div class="row">
                                    <div class="col">
                                        <center>

                              <asp:Label ID="lblOutput" runat="server" Text=" " CssClass="myFormOutput" meta:resourcekey="lblOutputResource1"></asp:Label>
                                             </center>
                                    </div>
                                </div>


                                <%--line --%>
                                <div class="row">
                                    <div class="col">
                                        <hr>
                                    </div>
                                </div>



                                <div class="row">


                                    <div class="col-md-4">
                           <asp:Label ID="lblName" runat="server" Text="Name" Class="auto-style1" meta:resourcekey="lblNameResource1" Width="50px"></asp:Label>
                                        <div class="form-group">
                                            <asp:TextBox CssClass="form-control" ID="txtbabySitterName" runat="server" meta:resourcekey="txtNameResource1"
                                                placeholder="Name"></asp:TextBox>
                                        </div>
                           

                                    </div>

                                    <div class="col-md-4">
                            <asp:Label ID="lblAge" runat="server" Text="Age" Class="auto-style1" meta:resourcekey="lblAgeResource1" Width="50px"></asp:Label>
                                        <div class="form-group">
                                            <asp:TextBox CssClass="form-control" ID="txtbabySitterAge" runat="server" meta:resourcekey="txtAgeResource1"
                                                placeholder="Age"></asp:TextBox>
                                        </div>


                                    </div>

                                    <div class="col-md-4">
                                 <asp:Label ID="LblServices" runat="server" Text="Service" Class="auto-style1" meta:resourcekey="lblServiceResource1" Width="70px"></asp:Label>
                                        <div class="form-group">
                                            <asp:TextBox class="form-control" ID="txtServices" runat="server"  meta:resourcekey="txtServicesResource1" ReadOnly="True">3</asp:TextBox>
                                        </div>


                                    </div>
                                </div>


                                <div class="row">
                                    

                                    <div class="col-md-4">
                     <asp:Label ID="lblReligion" runat="server" Text="Religion" Class="auto-style1" meta:resourcekey="lblReligionResource1" Width="70px"></asp:Label>
                                        <div class="form-group">
                                            <asp:DropDownList class="btn btn-light dropdown-toggle dropdown-toggle-split" style="width: 200px; height: 40px;"  ID="ddlReligion"
                                                runat="server" AppendDataBoundItems="True" meta:resourcekey="ddlReligionResource1" >
                                                 <asp:ListItem Value="0" Text="Select one " meta:resourcekey="ListItemResource1"></asp:ListItem>
                                            </asp:DropDownList>

                                        </div>
                                    </div>



                                    <div class="col-md-4">
                           <asp:Label ID="lblNationality" runat="server" Text="Nationality" Class="auto-style1" meta:resourcekey="lblNationalityResource1" Width="90px"></asp:Label>
                                        <div class="form-group">
                                            <asp:DropDownList class="btn btn-light dropdown-toggle dropdown-toggle-split" style="width: 200px; height: 40px;" ID="ddlNationality"
                                                runat="server" AppendDataBoundItems="True" meta:resourcekey="ddlNationalityResource1">
                                                 <asp:ListItem Value="0" Text="Select one " meta:resourcekey="ListItemResource2"></asp:ListItem>
                                            </asp:DropDownList>

                                        </div>
                                    </div>

                                    <div class="col-md-4">
                                 <asp:Label ID="lblMaritalStatus" runat="server" Text="Marital Status" Class="auto-style1" meta:resourcekey="lblMaritalStatusResource1" Width="120px"></asp:Label>
                                        <div class="form-group">
                                            <asp:DropDownList class="btn btn-light dropdown-toggle dropdown-toggle-split" style="width: 200px; height: 40px;" ID="ddlMaritalStatus"
                                                runat="server" AppendDataBoundItems="True" meta:resourcekey="ddlMaritalStatusResource1">
                                                 <asp:ListItem Value="0" Text="Select one " meta:resourcekey="ListItemResource3"></asp:ListItem>
                                            </asp:DropDownList>

                                        </div>
                                    </div>


                                </div>



                                <div class="row">

                                    <div class="col">
                                    <asp:Label ID="lblExperienceYears" runat="server" Text="Experience Years" Class="auto-style1" meta:resourcekey="lblExperienceYearsResource1" Width="150px"></asp:Label>
                                        <div class="form-group">
                                            <asp:TextBox CssClass="form-control" ID="txtExperienceYears" runat="server" meta:resourcekey="txtExperienceYearsResource1"
                                                placeholder="Experience Years" TextMode="MultiLine" Rows="3"></asp:TextBox>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">

                                    <div class="col">
                     <asp:Label ID="lblNote" runat="server" Text="Note" Class="auto-style1" meta:resourcekey="lblNoteResource1" Width="150px"></asp:Label>
                                        <div class="form-group">
                                          <asp:TextBox CssClass="form-control" ID="txtNote" runat="server"  meta:resourcekey="txtNoteResource1"
                                                placeholder="Note" TextMode="MultiLine" Rows="3"></asp:TextBox>
                                            <br />
                                        </div>
                                    </div>
                                </div>



                                <br />
                                <br />

                                
                                <br />

                                <div class="row">

                                    <div class="col-md-3">
                                        <asp:Button ID="btnAdd" class="btn btn-md btn-block btn-success" runat="server" Text="Add" OnClick="btnAdd_Click" meta:resourcekey="btnAddResource1" />

                                    </div>

                                    <div class="col-md-3">
                                        <asp:Button ID="btnUpdate" class="btn btn-md btn-block btn-success" runat="server" Text="Update" OnClick="btnUpdate_Click" meta:resourcekey="btnUpdateResource1" />

                                    </div>

                                    <div class="col-md-3">
                                        <asp:Button ID="btnClear" class="btn btn-md btn-block btn-success" runat="server" Text="Clear" OnClick="btnClear_Click" meta:resourcekey="btnClearResource1" />

                                    </div>
                                    <div class="col-md-3">

                                        <asp:Button ID="btnDelete" class="btn btn-md btn-block btn-danger" runat="server" Text="Delete" OnClientClick="return confirm('Are you sure? delete this babySitter ?');" OnClick="btnDelete_Click" meta:resourcekey="btnDeleteResource1" />
                                    </div>
                            </div>


                                <br />

                                <div class="row">
                                    <div class="col-md-8" style="margin-left: 17%">
                                        <asp:Button ID="btnGridView" class="btn btn-md btn-block btn-outline-success" runat="server" Text="Grid View" OnClick="btnGridView_Click" meta:resourcekey="btnGridViewResource1" />
                                    </div>
                                </div>
                                <br />

                                <br />


                            </div>
                        </div>

                       
           
             </div>
             
             <br />

                        <br />
                        <br />

                        <br />

             <div class="col-lg-10 mx-auto">
                   <br />

                        <br />

            <div class="card">
               <div class="card-body">

                        

                                <div class="row">
                                    <div class="col">

                                <asp:GridView ID="gvbabySitter" class="table table-striped table-bordered" runat="server" AutoGenerateColumns="False" DataKeyNames="babySitterId" Height="112px" Width="602px" meta:resourcekey="gvBabySitterResource1">
                                    <Columns>
                                        <asp:TemplateField HeaderText="ID" InsertVisible="False" SortExpression="babySitterId" meta:resourcekey="TemplateFieldResource1">
                                            <EditItemTemplate>
                                                <asp:Label ID="Label1" runat="server" Text='<%# Eval("babySitterId") %>' meta:resourcekey="Label1Resource1"></asp:Label>
                                            </EditItemTemplate>
                                            <ItemTemplate>
                                                <asp:LinkButton ID="lbbabySitterId" runat="server" Text='<%# Bind("babySitterId") %>'
                                                    OnClick="GetbabySitterData" meta:resourcekey="lbbabySitterIdResource1"></asp:LinkButton>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Name" SortExpression="babySitterName" meta:resourcekey="TemplateFieldResource2">
                                            <EditItemTemplate>
                                                <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("babySitterName") %>' meta:resourcekey="TextBox1Resource1"></asp:TextBox>
                                            </EditItemTemplate>
                                            <ItemTemplate>
                                                <asp:Label ID="Label2" runat="server" Text='<%# Bind("babySitterName") %>' meta:resourcekey="Label2Resource1"></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Age" SortExpression="babySitterAge" meta:resourcekey="TemplateFieldResource3">
                                            <EditItemTemplate>
                                                <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("babySitterAge") %>' meta:resourcekey="TextBox2Resource1"></asp:TextBox>
                                            </EditItemTemplate>
                                            <ItemTemplate>
                                                <asp:Label ID="Label3" runat="server" Text='<%# Bind("babySitterAge") %>' meta:resourcekey="Label3Resource1"></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="expYears" SortExpression="experienceYears" meta:resourcekey="TemplateFieldResource4">
                                            <EditItemTemplate>
                                                <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("experienceYears") %>' meta:resourcekey="TextBox3Resource1"></asp:TextBox>
                                            </EditItemTemplate>
                                            <ItemTemplate>
                                                <asp:Label ID="Label4" runat="server" Text='<%# Bind("experienceYears") %>' meta:resourcekey="Label4Resource1"></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                       <asp:TemplateField HeaderText="note" SortExpression="note" meta:resourcekey="TemplateFieldResource5">
                                         <EditItemTemplate>
                                          <asp:TextBox ID="TextBox9" runat="server" Text='<%# Bind("note") %>' meta:resourcekey="TextBox9Resource1"></asp:TextBox>
                                             </EditItemTemplate>
                                         <ItemTemplate>
                                          <asp:Label ID="Label9" runat="server" Text='<%# Bind("note") %>' meta:resourcekey="Label9Resource1"></asp:Label>
                                         </ItemTemplate>
                                         </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Religion" SortExpression="religion" meta:resourcekey="TemplateFieldResource6">
                                            <EditItemTemplate>
                                                <asp:TextBox ID="TextBox5" runat="server" Text='<%# Bind("religion") %>' meta:resourcekey="TextBox5Resource1"></asp:TextBox>
                                            </EditItemTemplate>
                                            <ItemTemplate>
                                                <asp:Label ID="Label6" runat="server" Text='<%# Bind("religion") %>' meta:resourcekey="Label6Resource1"></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Nationality" SortExpression="nationality" meta:resourcekey="TemplateFieldResource7">
                                            <EditItemTemplate>
                                                <asp:TextBox ID="TextBox6" runat="server" Text='<%# Bind("nationality") %>' meta:resourcekey="TextBox6Resource1"></asp:TextBox>
                                            </EditItemTemplate>
                                            <ItemTemplate>
                                                <asp:Label ID="Label7" runat="server" Text='<%# Bind("nationality") %>' meta:resourcekey="Label7Resource1"></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Services" SortExpression="services" meta:resourcekey="TemplateFieldResource8">
                                            <EditItemTemplate>
                                                <asp:TextBox ID="TextBox7" runat="server" Text='<%# Bind("services") %>' meta:resourcekey="TextBox7Resource1"></asp:TextBox>
                                            </EditItemTemplate>
                                            <ItemTemplate>
                                                <asp:Label ID="Label8" runat="server" Text='<%# Bind("services") %>' meta:resourcekey="Label8Resource1"></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:BoundField DataField="MaritalStatus" HeaderText="maritalStatus" SortExpression="maritalStatus"  meta:resourcekey="TemplateFieldResource9"/>
                                    </Columns>
                                </asp:GridView>

                                          </div>
                                      </div>



                                <br />
                                <br />
                                <div class="row">
                                    <br />
                                <br />
                                    <div class="col-md-4">
                                        <asp:Button ID="btnExportToExcel" type="submit" class="btn btn-md btn-block btn-outline-primary" runat="server" Text="ExportToExcel" OnClick="btnExportToExcel_Click" meta:resourcekey="btnExportToExcelResource1" />

                                    </div>
                                    <div class="col-md-4">
                                        <asp:Button ID="btnExportToWord" type="submit" class="btn btn-md btn-block btn-outline-primary" runat="server" Text="ExportToWord" OnClick="btnExportToWord_Click"  meta:resourcekey="btnExportToWordResource1" />


                                    </div>

                                    <div class="col-md-4">
                                        <asp:Button ID="btnExportToPdf" type="submit" class="btn btn-md btn-block btn-outline-primary" runat="server" Text="ExportToPdf" OnClick="btnExportToPdf_Click" meta:resourcekey="btnExportToPdfResource1"  />

                                    </div>

                                        </div>
                            </div>


                        </div>
                    </div>
                </div>
                </div>
        </form>


        <br />
             <br />

    </body>

</asp:Content>
