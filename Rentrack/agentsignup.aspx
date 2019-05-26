<%@ Page Title="" Language="C#" MasterPageFile="~/HeaderandFooter.master" AutoEventWireup="true" CodeFile="agentsignup.aspx.cs" Inherits="agentsignup" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">

	 <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />

    <title>Sign Up</title>
    <script src="js/jquery-3.3.1.min.js"></script>
    <link href="css/bootstrap.min.css" rel="stylesheet" />
 

    <style>
    	#maindiv {
    		background-image: url("Images/bg1.jpeg");
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
		 #form2 {       
	        background: rgba(0, 0, 5, 0.65);
	        -moz-border-radius: 5px; -webkit-border-radius: 5px; border-radius: 5px;
            padding:50px 70px 50px 70px;           
			color:white;
			margin-top:50px;
         }
		  #form3 {
	        background: rgba(0, 0, 5, 0.65);
	        -moz-border-radius: 5px; -webkit-border-radius: 5px; border-radius: 5px;
            padding:50px 70px 50px 70px;           
			color:white;
			margin-top:50px;
          }

        .signupbtnstyle{
			margin-top:20px; 
			margin-bottom:20px;
			text-align:center;	
          }
        #loginlink p{
			text-align:center;
			color:white;		
        }
		#loginlink a{text-decoration:none;}
        h2 {
            color:white;
            text-align:center;
            margin-bottom:20px;
            font-family: Georgia;
            font-weight: 300;
        }
        h3 {
            text-align: center;
            font-weight: 500;
            font-family: Arial, sans-serif;
            margin-bottom: 20px;
        }
        p{
            font-family: Arial, sans-serif;
            font-size: 15px;
        }
        .required-sign{
            color: red;
            font-size: 20px;
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
		 .btnpad{
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
         #lgbtn, #agbtn{
            color: #ccc;
            border-bottom: 2px solid #ccc;
            text-decoration: none;
         }
         #lgbtn:hover, #agbtn:hover{
                color: white;
                border-bottom: 2px solid white;
                transition-duration: 0.8s;
         }
        #createaccount{
            text-align: center;
            font-weight: 500;
            font-size: 20px;
            font-family: Arial, sans-serif;
            margin-bottom: 20px;
        }
         .align-inline{
             display: grid; 
             grid-gap: 20px;
             grid-template-columns: 1fr 1fr;
         }
        @media (max-width: 768px){      
            .align-inline{
                grid-template-rows: 1fr 1fr;
                grid-template-columns: none;
                grid-gap: 0px;
            }
            #form, #form1, #form2{
                padding:50px;
            }
        }

    </style>

    <script> 
        $(document).ready(function () {
        });
        function isNumberKey(evt)
        {
             var charCode = (evt.which) ? evt.which : evt.keyCode;
             if (charCode > 31 && (charCode < 48 || charCode > 57))
                return false;    
             return true;
        }
    </script> 
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

