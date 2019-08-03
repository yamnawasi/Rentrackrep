<%@ Page Title="" Language="C#" MasterPageFile="~/HeaderandFooter.master" AutoEventWireup="true" CodeFile="Tenant Resume Public.aspx.cs" Inherits="Tenant_Resume_Public" %>

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
        #accbtn{
            background-color: #2ca344; /*Green*/
            color: white;
            padding: 10px 20px;
        }
        #rejbtn{
            background-color: #d61c1c; /*Red*/
            color: white;
            padding: 10px 20px;
        }
        .trbtn{
            margin: 20px;
        }
        .lblnores{
            font-family: Georgia;
            font-size: 30px;
            margin-bottom: 2%;
            margin-top: 100px;
            text-align: center;
            color: darkgray;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div id="maindiv">
        <div class="container-fluid col-lg-12 col-md-12 col-sm-12 col-12">
            <div id="box" class="col-lg-12 col-md-12 col-sm-12 col-12">

                <h3 class="heading align-content-center">Rental Resume</h3>

                <div class="align-content-center">
                    <asp:Label ID="lblfavid" runat="server" CssClass="lblnores align-content-center"></asp:Label>
                </div>

                <div id="usrdiv" class="align-content-center">
                    <asp:Repeater ID="rptrusr" runat="server">
                        <ItemTemplate>    
                
                            <div class="align-content-center">
                                <h5 class="align-content-center"><%#Eval("f_name")%> <%#Eval("l_name")%></h5>
                            </div>

                            <br />

                            <div>
                                <div class="align-inline">
                                <label>Move-in Date</label>
                                <p class="useradd"><%#Eval("move_in_date")%></p>
                                </div>

                                <div class="align-inline">
                                <label>No. of Tenants</label>
                                <p class="useradd"><%#Eval("number_of_tenants")%></p>
                                </div>
                                    
                                <div class="align-inline">
                                <label>Moving From</label>
                                <p class="usrdob"><%#Eval("move_in_from")%></p>
                                </div>

                                <div class="align-inline">
                                <label>Do you have any pets?</label>
                                <p class="usrphone"><%#Eval("pets")%></p>
                                </div>

                                <div class="align-inline">
                                <label>Do you smoke?</label>
                                <p class="usremail"><%#Eval("smoking")%></p>
                                </div>

                                <div class="align-inline">
                                <label>Employer</label>
                                <p class="usremail"><%#Eval("employer")%></p>
                                </div>

                                <div class="align-inline">
                                <label>Job Title</label>
                                <p class="usremail"><%#Eval("job_title")%></p>
                                </div>
                            </div>

                                <div>
                                  <a href="contract.aspx"><div class="btn trbtn" id="accbtn"><i class="fa fa-check"></i> Accept</div></a>
                                  <a href="#"><div class="btn trbtn" id="rejbtn"><i class="fa fa-times"></i> Reject</div></a>                            
                                </div>
                            </ItemTemplate>
                        </asp:Repeater>
                            <br />   
                                       
                </div>    
            </div>
        </div>
    </div>
</asp:Content>

