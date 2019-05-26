<%@ Page Title="" Language="C#" MasterPageFile="~/HeaderandFooter.master" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="Login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">

        <meta charset="utf-8"/>
        <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
        <meta name="viewport" content="width=device-width, initial-scale=1"/>
        <title>Login</title>

        <!-- CSS -->
        <link rel="stylesheet" href="http://fonts.googleapis.com/css?family=Roboto:400,100,300,500"/>
        <link rel="stylesheet" href="assets/css/bootstrap.min.css"/>
        <link rel="stylesheet" href="assets/font-awesome/css/font-awesome.min.css"/>

        <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
        <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
        <!--[if lt IE 9]>
            <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
            <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
        <![endif]-->  

        <script src="assets/js/jquery-1.11.1.min.js"></script>
        <script src="assets/bootstrap/js/bootstrap.min.js"></script>
        <script src="assets/js/jquery.backstretch.min.js"></script>
        <script src="assets/js/scripts.js"></script>

    <style>

        #maindiv {
    		background-image: url("Images/bg1.jpeg");
    		background-size: cover;
    		background-repeat: no-repeat;
    		background-attachment: fixed;
    	}
        #box {
            font-family: 'Roboto', sans-serif;
            padding-top: 70px;
            padding-bottom: 70px;
            margin: 0px;
            width: 100%;
            height: 100%;
        }
        #form {
	        background: rgba(0, 0, 5, 0.65);
	        -moz-border-radius: 5px; -webkit-border-radius: 5px; border-radius: 5px;
            padding:50px 70px 50px 70px;           
			color:white;
        }
        #loginbtnstyle {
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
        .error-design {
            color: red;
            font-family: Calibri;
            font-size: 18px;
            font-weight: 600;
        }
        .remember{
            font-size: 15px;
            font-weight: 300;
            color: #fff;
            line-height: 30px;
            margin: 5px;
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
        .align-content-center{
            text-align: center;
        }
        .sbtn{
            color: #ccc;
            border-bottom: 2px solid #ccc;
            text-decoration: none;
        }
        .sbtn:hover{
                color: white;
                border-bottom: 2px solid white;
                transition-duration: 0.8s;
        }
	</style>

</asp:Content>


<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

<div id="maindiv">
    <div class="container-fluid col-lg-12 col-md-12 col-sm-12 col-12">
        <div id="box" class="col-lg-12 col-md-12 col-sm-12 col-12">
            <div id="form" class="offset-xl-3 col-xl-6 offset-lg-2 col-lg-8 offset-md-1 col-md-10 col-sm-12 col-12">
            
                <h2>Login</h2>
                <p id="para">Enter your Email and Password to Log in</p>
                <hr style="background-color:#999; margin: 30px 0px 30px 0px"/>

			    <div class="form-group">
                    <label>Email</label>
                    <asp:TextBox ID="tbemail" runat="server" Class="form-control narrower" TextMode="Email"></asp:TextBox>
                    <asp:RegularExpressionValidator ID="emailexp" runat="server" ValidationGroup="login" ErrorMessage="Incorrect format" ControlToValidate="tbemail" SetFocusOnError="true"  ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" CssClass="Validation-Msg text-danger error-design" Display="Dynamic"></asp:RegularExpressionValidator> 
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ValidationGroup="login" ErrorMessage="This field is required" CssClass="text-danger error-design" ControlToValidate="tbemail"></asp:RequiredFieldValidator>
                </div>

			    <div class="form-group" >
			        <label>Password</label>
                    <asp:TextBox ID="tbpassword" runat="server" Class="form-control  narrower" TextMode="Password" placeholder="Atleast 8 Characters"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ValidationGroup="login" ErrorMessage="This field is required" CssClass="text-danger error-design" ControlToValidate="tbpassword"></asp:RequiredFieldValidator>

					<div class="align-content-center">
                        <a href="ForgotPassword.aspx" class="sbtn">Forgot Password?</a>
					</div>
				</div>

                <div class="form-inline">
                    <asp:CheckBox ID="remembercheck" runat="server" Class="form-check"/>
                    <asp:Label ID="lblremember" Class="remember" runat="server" Text="Remember me" for="form-check"></asp:Label>
                </div> 

                <asp:Label ID="lblError" runat="server" CssClass="text-danger error-design align-content-center"></asp:Label>
                                  
			    <div class="form-group align-content-center" id="loginbtnstyle">
                    <asp:Button id="loginbtn" runat="server" class="btn btnpad"  OnClick="Login_btn" Text="Login" ValidationGroup="login"/>                                       
                </div>

                                    
                <div class="align-content-center">
			        <a href="Sign Up.aspx" class="sbtn" >Create a new Account</a>              
                </div>

                <div class="align-content-center">
                    <br />
                    <a href="agentsignup.aspx" class="sbtn" >Sign up as Real Estate Agent</a>            
                </div> 
            
            </div>            
        </div>            
    </div>    
</div>	

</asp:Content>


