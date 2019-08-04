<%@ Page Title="" Language="C#" MasterPageFile="~/HeaderandFooter.master" AutoEventWireup="true" CodeFile="User Profile public.aspx.cs" Inherits="User_Profile_public" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">  
    <script>
           $(document).ready(function () {
                $(".MultiLineLimit").on('change keydown paste input', function () {
                this.value = (this.value.length <= 500 ? this.value : this.value.substring(0, 500));
                });
            });
    </script>
    <style>
        #centerdiv {
            padding: 0px;
            box-shadow: 0px 0px 15px #AAA;
            border-radius: 5px;
            margin-top: 5%;
            margin-bottom: 5%;
        }
        .formdiv {
            width: 100%;
            padding: 6% 15% 7% 15%;
        }
        .leftmargin {               
            margin-left: 20%;
        }

        .heading{
            width: 100%;
            background-color: #11172D ; /*Dark blue*/
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            padding: 5% 0% 5% 0%;
        }
        .title{
            font-size: 40px;
            font-weight: 300;
            font-family: Calibri;
            text-align: center;
            color: orange;
        }
        .revrdiv{
            width: 100%;
            color: #11172D;
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            padding: 1% 0% 1% 0%;
            border-bottom: 0.5px solid gray;
            background-color: lightgrey;
        }
        .narrower{
            font-size: 14px;
        }
        .submitbtn{
            color: white;
            background-color: #eda136; /*orange*/
            padding: 10px 35px 10px 35px;
            margin-top: 10px;
        }
        .submitbtn:hover{
            background-color: #555;
            color: white;
            transition-duration: 0.7s;
            box-shadow: 0px 2px 10px #aaa;
        }
        .align-content-center{
            text-align: center;
        }
        .align-inline{
             display: grid; 
             grid-gap: 0px;
             grid-template-columns: 1fr 1fr;
        }
        .revusr{
            border:0.3px solid black;
            border-top: none;
            border-radius: 3px;
            margin: 10px; 
        }
        .revtxt{
            margin: 10px;
        }
        .revbox{
            margin: 10px;
        }
        .names{
            color: orange;
        }
        .usrbold{
            font-weight: 500;
        }
        .lblrev{
            font-family: Georgia;
            font-size: 30px;
            margin-bottom: 2%;
            margin-top: 100px;
            text-align: center;
            color: darkgray;
        }
        .error-design{
            color: red;
            font-family: Calibri;
            font-size: 15px;
            font-weight: 600;
        }
          /*Extra Small Screen*/
        @media (max-width: 576px) {
            align-inline{
                 grid-template-columns: none;
            }
            #centerdiv {
                margin-top: 0%;
                margin-bottom: 0%;
            }
        }
        /*Small Screen*/
        @media (max-width: 768px){        
            .align-inline{
                grid-template-columns: none;
                grid-gap: 0px;
            }
            
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div style="width:100%">
        <div class="offset-lg-2 col-lg-8 offset-sm-1 col-sm-10 col-12 container-fluid" id="centerdiv">
            <div class="heading">    
                <h3 class="title align-content-center">User Profile</h3>
            </div>

            <div id="usrdiv" class="formdiv">              
                <asp:Repeater ID="rptrusr" runat="server">
                    <ItemTemplate> 
                
                        <div>
                            <h5 class="align-content-center names"><%#Eval("f_name")%> <%#Eval("l_name") %></h5>
                        </div>
                        <br />

                        <div>
                            <div class="align-inline leftmargin">
                                <label class="usrbold">Address:</label>
                                <p class="usradd"><%#Eval("address") %></p>
                            </div>

                            <div class="align-inline leftmargin">
                                <label class="usrbold">City:</label>
                                <p class="usrcity"><%#Eval("city_name") %></p>
                            </div>
                                    
                            <div class="align-inline leftmargin">
                                <label class="usrbold">Date Of Birth:</label>
                                <p class="usrdob"><%#Eval("dob", "{0:dd/MM/yyyy}") %></p>
                            </div>

                            <div class="align-inline leftmargin">
                                <label class="usrbold">Phone No:</label>
                                <p class="usrphone"><%#Eval("phone_no") %></p>
                            </div>

                            <div class="align-inline leftmargin">
                                <label class="usrbold">Email:</label>
                                <p class="usremail"><%#Eval("email") %></p>
                            </div>
                        </div>
                    </ItemTemplate>
                </asp:Repeater>
            </div> 

            <div class="divrev">
                <div class="heading">
                    <h3 class="title">Reviews</h3>
                </div>
                
                <div class="formdiv">
                    <asp:Repeater ID="revrptr" runat="server">
                        <ItemTemplate>
                            
                            <div class="revusr">
                                <div class="revrdiv align-inlign">  
                                        <p><%#Eval("f_name")%> <%#Eval("l_name") %>: As a <%#Eval("reviewer_type")%> To a <%#Eval("reviewee_type")%></p>      
                                </div>
                                <div class="revtxt">
                                    <p><%#Eval("user_review")%></p>
                                </div>
                            </div>                           
                        </ItemTemplate>
                    </asp:Repeater>

                    <div class="align-content-center">
                        <asp:Label ID="lblrevid" runat="server" CssClass="lblrev"></asp:Label>
                    </div>

                    <br />
                    <div class="revbox">
                        <div class="align-inline">
                            <label class="usrbold">Your Review:</label>
                            <div>
                                <label>As a</label>
                                <asp:DropDownList ID="revr" runat="server" Class=" narrower">
                                    <asp:ListItem Value="Landlord">Landlord</asp:ListItem>
                                    <asp:ListItem Value="Buyer">Buyer</asp:ListItem>
                                    <asp:ListItem Value="Tenant">Tenant</asp:ListItem>
                                    <asp:ListItem Value="Seller">Seller</asp:ListItem>
                                    <asp:ListItem Value="Agent">Agent</asp:ListItem>
                                </asp:DropDownList>
                                <label>To a</label>
                                <asp:DropDownList ID="revee" runat="server" Class="narrower">
                                    <asp:ListItem Value="Landlord">Landlord</asp:ListItem>
                                    <asp:ListItem Value="Buyer">Buyer</asp:ListItem>
                                    <asp:ListItem Value="Tenant">Tenant</asp:ListItem>
                                    <asp:ListItem Value="Seller">Seller</asp:ListItem>
                                    <asp:ListItem Value="Agent">Agent</asp:ListItem>
                                </asp:DropDownList>
                            </div>
                        </div>

                        <asp:TextBox ID="tbrev" runat="server" Class="form-control narrower MultiLineLimit" ValidationGroup="review" TextMode="MultiLine" Rows="4" MaxLength="5"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ValidationGroup="review" ErrorMessage="Please write a review" CssClass="text-danger error-design" ControlToValidate="tbrev"></asp:RequiredFieldValidator>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ValidationGroup="review" ErrorMessage="Please choose the user type" CssClass="text-danger error-design" ControlToValidate="revr"></asp:RequiredFieldValidator>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ValidationGroup="review" ErrorMessage="Please choose the user type" CssClass="text-danger error-design" ControlToValidate="revee"></asp:RequiredFieldValidator>
                    </div>

                    <div class="align-content-center">
                        <asp:Button ID="submitrev" runat="server" Text="Submit" Class="submitbtn btn" ValidationGroup="review" OnClick="Revsave_click"/>
                    </div>
                </div>
            </div>         
                                               
        </div>
    </div>
</asp:Content>

