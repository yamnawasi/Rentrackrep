<%@ Page Title="" Language="C#" MasterPageFile="~/HeaderandFooter.master" AutoEventWireup="true" CodeFile="Dashboard.aspx.cs" Inherits="Dashboard" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">

    <!--Font Awesome-->
    <link rel="stylesheet" href="Content/font-awesome.min.css"/>

    <script>
        $(document).ready(function () {
            if ( window.history.replaceState ) {
                window.history.replaceState( null, null, window.location.href );
            }
            
        });
    </script>
    <style>
        #bigdiv{
            display: flex;
            flex-direction: column;
            width: 100%;
            align-items: center;
            justify-content: center;
            //background-color: #fafafa;
        }
        #btn-div{
            display: flex;
            flex-direction: row;
            width: 50%;
            align-content: center;
            justify-content: space-around;
            padding-top: 20px;
            padding-bottom: 20px;
        }
        .db-btn{
            background-color: #e58457; /*Orange*/
            color: white;
            padding: 10px 20px;
        }
            .db-btn:hover{
                background-color: #6c7696; /*Blue*/
                color: white;
                box-shadow: 0px 0px 20px #AAA;
                transition-duration: 0.6s;
            }
        #db-heading{
            font-size: 30px;
            font-weight: 300;
            padding-top: 50px;
        }
        
        .sub-headings{
            font-family: Georgia;
            color: #e58457; /*Orange*/
        }
        .empty-message{
            color: gray;
            text-align: center;
        }
        th{
            text-align: center;
            font-weight: 500;
            font-size: 14px;
        }
        .tablink{
            color: #888;
            font-family: Georgia;
            font-weight: 500;
        }
            .tablink:hover{
                color: black;
                transition-duration: 0.8s;
            }
        .tabdesign{
            background-color: #efefef;
        }
            .tabdesign:hover{
                background-color: #f8f8f8;
                transition-duration: 0.8s;
            }
        .rowdesign {
            font-size: 14px;
        }
        .db-table{
            width: 75%;
            padding: 50px;
            box-shadow: 0px 0px 10px #aaa;
            border-radius: 5px;
            margin-top: 40px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div id="bigdiv">
        <div id="heading-div">
            <p id="db-heading">Dashboard</p>
            <hr />
        </div>

        <div id="btn-div">
            <a href="contract.aspx"><div class="btn db-btn" id="ccbtn"><i class="fa fa-pencil" id="ccicon"></i> Create Contract</div></a>
            <a href="AddProperty.aspx"><div class="btn db-btn" id="apbtn"><i class="fa fa-plus-circle" id="apicon"></i> Add Property</div></a>
            <a href="#"><div class="btn db-btn" id="rrbtn"><i class="fa fa-paper-plane" id="rricon"></i> Request Resource</div></a>
        </div>
        
        <div id="selling-history" class="db-table">
            <h3 class="sub-headings">Buying and Selling History</h3>
            <hr />
            <p>This table has a record of all the properties you have sold or bought through Rentrack.</p>

            <ul class="nav nav-tabs nav-justified" id="myTab" role="tablist">
              <li class="nav-item tabdesign">
                <a class="nav-link active tablink" id="soldprop-tab" data-toggle="tab" href="#soldprop" role="tab" aria-controls="soldprop" aria-selected="true">Sold Properties</a>
              </li>
              <li class="nav-item tabdesign">
                <a class="nav-link tablink" id="boughtprop-tab" data-toggle="tab" href="#boughtprop" role="tab" aria-controls="boughtprop" aria-selected="false">Bought Properties</a>
              </li>
            </ul>

            <div class="tab-content" id="myTabContent">
              <div class="tab-pane fade show active" id="soldprop" role="tabpanel" aria-labelledby="soldprop-tab">
                  <!--Table-->
                    <asp:Repeater ID="rptrsoldprop" runat="server">
                        <HeaderTemplate>
                            <table class="table table-bordered table-hover table-responsive-md">
                                <thead>
                                    <tr>
                                      <th scope="col">Property Title</th>
                                      <th scope="col">Property Code</th>  
                                      <th scope="col">Sold To</th>
                                      <th scope="col">Sold On</th>
                                      <th scope="col">Cost</th>
                                    </tr>
                                </thead>
                            <tbody>
                        </HeaderTemplate>

                        <ItemTemplate>
                            <tr class="rowdesign">
                              <td><%# Eval ("property_title") %></td>    
                              <td><%# Eval ("property_code") %></td>
                              <td><%# Eval ("f_name") %> <%# Eval ("l_name") %></td>
                              <td><%# Eval ("date_sold") %></td>
                              <td><%# Eval ("cost") %></td>
                            </tr>
                        </ItemTemplate>

                        <FooterTemplate>
                                </tbody>
                            </table>
                        </FooterTemplate>
                    </asp:Repeater>
                <div style="text-align: center">
                    <asp:label runat="server" text="" ID="soldpropmsg" class="empty-message"></asp:label>
                </div>

              </div>

              <div class="tab-pane fade" id="boughtprop" role="tabpanel" aria-labelledby="boughtprop-tab">
                  <!--Table-->
                    <asp:Repeater ID="rptrboughtprop" runat="server">
                        <HeaderTemplate>
                            <table class="table table-bordered table-hover table-responsive-md">
                                <thead>
                                    <tr>
                                      <th scope="col">Property Title</th>
                                      <th scope="col">Property Code</th>  
                                      <th scope="col">Bought From</th>
                                      <th scope="col">Sold On</th>
                                      <th scope="col">Cost</th>
                                    </tr>
                                </thead>
                            <tbody>
                        </HeaderTemplate>

                        <ItemTemplate>
                            <tr class="rowdesign">
                              <td><%# Eval ("property_title") %></td>    
                              <td><%# Eval ("property_code") %></td>
                              <td><%# Eval ("f_name") %> <%# Eval ("l_name") %></td>
                              <td><%# Eval ("date_sold") %></td>
                              <td><%# Eval ("cost") %></td>
                            </tr>
                        </ItemTemplate>

                        <FooterTemplate>
                                </tbody>
                            </table>
                        </FooterTemplate>
                    </asp:Repeater>
                    <div style="text-align: center">
                        <asp:label runat="server" text="" ID="boughtproptext" class="empty-message"></asp:label>
                    </div>
                  </div>
            </div>
        </div>


        <!--Rented History-->
        
        <div id="renting-history" class="db-table">

            <h3 class="sub-headings">Renting History</h3>
                <p>This table has a history of all the properties you have rented or are currently renting through Rentrack.</p>
            <hr />
            <nav>
              <ul class="nav nav-tabs nav-justified" id="rhnav-tab" role="tablist">
                <li class="nav-item tabdesign">
                    <a class="nav-link active tablink" id="landlord-tab" data-toggle="tab" href="#landlordprop" role="tab" aria-controls="landlordprop" aria-selected="true">Landlord</a>
                </li>
                <li class="nav-item tabdesign">
                    <a class="nav-link tablink" id="tenantprop-tab" data-toggle="tab" href="#tenantprop" role="tab" aria-controls="tenantprop" aria-selected="false">Tenant</a>
                </li>
              </ul>
            </nav>
            <div class="tab-content" id="rhnav-tabContent">
              <div class="tab-pane fade show active" id="landlordprop" role="tabpanel" aria-labelledby="landlord-tab">
                  <asp:Repeater ID="rptrlandlord" runat="server">
                        <HeaderTemplate>
                            <table class="table table-bordered table-hover table-responsive-md">
                                <thead>
                                    <tr>
                                      <th scope="col">Property Title</th>
                                      <th scope="col">Property Code</th>  
                                      <th scope="col">Tenant</th>
                                      <th scope="col">Rent</th>
                                      <th scope="col">Contract Start</th>
                                      <th scope="col">Contract End</th>
                                      <th scope="col">Active</th>
                                    </tr>
                                </thead>
                            <tbody>
                        </HeaderTemplate>

                        <ItemTemplate>
                            <tr class="rowdesign">
                              <td><%# Eval ("property_title") %></td>    
                              <td><%# Eval ("property_code") %></td>
                              <td><%# Eval ("f_name") %> <%# Eval ("l_name") %></td>
                              <td><%# Eval ("rent") %></td>
                              <td><%# Eval ("start_date") %></td>
                              <td><%# Eval ("end_date") %></td>                      
                              <td><%# Eval ("active") %></td>
                            </tr>
                        </ItemTemplate>

                        <FooterTemplate>
                                </tbody>
                            </table>
                        </FooterTemplate>
                    </asp:Repeater>
                    <div style="text-align: center">
                        <asp:label runat="server" text="" ID="llpropmsg" class="empty-message"></asp:label>
                    </div>
              </div>

              <div class="tab-pane fade" id="tenantprop" role="tabpanel" aria-labelledby="tenantprop-tab">
                  <asp:Repeater ID="rptrtenant" runat="server">
                        <HeaderTemplate>
                            <table class="table table-bordered table-hover table-responsive-md">
                                <thead>
                                    <tr>
                                      <th scope="col">Property Title</th>
                                      <th scope="col">Property Code</th>  
                                      <th scope="col">Landlord</th>
                                      <th scope="col">Rent</th>
                                      <th scope="col">Contract Start</th>
                                      <th scope="col">Contract End</th>
                                      <th scope="col">Active</th>
                                    </tr>
                                </thead>
                            <tbody>
                        </HeaderTemplate>

                        <ItemTemplate>
                            <tr class="rowdesign">
                              <td><%# Eval ("property_title") %></td>    
                              <td><%# Eval ("property_code") %></td>
                              <td><%# Eval ("f_name") %> <%# Eval ("l_name") %></td>
                              <td><%# Eval ("rent") %></td>
                              <td><%# Eval ("start_date") %></td>
                              <td><%# Eval ("end_date") %></td>                      
                              <td><%# Eval ("active") %></td>
                            </tr>
                        </ItemTemplate>

                        <FooterTemplate>
                                </tbody>
                            </table>
                        </FooterTemplate>
                    </asp:Repeater>
                    <div style="text-align: center">
                        <asp:label runat="server" text="" ID="tenpropmsg" class="empty-message"></asp:label>
                    </div>
              </div>
            </div>
        </div>


        <!--Currently Listed-->        
        <div id="currently-listed" class="db-table">

            <h3 class="sub-headings">Current Listings</h3>
                <p>All your properties that are currently listed on Rentrack.</p>
            <hr />
            <nav>
              <ul class="nav nav-tabs nav-justified" id="clnav-tab" role="tablist">
                <li class="nav-item tabdesign">
                    <a class="nav-link active tablink" id="forsale-tab" data-toggle="tab" href="#forsale" role="tab" aria-controls="forsale" aria-selected="true">For Sale</a>
                </li>
                <li class="nav-item tabdesign">
                    <a class="nav-link tablink" id="forrent-tab" data-toggle="tab" href="#forrent" role="tab" aria-controls="forrent" aria-selected="false">For Rent</a>
                </li>
              </ul>
            </nav>
            <div class="tab-content" id="clnav-tabContent">
              <div class="tab-pane fade show active" id="forsale" role="tabpanel" aria-labelledby="forsale-tab">
                  <asp:Repeater ID="rptrforsale" runat="server">
                        <HeaderTemplate>
                            <table class="table table-bordered table-hover table-responsive-md">
                                <thead>
                                    <tr>
                                      <th scope="col">Property Title</th>
                                      <th scope="col">Property Code</th>  
                                      <th scope="col">Price</th>
                                      <th scope="col">Property Page</th>
                                    </tr>
                                </thead>
                            <tbody>
                        </HeaderTemplate>

                        <ItemTemplate>
                            <tr class="rowdesign">
                              <td><%# Eval ("property_title") %></td>    
                              <td><%# Eval ("property_code") %></td>
                              <td><%# Eval ("property_price") %> </td>
                              <td><a href="#">View Property Page</a></td>
                            </tr>
                        </ItemTemplate>

                        <FooterTemplate>
                                </tbody>
                            </table>
                        </FooterTemplate>
                    </asp:Repeater>
                    <div style="text-align: center">
                        <asp:label runat="server" text="" ID="forsalemsg" class="empty-message"></asp:label>
                    </div>
              </div>

              <div class="tab-pane fade" id="forrent" role="tabpanel" aria-labelledby="forrent-tab">
                  <asp:Repeater ID="rptrforrent" runat="server">
                        <HeaderTemplate>
                            <table class="table table-bordered table-hover table-responsive-md">
                                <thead>
                                    <tr>
                                      <th scope="col">Property Title</th>
                                      <th scope="col">Property Code</th>  
                                      <th scope="col">Price</th>
                                      <th scope="col">Property Page</th>
                                    </tr>
                                </thead>
                            <tbody>
                        </HeaderTemplate>

                        <ItemTemplate>
                            <tr class="rowdesign">
                              <td><%# Eval ("property_title") %></td>    
                              <td><%# Eval ("property_code") %></td>
                              <td><%# Eval ("property_price") %> </td>
                              <td><a href="#">View Property Page</a></td>
                            </tr>
                        </ItemTemplate>

                        <FooterTemplate>
                                </tbody>
                            </table>
                        </FooterTemplate>
                    </asp:Repeater>
                    <div style="text-align: center">
                        <asp:label runat="server" text="" ID="forrentmsg" class="empty-message"></asp:label>
                    </div>
              </div>
            </div>
        </div>
        

    </div>
</asp:Content>

