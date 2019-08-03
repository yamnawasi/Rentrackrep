<%@ Page Title="" Language="C#" MasterPageFile="~/HeaderandFooter.master" AutoEventWireup="true" CodeFile="User Profile public.aspx.cs" Inherits="User_Profile_public" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">

    <style>

        #maindiv {
    		background-color: white;
    	}
        #box {
			font-family: 'Roboto', sans-serif;
            padding-top:70px;
            padding-bottom:70px;
            margin: 0px;
            width:100%;
            height:100%;
        }
        #usrdiv {
	        
            padding:50px 70px 50px 70px;           
			color:black;
        }
        .heading{
            font-size: 40px;
            font-weight: 300;
            font-family: Calibri;
        }
        .revtitle{
            font-size: 25px;
            font-weight: 300;
            font-family: Calibri;
        }
        .narrower{
            font-size: 14px;
        }
        .submitbtn{
            color: white;
            background-color: #eda136; /*orange*/
            padding: 10px 35px 10px 35px;
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
             grid-gap: 20px;
             grid-template-columns: 1fr 1fr;
        }
        .revusr{
            border:0.3px solid black;
            border-radius: 3px;
            margin: 5px;
            padding:10px;
        }
        .revbox{
            margin: 10px;
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div id="maindiv">
        <div class="container-fluid col-lg-12 col-md-12 col-sm-12 col-12">
            <div id="box" class="col-lg-12 col-md-12 col-sm-12 col-12">
                <h3 class="heading align-content-center">User Profile</h3>

                <div id="usrdiv" class="offset-xl-3 col-xl-6 offset-lg-2 col-lg-8 offset-md-1 col-md-10 col-sm-12 col-12">
                
                    <asp:Repeater ID="rptrusr" runat="server">
                        <ItemTemplate> 
                
                            <div>
                                <h5 class="align-content-center"><%#Eval("f_name")%> <%#Eval("l_name") %></h5>
                            </div>

                            <br />

                            <div>

                                <div class="align-inline">
                                    <label>Address</label>
                                    <p class="usradd"><%#Eval("address") %></p>
                                </div>

                                <div class="align-inline">
                                    <label>City</label>
                                    <p class="usrcity"><%#Eval("city_name") %></p>
                                </div>
                                    
                                <div class="align-inline">
                                    <label>Date Of Birth</label>
                                    <p class="usrdob"><%#Eval("dob", "{0:dd/MM/yyyy}") %></p>
                                </div>

                                <div class="align-inline">
                                    <label>Phone No.</label>
                                    <p class="usrphone"><%#Eval("phone_no") %></p>
                                </div>

                                <div class="align-inline">
                                    <label>Email</label>
                                    <p class="usremail"><%#Eval("email") %></p>
                                </div>
                            </div>
                        </ItemTemplate>
                    </asp:Repeater>
                    <br />   
                    <div class="divrev align-content-center">
                        <h3 class="revtitle">Reviews</h3>
                        <div class="align-inline revusr">
                            <label>Jamal:</label>
                            <asp:Label ID="Label1" runat="server" Text="Good Tenant."></asp:Label>
                        </div>
                        <div class="align-inline revusr">
                            <label>Sara:</label>
                            <asp:Label ID="Label2" runat="server" Text="Kept the house in a good condition"></asp:Label>
                        </div>
                        <br />
                        <br />
                        <div class="revbox">
                            <label>Your Review:</label>
                            <asp:TextBox ID="tbrev" runat="server" Class="form-control narrower"  TextMode="MultiLine"></asp:TextBox>
                        </div>

                        <div>
                           <asp:Button ID="submitrev" runat="server" Text="Submit" Class="submitbtn btn"/>
                        </div>
                    </div>         
                                

                </div>    
            </div>
        </div>
    </div>
</asp:Content>

