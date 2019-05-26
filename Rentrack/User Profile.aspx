<%@ Page Title="User Profile" Language="C#" MasterPageFile="~/HeaderandFooter.master" AutoEventWireup="true" CodeFile="User Profile.aspx.cs" Inherits="User_Profile" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">

    <script>
        $(document).ready(function () {
            if ( window.history.replaceState ) {
                window.history.replaceState( null, null, window.location.href );
            }
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


                <!--User profile code end-->
            </div>

            <!-- Favourite Properties -->
            <div id="favpropdiv" runat="server">
                <p class="heading">Favourite Properties</p>
                <hr />
                <!--Fav prop code start-->


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

