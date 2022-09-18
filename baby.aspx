<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="baby.aspx.cs" Inherits="HomeService.baby" Culture="auto" meta:resourcekey="PageResource1" UICulture="auto" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <script type="text/javascript">
        $(document).ready(function () {
            $(".table").prepend($("<thead></thead>").append($(this).find("tr:first"))).dataTable();
        });
        $('#myModal').on('shown.bs.modal', function () {
            $('#myInput').trigger('focus')
        })
    </script>
    <html>

    <style type="text/css">
        .rptr table {
            background: #eee;
            font: 14px segoe ui;
            border-collapse: collapse;
            width: 30%;
            margin: 5px;
            float: left;
        }

            .rptr table th {
                background: #2d6760;
                color: #fff;
                padding: 8px 20px;
                text-align: left;
            }

            .rptr table td {
                padding: 0px 10px;
            }

        .contactPhoto {
            width: 25%;
            padding-left: 10px;
            text-align: right;
        }

        .font {
            font-family: Arial;
            font-style: normal;
            text-decoration: underline;
            font-weight: bold;
        }
    </style>




    <div>
        <br />
        <br />
        <br />
        <br />
        <asp:Label ID="lblMsg" runat="server" Text=""></asp:Label>
        <h2 class="text-center">
            <asp:Localize ID="locbabySitter" meta:resourceKey="Localize1Resource10" Text="Babysitters Information" runat="server"></asp:Localize>
            <asp:Repeater ID="Repeater1" runat="server">
                <ItemTemplate>
                    <div class="rptr">

                        <center>
                             
          <table>
           
          
        
         <tr><td>  <tr><th colspan="4"><asp:Localize ID="locId" meta:resourceKey="Localize1Resource7" text="BabySitter ID:" runat="server"></asp:Localize> <%#Eval("babySitterId") %></th></tr>
           
           
           
   <tr> <td class="contactPhoto">
               <img src="assets/img/babysitter.jpeg"  Width="100px" Height="110px" ResizeMode="fit" /></td></tr>
                  <tr><td >     <br />   </td></tr>
          
              <tr><td class="font"><asp:Localize ID="locName" meta:resourceKey="Localize1Resource1" text="Name:" runat="server"></asp:Localize></td><td><%#Eval("BabySitterName") %>
                   <tr><td class="font"><asp:Localize ID="locMaritalStatus" meta:resourceKey="Localize1Resource9" text="MaritalStatus:" runat="server"></asp:Localize></td><td><%#Eval("maritalStatus") %>
             <td class="font"><asp:Localize ID="locNote" meta:resourceKey="Localize1Resource2" text="Note:" runat="server"></asp:Localize>  </td>
               </tr>
          <tr><td class="font"> <asp:Localize ID="locAge" meta:resourceKey="Localize1Resource3" text="Age:" runat="server"></asp:Localize></td><td><%#Eval("BabySitterAge") %></td>
          <td><%#Eval("note") %></td>
          </tr>
          <tr><td class="font"><asp:Localize ID="locNationality" meta:resourceKey="Localize1Resource4" text="Nationality:" runat="server"></asp:Localize></td><td><%#Eval("nationality") %></td></tr>
          <tr><td class="font"><asp:Localize ID="locReligion" meta:resourceKey="Localize1Resource5" text="Religion:" runat="server"></asp:Localize></td><td><%#Eval("religion") %></td></tr>
          <tr><td class="font"><asp:Localize ID="locExperienceYears" meta:resourceKey="Localize1Resource6" text="ExperienceYears:" runat="server"></asp:Localize></td><td><%#Eval("experienceYears") %></td></tr>
             <tr><td >     <br />   </td></tr>
           
            
          
              
              <tr><td >     <br />   </td></tr>
          
              <tr><td><button type="button" class="btn btn-sm btn-block btn-success"  data-toggle="modal" data-target="#exampleModalLong" meta:resourcekey="btnBookResource1">
                        <h6><asp:Localize ID="Localize11" meta:resourceKey="btnBookResource1" text="Book" runat="server"></asp:Localize></h6>

                   <tr><td >     <br />   </td></tr>