<div id="maindiv">
    <div class="container-fluid col-lg-12 col-md-12 col-sm-12 col-12">
        <div id="box" class="col-lg-12 col-md-12 col-sm-12 col-12">
            <div class="offset-xl-3 col-xl-6 offset-lg-2 col-lg-8 offset-md-1 col-md-10 col-sm-12 col-12">
          
                <div id="form">

			        <h2>Welcome to Rentrack</h2>
                    <p id="createaccount">Create an Account</p>
                    <asp:Label ID="lblMsg" runat="server"></asp:Label>
                    <hr style="background-color:#999; margin: 30px 0px 30px 0px"/>
                 		 
			 <asp:Label ID="lmsg" runat="server"></asp:Label>
             <h3>Agent Information</h3>

             <div class="align-inline"> 
			    <div>
                     <label>First Name<span class="required-sign"> *</span></label>
                     <asp:TextBox ID="fname" runat="server" Class="form-control narrower"></asp:TextBox>
                     <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="This field is required" CssClass="text-danger error-design" ControlToValidate="fname" ValidationGroup="signup" ></asp:RequiredFieldValidator>
                </div>
			    <div>
                 <label>Last Name<span class="required-sign"> *</span></label>
                 <asp:TextBox ID="lname" runat="server" Class="form-control narrower" ></asp:TextBox>
                 <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ValidationGroup="signup" ErrorMessage="This field is required" CssClass="text-danger error-design" ControlToValidate="lname"></asp:RequiredFieldValidator>
			    </div>
            </div>

            <div>
                <label>Date Of Birth<span class="required-sign"> *</span></label>
                <asp:TextBox ID="agentdob" runat="server" Class="form-control narrower" TextMode="Date"></asp:TextBox>
                <asp:RangeValidator ID="DateRangeValidator" runat="server" CssClass="text-danger error-design" Type="Date" Format="DD/MM/YYYY" ControlToValidate="agentdob" ErrorMessage="You must be between 18 to 90 years old to register" Display="Dynamic" SetFocusOnError="true"></asp:RangeValidator>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="This field is required" CssClass="text-danger error-design" ControlToValidate="agentdob" ValidationGroup="signup" EnableClientScript="True"></asp:RequiredFieldValidator>
            </div>

            <div class="align-inline">
                <div>
                    <label>Phone  No.<span class="required-sign"> *</span></label>
                    <asp:TextBox ID="agentphone" runat="server" Class="form-control narrower" onkeypress="return isNumberKey(event)" placeholder="E.g. 03001234567"></asp:TextBox>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" CssClass="text-danger error-design"
			            ErrorMessage="Enter a valid phone no."  ControlToValidate="agentphone" Display="Dynamic" 
			            ValidationExpression="^[01]?[- .]?(\([2-9]\d{2}\)|[2-9]\d{2})[- .]?\d{3}[- .]?\d{4}$" ValidationGroup="signup"> 
                    </asp:RegularExpressionValidator>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ValidationGroup="signup" ErrorMessage="This field is required" CssClass="text-danger error-design" ControlToValidate="agentphone"></asp:RequiredFieldValidator>
                </div>

                <div>
                    <label>CNIC No.<span class="required-sign"> *</span></label>
                    <asp:TextBox  ID="cnicnum" runat="server" Class="form-control narrower" placeholder="E.g. 35101-1234567-8"></asp:TextBox>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" CssClass="text-danger error-design"
			            ErrorMessage="Enter CNIC in correct format"  ControlToValidate="cnicnum" Display="Dynamic" 
			            ValidationExpression="^[0-9+]{5}-[0-9+]{7}-[0-9]{1}$" ValidationGroup="signup"> 
                    </asp:RegularExpressionValidator>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ValidationGroup="signup" ErrorMessage="This field is required" CssClass="text-danger error-design" ControlToValidate="cnicnum"></asp:RequiredFieldValidator>
                </div>
            </div>

            <div>
                <label>Address<span class="required-sign"> *</span></label>
                <asp:TextBox ID="agentaddress" runat="server" Class="form-control narrower" TextMode="MultiLine"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ValidationGroup="signup" ErrorMessage="This field is required" CssClass="text-danger error-design" ControlToValidate="agentaddress"></asp:RequiredFieldValidator>
            </div>

            <div>
                <label>City<span class="required-sign"> *</span></label>
                <asp:DropDownList ID="agentcity" runat="server" Class="form-control narrower" DataSourceID="Rentrackdb" DataTextField="city_name" DataValueField="city_name">
                </asp:DropDownList>
                <asp:SqlDataSource ID="Rentrackdb" runat="server" ConnectionString="<%$ ConnectionStrings:RentrackdbConnectionString %>" SelectCommand="SELECT [city_name] FROM [City]"></asp:SqlDataSource>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ValidationGroup="signup" ErrorMessage="This field is required" CssClass="text-danger error-design" ControlToValidate="agentcity"></asp:RequiredFieldValidator>
            </div>
         </div>

	     <div id="form2">

			<h3>Agency Information</h3>

			<div>
                <label>Agency Name<span class="required-sign"> *</span></label>
                <asp:TextBox ID="agencyname" runat="server" Class="form-control narrower" ></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ErrorMessage="This field is required" CssClass="text-danger error-design" ControlToValidate="agencyname" ValidationGroup="signup" ></asp:RequiredFieldValidator>
            </div>

		    <div class="align-inline">
                <div>
                    <label>Email<span class="required-sign"> *</span></label>
                    <asp:TextBox  ID="agencyemail" runat="server" Class="form-control narrower" TextMode="Email" ></asp:TextBox>
                    <asp:Label ID="lblagencyemail" runat="server" class="text-danger error-design" Display="dynamic"></asp:Label>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ValidationGroup="signup" ErrorMessage="Incorrect format" ControlToValidate="agencyemail" SetFocusOnError="true"  ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" CssClass="Validation-Msg text-danger error-design" Display="Dynamic"></asp:RegularExpressionValidator> 
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" ValidationGroup="signup" ErrorMessage="This field is required" CssClass="text-danger error-design" ControlToValidate="agencyemail"></asp:RequiredFieldValidator>
                </div>
             
                <div>
                    <label>Phone  No.<span class="required-sign"> *</span></label>
                    <asp:TextBox  ID="agencyphone" runat="server" Class="form-control narrower" onkeypress="return isNumberKey(event)" placeholder="E.g. 03001234567"></asp:TextBox>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator4" runat="server" CssClass="text-danger error-design"
			            ErrorMessage="Enter a valid phone no."  ControlToValidate="agencyphone" Display="Dynamic" 
			            ValidationExpression="^[01]?[- .]?(\([2-9]\d{2}\)|[2-9]\d{2})[- .]?\d{3}[- .]?\d{4}$" ValidationGroup="signup"> 
                    </asp:RegularExpressionValidator>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator11" runat="server" ValidationGroup="signup" ErrorMessage="This field is required" CssClass="text-danger error-design" ControlToValidate="agencyphone"></asp:RequiredFieldValidator>
                </div>
            </div>

            <div>
                <label>Agency Branch Address<span class="required-sign"> *</span></label>
                <asp:TextBox ID="agencyaddress" runat="server" ValidationGroup="address" Class="form-control narrower" TextMode="MultiLine"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator12" runat="server" ValidationGroup="signup" ErrorMessage="This field is required" CssClass="text-danger error-design" ControlToValidate="agencyaddress"></asp:RequiredFieldValidator>
            </div>

            <div>
                <label>City<span class="required-sign"> *</span></label>
                 <asp:DropDownList ID="agencycity" runat="server" Class="form-control narrower" DataSourceID="Rentrackdb1" DataTextField="city_name" DataValueField="city_name">
                </asp:DropDownList>
                <asp:SqlDataSource ID="Rentrackdb1" runat="server" ConnectionString="<%$ ConnectionStrings:RentrackdbConnectionString %>" SelectCommand="SELECT [city_name] FROM [City]"></asp:SqlDataSource>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator13" runat="server" ValidationGroup="signup" ErrorMessage="This field is required" CssClass="text-danger error-design" ControlToValidate="agencycity"></asp:RequiredFieldValidator>
            </div>

			<div>
                <label>Enter Code<span class="required-sign"> *</span></label>
                <p>Please enter the code that is sent to your agency's email address</p>
                <asp:TextBox ID="code" runat="server" Class="form-control narrower" onkeypress="return isNumberKey(event)" MaxLength="4"></asp:TextBox>
                <asp:Label ID="lblcode" runat="server" class="text-danger error-design" Display="dynamic"></asp:Label>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator14" runat="server" ValidationGroup="signup" ErrorMessage="This field is required" CssClass="text-danger error-design" ControlToValidate="code"></asp:RequiredFieldValidator>
            </div>
            
           <div class="form-group align-inline signupbtnstyle">   
                <asp:Button  ID="codebtn" runat="server" class="btn btnpad" Text="Send Code" OnClick="codebtn_Click"/>
                <asp:Button  ID="verifybtn" runat="server" class="btn btnpad" Text="Verify Code" OnClick="verifybtn_Click"/>
           </div>
	    </div>

        <div id="form3">
	        <h3>Login Information</h3>

            <div>
                <label>Email<span class="required-sign"> *</span></label>
                <asp:TextBox  ID="agentemail" runat="server" Class="form-control narrower" TextMode="Email" ></asp:TextBox>
                <asp:Label ID="lblemail" runat="server" class="text-danger error-design" Display="dynamic"></asp:Label>
                <asp:RegularExpressionValidator ID="agentemailexp" runat="server" ValidationGroup="signup" ErrorMessage="Incorrect format" ControlToValidate="agentemail" SetFocusOnError="true"  ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" CssClass="Validation-Msg text-danger error-design" Display="Dynamic"></asp:RegularExpressionValidator> 
                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ValidationGroup="signup" ErrorMessage="This field is required" CssClass="text-danger error-design" ControlToValidate="agentemail"></asp:RequiredFieldValidator>
            </div>

            <div class="align-inline">
                <div>
                    <label>Password<span class="required-sign"> *</span></label>
                    <asp:TextBox  ID="agentpass" runat="server" Class="form-control narrower" TextMode="Password" placeholder="Atleast 8 Characters"></asp:TextBox>
			        <asp:RegularExpressionValidator ID="tbpasswordexp" runat="server" ValidationGroup="signup" CssClass="text-danger error-design" ErrorMessage="Password length must be between 8 to 20 characters" ControlToValidate="agentpass"  ValidationExpression="^[a-zA-Z0-9'@&#.\s]{8,20}$" Display="Dynamic" ></asp:RegularExpressionValidator>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator15" runat="server" ValidationGroup="signup" ErrorMessage="This field is required" CssClass="text-danger error-design" ControlToValidate="agentpass"></asp:RequiredFieldValidator>
                </div>

                <div>
                    <label>Re-Enter Password<span class="required-sign"> *</span></label>
                    <asp:TextBox ID="reagentpass" runat="server" Class="form-control narrower" TextMode="Password"></asp:TextBox>
                    <asp:CompareValidator ID="tbrepasswordcompare" runat="server" CssClass="text-danger error-design" ControlToValidate="reagentpass" ControlToComapre="agentpass"  ValidationGroup="signup" ErrorMessage="Passwords do not match" Display="Dynamic" SetFocusOnError="true" ControlToCompare="agentpass"></asp:CompareValidator>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator16" runat="server" ValidationGroup="signup" ErrorMessage="This field is required" CssClass="text-danger error-design" ControlToValidate="reagentpass"></asp:RequiredFieldValidator>
                </div>
            </div>
                
            <div class="space-vert form-group signupbtnstyle">   
            <asp:Button  ID="agsignupbtn" runat="server" class="btn btnpad" Text="Sign Up" OnClick="agsignupbtn_Click" ValidationGroup="signup"/>
            </div>

            <div class="align-content-center" id="loginlink">
			    <a href="Login.aspx" id="lgbtn" >Log in to Existing Account</a>              
            </div>
        </div>

            </div>    
        </div>
    </div>
</div>
</asp:Content>