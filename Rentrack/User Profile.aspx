<%@ Page Title="User Profile" Language="C#" MasterPageFile="~/HeaderandFooter.master" AutoEventWireup="true" CodeFile="User Profile.aspx.cs" Inherits="User_Profile" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">

    <link rel="stylesheet" href="Content/font-awesome.min.css"/>
    
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous"/>
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-multiselect/0.9.15/css/bootstrap-multiselect.css" rel="stylesheet" type="text/css" />
   <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-multiselect/0.9.15/js/bootstrap-multiselect.js"></script>

    <script>
        $(document).ready(function () {
            if ( window.history.replaceState ) {
                window.history.replaceState( null, null, window.location.href );
            }
        });

        $(document).ready(function () {
        });
        function isNumberKey(evt)
        {
             var charCode = (evt.which) ? evt.which : evt.keyCode;
             if (charCode > 31 && (charCode < 48 || charCode > 57))
                return false;    
             return true;
        }

        $(function () {
            $('[id*=agentcitylist]').multiselect({
                includeSelectAllOption: true

            });
        });

        $(function () {
            $('[id*=agencycitylist]').multiselect({
                includeSelectAllOption: true
            });
        });
    </script>

    <style>
        #bigdiv{
            width: 100%;
            height: 100%;
            display: flex;
            flex-direction: row;
            margin: 0px;
            position: relative;
        }
        footer{
            display: none;
        }

        /*Side Bar*/
        .ufn{
            color: white;
            font-size: 20px;
            font-weight: 200;
        }
        #sidebardiv{
            width: 20%;
            box-shadow: 0px 0px 5px #aaa;
            height: 100%;
            position: fixed; 
            background-color: white;
        }
        #contentdiv{
            width: 100%;
            padding-left: 20%;
            background-color: #eee;
        }
        .sidebarbtns{
            text-decoration: none;
            padding-top: 20px;
            color: gray;
            padding-left: 30px;
        }
            .sidebarbtns:hover{
                text-decoration: none;
                color: #e58457;
                transition-duration: 0.6s;
            }
        #sidebartop{
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
            background-image: linear-gradient(#e58457, #6c7696); /*orange to blue*/
            background-size: cover; 
            background-repeat: no-repeat; 
            height: 180px;

        }
        #usic{
            position: absolute;
            top: 140px;
            border-radius: 60%;
        }
        #sidebarlinks{
            padding-top: 70px;
        }
        .activebtn{
            color: #e58457;
        }
        .inactivebtn{
            color: gray;
        }

        /*Rental Resume*/
        .heading{
            font-size: 30px;
            font-weight: 300;
            text-align: center;
            padding-top: 30px;
            color: #e57e3d; /*Orange*/
        }
        #rentresform{
            width: 50%;
        }
        #rentresdiv{
            background-color: red;
        }
        .narrower{
             font-size: 14px;
        }
        .form-heading{
            margin-top: 20px;
        }
        .save-button{
            background-color: #e57e3d; /*Orange*/
            padding: 10px 30px 10px 30px;
            color: white;
        }
        .save-button:hover{
            background-color: #6c7696; /*Blue*/
            padding: 10px 30px 10px 30px;
            color: white;
            transition-duration: 0.7s;
            box-shadow: 0px 0px 15px #777;
        }

        /*Favourites*/
        .card {
          box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2);
          padding: 16px;
          font-family: Arial, Helvetica, sans-serif;
          text-align: center;
          background-color: white;
          margin: 15px;
          box-sizing: border-box;
        }

        .card-img {
            width: 100%;
            height: 30vh;
        }

        .lblfav{
            font-family: Georgia;
            font-size: 30px;
            margin-bottom: 2%;
            margin-top: 100px;
            text-align: center;
            color: darkgray;
        }

        .favbtn {
            border: 3px solid #eda136;
            color: #eda136;
            background-color: white;
            text-align: center;
            margin: 10px 0px 0px 0px;
        }
        .favbtn:hover {
            background-color: #eda136;
            border: 3px solid #eda136;
            color: white;
            transition-duration: 0.4s;
        }

        .propimg {
            border-radius: 5px;
        }

        .propdesc, .proplocation, .proptitle {
            font-size: 16px;
            line-height: 10px;
        }

        .propdesc ul {
            list-style-type: none;
            padding: 0px;
        }
        .propdesc ul li {
            display: inline;
        }

        .proptitle {
            line-height: 14px;
            font-family: Georgia;
            font-weight: 800;
        }
        .propprice {
            font-weight: 500;
            font-family: Calibri;
            font-size: 22px;
            background-color: #132542;
            color: white;
            text-align: center;
        }

        .falign-inline {
            display: grid;
            grid-gap: 20px;
            grid-template-columns: 2fr 3fr 1fr;
        }

        .falign-content-center {
            display: flex;
            flex-direction: column;
            justify-content: center;
         }

        .align-btn-center {
            display: flex;
            flex-direction: column;
            justify-content: center;
         }

        /*Small and Extra Small Screens*/
        @media (max-width: 768px) {
            
            /*Favourites*/
            .falign-inline{
                display: initial;
            }
            .align-btn-center {
                display: grid;
                grid-gap: 10px;
                grid-template-columns: 1fr 1fr;
            }
            .favbtn {
                margin: 0px 0px 10px 0px;
            }
            .card-img {
                display: initial;
                width: 100%;
                height: 40vh;

            }
            
            .falign-content-center{
                text-align: center;
            }
          
        }

        /*Large Screens*/
        @media (min-width: 992px) and (max-width: 1200px) {
            /*Favourites*/
             .favbtn {
                font-size: 14px;
                padding: 10px 5px 10px 5px;
             }

             .falign-inline {
                display: grid;
                grid-gap: 15px;
                grid-template-columns: 2fr 2fr 1fr;
             }
        }
        /*Extra Large Screens*/
        @media (min-width: 1200px) {

        }
        /*Medium Screens and Smaller*/
         @media (min-width: 768px) and (max-width: 992px) {

             /*Favourites*/
             .favbtn {
                font-size: 12px;
                padding: 10px 5px 10px 5px;
             }
            
             .propdesc, .proplocation, .proptitle {
                font-size: 13px;
                line-height: 10px;
             }
             .card-img {
                width: 100%;
                height: 20vh;
             }
             
             .falign-inline {
                display: grid;
                grid-gap: 15px;
                grid-template-columns: 2fr 2fr 1fr;
             }
         }

        /*User Profile*/
        .align-inline{
             display: grid; 
             grid-gap: 20px;
             grid-template-columns: 1fr 1fr;
        }
        
        #form {
            -moz-border-radius: 5px;
            -webkit-border-radius: 5px;
            border-radius: 5px;
            padding: 20px 0px 20px 0px;
            width: 100%;
            height: 100%;
        }

        .btn.multiselect{
            overflow: hidden;
            position: relative;
            text-align: center;
            font-size: 14px;
            background-color: white;
            color: black;
            padding: 8px;
            font-family: Arial, sans-serif;
            padding-left: 30px;
			padding-right: 30px;
            width: 250px!important;
        }
        .multiselect-container>li {
            width: 250px!important;
        }
        .multiselect-container>li:hover{
            background-color:lightblue;
        }

        h3 {
            text-align: left;
            font-weight: 500;
            font-family: Arial, sans-serif;
            margin-bottom: 20px;
        }

    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div id="bigdiv">

        <!-- Sidebar -->
        <div id="sidebardiv" class="sticky-bottom">
            <div id="sidebartop">
                <asp:Label ID="userfullname" runat="server" Text="Label" class="ufn"></asp:Label>
                <img src="Images/usic1.jpg" width="90" id="usic"/>
            </div>
            
            <div id="sidebarlinks">
                <p><asp:LinkButton ID="userprofbtn" OnClick="ShowUserProfile" runat="server" class="sidebarbtns"><i class="fa fa-user-o sidebaricons"></i> Edit Profile</asp:LinkButton></p>
                <hr />
                <p><asp:LinkButton ID="favpropbtn" OnClick="ShowFavourites" runat="server" class="sidebarbtns"><i class="fa fa-star-o sidebaricons"></i> Favourites</asp:LinkButton></p>
                <hr />
                <p><asp:LinkButton ID="rentresbtn" OnClick="ShowRentalResume" runat="server" class="sidebarbtns"><i class="fa fa-file-text-o sidebaricons"></i> Rental Resume</asp:LinkButton></p>   
                <hr />
            </div>
        </div>

        <div id="contentdiv">
            <!-- User Profile -->
            <div id="userprofdiv" runat="server">              
                <p class="heading">User Profile</p>
                <hr />
                <!--User profile code start-->
                <div id="form" class="offset-xl-3 col-xl-6 offset-lg-2 col-lg-8 offset-md-1 col-md-10 col-sm-12 col-12">
                
                    <h3>Personal Information</h3>

                <div>
                    <asp:Label ID="emaillabel" runat="server" text="Email:"></asp:Label>
                    <asp:Label ID="lblusremail" runat="server"></asp:Label>
                    <asp:linkbutton id="emaileditbtn" runat="server" OnClick="EmailEdit_Click">Edit</asp:linkbutton>

                    <div id="changeEmail" runat="server" Visible="false">
                        <div>
                            <asp:TextBox ID="tbemail" runat="server" Class="form-control narrower" TextMode="Email"></asp:TextBox>
                            <asp:Label ID="lblemail" runat="server" class="text-danger error-design" Display="dynamic"></asp:Label>
                            <asp:RegularExpressionValidator ID="emailexp" runat="server" ValidationGroup="update" ErrorMessage="Incorrect format" ControlToValidate="tbemail" SetFocusOnError="true"  ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" CssClass="Validation-Msg text-danger error-design" Display="Dynamic"></asp:RegularExpressionValidator> 
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ValidationGroup="update" ErrorMessage="This field is required" CssClass="text-danger error-design" ControlToValidate="tbemail"></asp:RequiredFieldValidator>
                        </div>

                        <div>
                            <asp:Label runat="server" text="Current Password"></asp:Label>                       
                            <asp:TextBox ID="currentpass" runat="server" Class="form-control  narrower" TextMode="Password"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator16" runat="server" ValidationGroup="update" ErrorMessage="This field is required" CssClass="text-danger error-design" ControlToValidate="currentpass"></asp:RequiredFieldValidator>
                            <asp:Label ID="lblError" runat="server" CssClass="text-danger error-design" Text="Password is incorrect!" Visible="false"></asp:Label>
                        </div>
                    </div>
                </div>

                <div>
                    <asp:Label ID="passwordlabel" runat="server" text="Password:"></asp:Label>
                    <asp:Label ID="lblusrpassword" runat="server" ></asp:Label>
                    <asp:linkbutton ID="passeditbtn" runat="server" OnClick="PassEdit_Click">Edit</asp:linkbutton>

                    <div id="changePass" runat="server" Visible="false">
                        <div>                          
                            <asp:Label runat="server" text="Current Password"></asp:Label>                       
                            <asp:TextBox ID="oldpass" runat="server" Class="form-control  narrower" TextMode="Password"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator18" runat="server" ValidationGroup="update" ErrorMessage="This field is required" CssClass="text-danger error-design" ControlToValidate="oldpass"></asp:RequiredFieldValidator>
                            <asp:Label ID="oldpasserror" runat="server" CssClass="text-danger error-design" Text="Password is incorrect!" Visible="false"></asp:Label>                  
                        </div>

                        <div>
                            <asp:Label ID="lblPassword" runat="server" Text="New Password"></asp:Label>
                            <asp:TextBox ID="tbNewPass" runat="server" Class="form-control  narrower" TextMode="Password" placeholder="Atleast 8 Characters"></asp:TextBox>
                            <asp:RegularExpressionValidator ID="tbpasswordexp" runat="server" ValidationGroup="update" CssClass="text-danger error-design" ErrorMessage="Password length must be between 8 to 20 characters" ControlToValidate="tbNewPass"  ValidationExpression="^[a-zA-Z0-9'@&#.\s]{8,20}$" Display="Dynamic" ></asp:RegularExpressionValidator>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ValidationGroup="update" ErrorMessage="This field is required" CssClass="text-danger error-design" ControlToValidate="tbNewPass"></asp:RequiredFieldValidator>		        
                        </div>

                        <div>
                            <asp:Label ID="lblRetypePass" runat="server" Text="Confirm Password"></asp:Label>
                            <asp:TextBox ID="tbConfirmPass" runat="server" Class="form-control narrower" TextMode="Password"></asp:TextBox>
                            <asp:CompareValidator ID="tbrepasswordcompare" runat="server" CssClass="text-danger error-design" ControlToValidate="tbConfirmPass" ControlToComapre="tbNewPass"  ValidationGroup="update" ErrorMessage="Passwords do not match" Display="Dynamic" SetFocusOnError="true" ControlToCompare="tbNewPass"></asp:CompareValidator>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator17" runat="server" ValidationGroup="update" ErrorMessage="This field is required" CssClass="text-danger error-design" ControlToValidate="tbConfirmPass"></asp:RequiredFieldValidator>
                        </div>		        
                    </div>
                </div>
                <br/><br/>
                    <div class="align-inline">              
                        <div>
                            <label>First Name</label>
                            <asp:TextBox ID="tbfname" runat="server" Class="form-control narrower" InitialValue="0"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="This field is required" CssClass="text-danger error-design" ControlToValidate="tbfname" ValidationGroup="signup" ></asp:RequiredFieldValidator>
                        </div>

                        <div>
                            <label>Last Name</label>
                            <asp:TextBox ID="tblname" runat="server" Class="form-control narrower"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ValidationGroup="signup" ErrorMessage="This field is required" CssClass="text-danger error-design" ControlToValidate="tblname"></asp:RequiredFieldValidator>
                        </div>
                    </div>

                <div id="dobdiv" runat="server">
                    <label>Date Of Birth<span class="required-sign"> *</span></label>
                    <asp:TextBox ID="tbdob" runat="server" Class="form-control narrower" TextMode="Date"></asp:TextBox>
                    <asp:RangeValidator ID="DateRangeValidator" runat="server" CssClass="text-danger error-design" Type="Date" Format="DD/MM/YYYY" ControlToValidate="tbdob" ErrorMessage="You must be between 18 to 90 years old to register" Display="Dynamic" SetFocusOnError="true"></asp:RangeValidator>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="This field is required" CssClass="text-danger error-design" ControlToValidate="tbdob" ValidationGroup="signup" EnableClientScript="True"></asp:RequiredFieldValidator>
                    <%-- <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server"  ErrorMessage="Please enter date in correct format." ControlToValidate="tbdob" SetFocusOnError="true"  ValidationExpression="(0?[1-9]|[12]\d|30|31)[^\w\d\r\n:](0?[1-9]|1[0-2])[^\w\d\r\n:](\d{4}|\d{2})" ValidationGroup="A" ForeColor="" CssClass="Validation-Msg" Display="Dynamic"></asp:RegularExpressionValidator> --%>
                </div>

                <div id="phonediv" runat="server">
                    <label>Phone  No.<span class="required-sign"> *</span></label>
                    <asp:TextBox ID="tbphone" runat="server" Class="form-control narrower" onkeypress="return isNumberKey(event)" placeholder="E.g. 03001234567"></asp:TextBox>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" CssClass="text-danger error-design"
			            ErrorMessage="Enter a valid phone no."  ControlToValidate="tbphone" Display="Dynamic" 
			            ValidationExpression="^[01]?[- .]?(\([2-9]\d{2}\)|[2-9]\d{2})[- .]?\d{3}[- .]?\d{4}$" ValidationGroup="signup"> 
                    </asp:RegularExpressionValidator>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ValidationGroup="signup" ErrorMessage="This field is required" CssClass="text-danger error-design" ControlToValidate="tbphone"></asp:RequiredFieldValidator>                
                </div>

                <div id="addressdiv" runat="server">
                    <label>Address</label>
                    <asp:TextBox ID="tbaddress" runat="server" Class="form-control narrower"  TextMode="MultiLine"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ValidationGroup="signup" ErrorMessage="This field is required" CssClass="text-danger error-design" ControlToValidate="tbaddress"></asp:RequiredFieldValidator>
                </div>

                <div id="citydiv" runat="server">
                    <label>City</label>
                    <asp:DropDownList ID="tbdcity" runat="server" Class="form-control narrower" DataSourceID="Rentrackdb" DataTextField="city_name" DataValueField="city_name">
                    </asp:DropDownList>
                    <asp:SqlDataSource ID="Rentrackdb" runat="server" ConnectionString="<%$ ConnectionStrings:RentrackdbConnectionString %>" SelectCommand="SELECT [city_name] FROM [City]"></asp:SqlDataSource>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ValidationGroup="signup" ErrorMessage="This field is required" CssClass="text-danger error-design" ControlToValidate="tbdcity"></asp:RequiredFieldValidator>
                </div>
                
                <div id="cnicdiv" runat="server" Visible="false">
                    <label>CNIC No.</label>
                    <asp:TextBox  ID="cnicnum" runat="server" Class="form-control narrower" onkeypress="return isNumberKey(event)" placeholder="E.g. 35101-1234567-8" MaxLength="15"></asp:TextBox>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" CssClass="text-danger error-design"
			            ErrorMessage="Enter CNIC in correct format"  ControlToValidate="cnicnum" Display="Dynamic" 
			            ValidationExpression="^[0-9+]{5}-[0-9+]{7}-[0-9]{1}$" ValidationGroup="update"> 
                    </asp:RegularExpressionValidator>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ValidationGroup="update" ErrorMessage="This field is required" CssClass="text-danger error-design" ControlToValidate="cnicnum"></asp:RequiredFieldValidator>
                </div>

                <div id="areadealdiv" runat="server" Visible="false">
                    <div>
                        <label>Areas you deal in</label>
                    </div>
                    <div class="align-content-center">
                        <div>
                            <asp:ListBox ID="agentcitylist" runat="server" SelectionMode="Multiple" CssClass="form-control narrower"></asp:ListBox>
                        </div>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" ValidationGroup="update" ErrorMessage="This field is required" CssClass="text-danger error-design" ControlToValidate="agentcitylist"></asp:RequiredFieldValidator>
                    </div>
                </div>

                <div id="agencyinfo" runat="server" Visible="false">
                    <h3>Agency Information</h3>

			        <div>
                        <label>Company Name</label>
                        <asp:TextBox ID="agencyname" runat="server" Class="form-control narrower" ></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator11" runat="server" ErrorMessage="This field is required" CssClass="text-danger error-design" ControlToValidate="agencyname" ValidationGroup="signup" ></asp:RequiredFieldValidator>
                    </div>

		            <div class="align-inline">
                        <div>
                            <label>Company Email</label>
                            <asp:TextBox  ID="agencyemail" runat="server" Class="form-control narrower" TextMode="Email" ></asp:TextBox>
                            <asp:Label ID="lblagencyemail" runat="server" class="text-danger error-design" Display="dynamic"></asp:Label>
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ValidationGroup="signup" ErrorMessage="Incorrect format" ControlToValidate="agencyemail" SetFocusOnError="true"  ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" CssClass="Validation-Msg text-danger error-design" Display="Dynamic"></asp:RegularExpressionValidator> 
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator12" runat="server" ValidationGroup="signup" ErrorMessage="This field is required" CssClass="text-danger error-design" ControlToValidate="agencyemail"></asp:RequiredFieldValidator>
                        </div>
             
                        <div>
                            <label>Company Phone  No.</label>
                            <asp:TextBox  ID="agencyphone" runat="server" Class="form-control narrower" onkeypress="return isNumberKey(event)" placeholder="E.g. 0217654321"></asp:TextBox>
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator4" runat="server" CssClass="text-danger error-design"
			                    ErrorMessage="Enter a valid phone no."  ControlToValidate="agencyphone" Display="Dynamic" 
			                    ValidationExpression="(\d{3})\d{7}" ValidationGroup="signup"> 
                            </asp:RegularExpressionValidator>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator13" runat="server" ValidationGroup="signup" ErrorMessage="This field is required" CssClass="text-danger error-design" ControlToValidate="agencyphone"></asp:RequiredFieldValidator>
                        </div>
                    </div>

                    <div>
                        <label>Company Address</label>
                        <asp:TextBox ID="agencyaddress" runat="server" ValidationGroup="address" Class="form-control narrower" TextMode="MultiLine"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator14" runat="server" ValidationGroup="signup" ErrorMessage="This field is required" CssClass="text-danger error-design" ControlToValidate="agencyaddress"></asp:RequiredFieldValidator>
                    </div>

                    <div>
                        <label>Areas the Company deals in</label>
                        <div class="align-content-center">
                            <div>
                                <asp:ListBox ID="agencycitylist" runat="server" SelectionMode="Multiple" CssClass="form-control narrower"></asp:ListBox>
                            </div>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator15" runat="server" ValidationGroup="signup" ErrorMessage="This field is required" CssClass="text-danger error-design" ControlToValidate="agencycitylist"></asp:RequiredFieldValidator>
                        </div>           
                    </div>
                </div>

                    <div class="align-inline">
                        <div style="text-align: center">
                            <asp:Button ID="usrcancel" runat="server" Text="Cancel" class="btn save-button" OnClick="Cancel" ValidationGroup="cancel"/>
                        </div>

                        <div style="text-align: center">
                            <asp:Button ID="usrsave" runat="server" Text="Save" class="btn save-button" OnClick="SaveUserInfo" ValidationGroup="update"/>
                        </div>
                    </div>
                <!--User profile code end-->
            </div>
                </div>

            <!-- Favourite Properties -->
            <div id="favpropdiv" runat="server">
                <p class="heading">Favourite Properties</p>
                <hr />
                <!--Fav prop code start-->
                
                <asp:Repeater ID="rptrfav" runat="server" onitemcommand="Repeater1_ItemCommand">
                    <ItemTemplate>                        
                        <div class="card">
                            <div class="falign-inline">
                                <div class="falign-content-center">
                                    <img class="card-img" src="Images/PropertyImages/<%#Eval("property_id")%>/<%#Eval("image_name")%>.jpg" alt="<%#Eval("image_name") %>"/>
                                </div>
                                 
                                <div class="card-body falign-content-center">                                   
                                    <h5 class="card-title proptitle"><%#Eval("property_title") %></h5>
                                    <p class="propprice">PKR <%#Eval("property_price") %></p>
                                    <p class="card-text ">
                                        <div class="propdesc">
                                            <ul>
                                                <li><%#Eval("no_of_bedrooms")%> Bed |</li>
                                                <li><%#Eval("no_of_bathrooms")%> Bath |</li>
                                                <li><%#Eval("property_area") %> Sqft</li>
                                            </ul>
                                        </div>
                                    </p>
                                    <p class="proplocation"><%#Eval("area") %></p>
                                </div>
                            
                                <div class="align-btn-center">
                                    <div>
                                        <a href="#" class="btn btn-primary favbtn">View Property</a>
                                    </div>

                                    <div>
                                        <asp:LinkButton ID="unfavbtn" runat="server" CssClass="btn btn-primary favbtn" CommandName="Delete" CommandArgument='<%#Eval("fav_prop_id") %>'><i class="fa fa-heart" ></i> Unfavourite</asp:LinkButton>
                                    </div>
                                </div>
                                
                            </div>              
                        </div>

                </ItemTemplate>
              </asp:Repeater>
                 <asp:Label ID="lblfavid" runat="server" CssClass="lblfav align-content-center"></asp:Label>
                <!--Fav prop code end-->
            </div>

            <!-- Rental Resume -->
            <div id="rentresdiv" runat="server">
                <p class="heading">Rental Resume</p>
                <hr />

                <div style="text-align: center">
                    <p class="narrower">The information in the rental resume is not public. It will be included with rental inquires, if you choose to tick the checkbox at the time.</p>
                    <span class="alert-success narrower" style="padding: 5px 10px 5px 10px" id="msg" runat="server">
                        <i class="fa fa-check"></i>
                        <asp:Label ID="rentresmsg" runat="server" Text=""></asp:Label>
                    </span>
                </div>
                <div id="rentresform" class="offset-lg-3 col-lg-6">
                    <label class="form-heading">Move-in Date</label><br />
                    <asp:DropDownList ID="ddlmoveindate" runat="server" CssClass="form-control narrower">
                        <asp:ListItem Value="Unspecified">Unspecified</asp:ListItem>
                        <asp:ListItem Value="As soon as possible">As soon as possible</asp:ListItem>
                        <asp:ListItem Value="Within the next week">Within the next week</asp:ListItem>
                        <asp:ListItem Value="Within the next month">Within the next month</asp:ListItem>
                        <asp:ListItem Value="Let's negotiate">Let's negotiate</asp:ListItem>
                    </asp:DropDownList>

                    <label class="form-heading">No. of Tenants</label><br />
                    <asp:DropDownList ID="ddltenants" runat="server" CssClass="form-control narrower">
                        <asp:ListItem Value="Unspecified">Unspecified</asp:ListItem>
                        <asp:ListItem Value="1 Adult">1 Adult</asp:ListItem>
                        <asp:ListItem Value="2 Adults">2 Adults</asp:ListItem>
                        <asp:ListItem Value="3+ Adults">3+ Adults</asp:ListItem>
                    </asp:DropDownList>

                    <label class="form-heading">Moving From</label><br />
                    <asp:DropDownList ID="areaddl" runat="server" class="form-control narrower"></asp:DropDownList>
                
                    <label class="form-heading">Do you have pets?</label><br />
                    <asp:RadioButtonList ID="rblpets" runat="server" RepeatDirection="Horizontal" >
                        <asp:ListItem Value="1">&nbsp;Yes</asp:ListItem>
                        <asp:ListItem Value="0" style="margin-left: 20px"  Selected="True">&nbsp;No</asp:ListItem>
                    </asp:RadioButtonList>

                    <label class="form-heading">Do you smoke?</label><br />
                    <asp:RadioButtonList ID="rblsmoke" runat="server" RepeatDirection="Horizontal" >
                        <asp:ListItem Value="1">&nbsp;Yes</asp:ListItem>
                        <asp:ListItem Value="0" style="margin-left: 20px"  Selected="True">&nbsp;No</asp:ListItem>
                    </asp:RadioButtonList>

                    <label class="form-heading">Employer</label><br />
                    <asp:TextBox ID="tbemployer" runat="server" class="form-control narrower" placeholder="Company/Organization name"></asp:TextBox>                   

                    <label class="form-heading">Job Title</label><br />
                    <asp:TextBox ID="tbjob" runat="server" class="form-control narrower"></asp:TextBox>
                    <br />

                    <div style="text-align: center">
                        <asp:Button ID="saverentres" runat="server" Text="Save" class="btn save-button" OnClick="SaveResume"/>
                    </div>

                    <asp:Repeater ID="rptr" runat="server"></asp:Repeater>
                    <br />
                </div>
            </div>

        </div>
    </div>
</asp:Content>