</button> </tr></td>
         
           </table>
              </center>
                    </div>

                </ItemTemplate>

            </asp:Repeater>
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
        <p />
    </div>

    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />




    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />

    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />


    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />

    <!-- Modal -->
    <div class="modal fade" id="exampleModalLong" tabindex="-1" role="dialog" aria-labelledby="exampleModalLongTitle" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLongTitle">
                        <asp:Localize ID="Localize1" runat="server" meta:resourceKey="contract" Text="Contract"></asp:Localize></h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <td>

                        <tr>
                            <td class="auto-style3">
                                <h6>
                                    <asp:Localize ID="Localize2" runat="server" meta:resourceKey="promes" Text="I promise"></asp:Localize></h6>
                                <h6>
                                    <asp:Localize ID="Localize3" runat="server" meta:resourceKey="lblEmailResource1" Text="Email:"></asp:Localize>
                                </h6>
                                <asp:TextBox ID="txtEmail" runat="server" TextMode="Email"> </asp:TextBox>
                                <br />
                                 <h6>
                                    <asp:Localize ID="Localize13" runat="server" meta:resourceKey="lblServicesResource1" Text="Service:"></asp:Localize>
                                </h6>
                                <asp:TextBox ID="txtServices" runat="server" ReadOnly="True" Text="BabySitter" BackColor="#F8F9FA"></asp:TextBox>
                                <br />
                                 <asp:Localize ID="Localize12" runat="server" meta:resourceKey="lblBabySitterResource1" Text="BabySitter Name:"></asp:Localize>
                                <br />
                                <asp:DropDownList ID="ddlBabySitter" class="btn btn-light dropdown-toggle dropdown-toggle-split" runat="server" AppendDataBoundItems="True">
                                    <asp:ListItem Value="" Text="Select one " meta:resourcekey="ListItemResource2"></asp:ListItem>
                                </asp:DropDownList><br />
                                <asp:Localize ID="Localize10" runat="server" meta:resourceKey="lblDurationResource1" Text="Duration:"></asp:Localize>
                                <br />
                                <asp:DropDownList ID="ddlDuration" class="btn btn-light dropdown-toggle dropdown-toggle-split" runat="server" AppendDataBoundItems="True">
                                    <asp:ListItem Value="" Text="Select one " meta:resourcekey="ListItemResource1"></asp:ListItem>
                                </asp:DropDownList><br />
                                <br />
                                <h6>
                                    <asp:Localize ID="Localize4" runat="server" meta:resourceKey="to" Text=" To satisfy the following items:"></asp:Localize>
                                </h6>
                                <h6>
                                    <asp:Localize ID="Localize5" runat="server" meta:resourceKey="item1" Text="<b>Item 1:</b>  I respect him and treat him well."></asp:Localize>
                                </h6>
                                <h6>
                                    <asp:Localize ID="Localize6" runat="server" meta:resourceKey="item2" Text="<b>Item 2:</b>  Receipt after payment for a maximum of two weeks."></asp:Localize>
                                </h6>
                                <h6>
                                    <asp:Localize ID="Localize7" runat="server" meta:resourceKey="item3" Text="<b>Item 3:</b>  He has the right to switch or retrive the amount if he doesn`t work."></asp:Localize>
                                </h6>
                                <h6>
                                    <asp:Localize ID="Localize8" runat="server" meta:resourceKey="item4" Text="<b>Item 4:</b>  You`re not allowed to rent it to anyone else,otherwise, the company has the right to take the maid, driver or babysitter, not to get the money back."></asp:Localize></h6>

                            </td>

                        </tr>

                </div>
                <div class="modal-footer">
                    <tr>
                        <td colspan="2">
                           <asp:CheckBoxList ID="cbAgree" runat="server" Font-Bold="True" BorderStyle="Dashed">
                                <asp:ListItem meta:resourcekey="cbAgreeResource1" Text="Accept" Value="1"></asp:ListItem>
                    </asp:CheckBoxList>
                            <h6 style="color: #ff0000">
                                <asp:Localize ID="Localize9" runat="server" meta:resourceKey="if" Text="*Please accept the contract to send the confirmation message."></asp:Localize></h6>

                            <asp:Button class="btn btn-md btn-block btn-success" ID="btnSend2" runat="server" Text="Send" OnClick="btnSend_Click" meta:resourcekey="btnSend2Resource1" />



                        </td>
                    </tr>

                </div>
            </div>
        </div>
    </div>

    <br />
    <br />
    <tr>
        <td colspan="2" align="center">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                <asp:Button class="btn btn-info" ID="btnSend1" runat="server" Text="Send" Visible="False" OnClick="btnSend_Click" meta:resourcekey="btnSend1Resource1" />

            <%-- <asp:Button class="btn btn-info" ID="btnClose" runat="server" Text="Close" OnClick="btnClose_Click"
                                    Visible="false"/>--%>
        </td>
    </tr>
    <tr>
        <td colspan="2" align="center">&nbsp;</td>
    </tr>

    <br />
</asp:Content>

