<%@ Page Title="" Language="C#" MasterPageFile="~/HeaderandFooter.master" AutoEventWireup="true" CodeFile="ForgotPassword.aspx.cs" Inherits="ForgotPassword" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">

<meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />

    <title>Forgot Password</title>
    <script src="js/jquery-3.3.1.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <link href="css/bootstrap.min.css" rel="stylesheet" />

   
    <style>
    	#maindiv {
    		background-image: url("Images/bg2.jpeg");
    		background-size: cover;
    		background-repeat: no-repeat;
    		background-attachment: fixed;
    	}
        #box {
			font-family: 'Roboto', sans-serif;
            padding-top:70px;
            padding-bottom:70px;
            margin: 0px;
            width:100%;
            height:100%;
        }
        #form {
	        background: rgba(0, 0, 5, 0.65);
	        -moz-border-radius: 5px; -webkit-border-radius: 5px; border-radius: 5px;
            padding:50px 70px 50px 70px;           
			color:white;
        }
        
        #btPassRec {
			margin-top:20px; 
			margin-bottom:20px;
			text-align:center;	
        }
        h2 {
            color:white;
            text-align:center;
            margin-bottom:20px;
            font-family: Georgia;
            font-weight: 300;
        }
		.btn {
	        height: 50px;
            margin: 0;
            padding: 0 20px;
			text-align: center;           
            vertical-align: middle;
            background: #eda136;
            border: 0;
            font-family: 'Roboto', sans-serif;
            font-size: 16px;
            font-weight: 300;
            line-height: 50px;
            color: #fff;
            -moz-border-radius: 4px; -webkit-border-radius: 4px; border-radius: 4px;
            text-shadow: none;
            -moz-box-shadow: none; -webkit-box-shadow: none; box-shadow: none;
            -o-transition: all .3s; -moz-transition: all .3s; -webkit-transition: all .3s;  transition: all .3s;
        }
		
		.btn:hover { opacity: 0.7; color: black; }
		.btn:active { outline: 0; opacity: 0.6; color: #fff; -moz-box-shadow: none; -webkit-box-shadow: none; box-shadow: none; }
	    .btnpad {
			padding-left:30px;
			padding-right:30px;
		}
        .error-design {
            color: red;
            font-family: Calibri;
            font-size: 16px;
            font-weight: 600;
        }
        .align-content-center{
            text-align: center;
        }
        .narrower{
            font-size: 14px;
        }
        #para{
            text-align: center;
            font-weight: 500;
            font-size: 20px;
            font-family: Arial, sans-serif;
            margin-bottom: 20px;
        }
        #lblPassRec{
            text-align: center;
            font-weight: 500;
            font-size: 18px;
            font-family: Calibri;
            margin-bottom: 20px;
        }
    </style>

</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

 <div id="maindiv">
    <div class="container-fluid col-lg-12 col-md-12 col-sm-12 col-12">
        <div id="box" class="col-lg-12 col-md-12 col-sm-12 col-12">
            <div id="form" class="offset-xl-3 col-xl-6 offset-lg-2 col-lg-8 offset-md-1 col-md-10 col-sm-12 col-12">

                <h2>Password Recovery</h2>
                <p id="para">Please enter your Email address. We will send you the instructions to reset your password.</p>
                <hr style="background-color:#999; margin: 30px 0px 30px 0px"/>
 
                    <label>Email</label>
                    <asp:TextBox ID="tbemail" runat="server" Class="form-control narrower" TextMode="Email"></asp:TextBox>
                    <asp:RegularExpressionValidator ID="emailexp" runat="server" ValidationGroup="recpass" ErrorMessage="Incorrect format" ControlToValidate="tbemail" SetFocusOnError="true"  ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" CssClass="Validation-Msg text-danger error-design" Display="Dynamic"></asp:RegularExpressionValidator> 
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ValidationGroup="recpass" ErrorMessage="This field is required" CssClass="text-danger error-design" ControlToValidate="tbemail"></asp:RequiredFieldValidator>               
                    
                    <div class="align-content-center">
                        <asp:Button ID="btPassRec" runat="server" CssClass="btn" Text="Send" OnClick="BtPassRec_Click" ValidationGroup="recpass"/>
                        <br/><br/>
                        <asp:Label ID="lblPassRec" runat="server"></asp:Label>
                    </div>
                        
                </div>
            </div>
        </div>
    </div>

</asp:Content>

