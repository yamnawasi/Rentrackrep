<%@ Page Title="" Language="C#" MasterPageFile="~/HeaderandFooter.master" AutoEventWireup="true" CodeFile="AgentProfile.aspx.cs" Inherits="AgentProfile" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <script>
        $(document).ready(function () {
            if ( window.history.replaceState ) {
                window.history.replaceState( null, null, window.location.href );
            }    
        });
 
        function isNumberKey(evt)
        {
             var charCode = (evt.which) ? evt.which : evt.keyCode;
             if (charCode > 31 && (charCode < 48 || charCode > 57))
                return false;    
             return true;
        }
    </script>

    <style>
        #maindiv{
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            background-color: #f5f5f5;
            padding-bottom: 50px;
        }
        #gitdiv{
            box-shadow: 0px 0px 15px #aaa;
            margin-top: 50px;
            margin-bottom: 50px;
            padding: 50px 70px;
            border-radius: 5px;          
            background-color: white;
        }
        .submitbtn{
            color: white;
            background-color: #f2934f; /*Orange-ish*/
            padding: 10px 35px 10px 35px;
        }
            .submitbtn:hover{
                background-color: #555;
                color: white;
                transition-duration: 0.7s;
                box-shadow: 0px 2px 10px #aaa;
            }
        .ap-heading{            
            text-align: center;
            font-weight: 300;
            font-size: 30px;
            font-size: 25px;
            color: #f2934f; /*Orange-ish*/
        }
        #git-heading{
            margin-bottom: 20px;
        }
        #agent-det-div{
            box-shadow: 0px 0px 15px #aaa;
            margin-top: 30px;
            margin-bottom: 10px;
            padding: 40px 70px;
            background-color: white;
            border-radius: 5px;
        }
        #ai-heading{
            margin-bottom: 20px;
        }
        #agent-name{
            text-align: center;
            font-size: 30px;
            font-family: Georgia;
            margin-top: 50px;
        }
        .agheading{
            font-weight: 500;
            line-height: 1px;
        }
        .aginfo{
            padding-left: 20px;
            line-height: 1px;
        }
        #agency-link{
            color: black;
        }
        #agency-link:hover{           
            text-decoration: none;
            color: #677893; /*Steel Blue*/
            transition-duration: 0.6s;
        }
        .error-design{
            color: red;
            font-family: Calibri;
            font-size: 14px;
            font-weight: 600;
        }
        .required-sign{
            color: red;
            font-size: 20px;
        }
        
        .narrower{
            font-size: 14px;
        }

        @media (max-width: 576px) {
            #git-div, #agent-det-div {
                border-radius: 0px;
                box-shadow: none;
            }
        }
    </style>

</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div id="maindiv">
        <asp:Repeater ID="rptragentinfo" Runat="Server">
            <ItemTemplate>
                <h4  id="agent-name"><%# Eval ("f_name") %> <%# Eval ("l_name") %></h4>
        
                <div id="agent-det-div" class="col-lg-6 col-md-8 col-sm-10 col-12">
                    <p class="ap-heading" id="ai-heading">Agent Information</p>
                    <hr />
                    <div style="display: flex; flex-direction: column; align-items: center;">
                    <div>
                        <p><i class="fa fa-building agicons"></i> <span class="agheading">Agency: </span><a href="Agency Profile.aspx?agency_id=<%# Eval ("agency_id") %>" id="agency-link" title="View Agency Page"><span id="agency-name" class="aginfo"><%# Eval ("agency_name") %></span></a></p>           
                        <p><i class="fa fa-phone agicons"></i> <span class="agheading">Phone: </span><span id="phone-no" class="aginfo"><%# Eval ("phone_no") %></span></p>
                        <p><i class="fa fa-envelope agicons"></i> <span class="agheading">Email: </span><span id="email" class="aginfo"><%# Eval ("email") %></span></p>
                        <p><i class="fa fa-map-marker agicons"></i> <span class="agheading">Locations: </span><span id="areas" class="aginfo"><%# Eval ("city_name") %></span></p>
                    </div>
                    </div>
                </div>
            </ItemTemplate>
        </asp:Repeater>
            <div id="showgit" runat="server"  class="col-lg-6 col-md-8 col-sm-10 col-12" >
                <div id="gitdiv">
                    <h3 class="ap-heading" id="git-heading">Get in Touch</h3>
                    
                    <label>Full Name<span class="required-sign"> *</span></label>
                    <asp:TextBox ID="tbname" runat="server" class="form-control narrower areafield"></asp:TextBox> 
                    <asp:RequiredFieldValidator ID="rfvname" runat="server" ErrorMessage="This field is required" CssClass="text-danger error-design" ControlToValidate="tbname" ValidationGroup="git-group"></asp:RequiredFieldValidator>
                    <br />

                    <label>Email<span class="required-sign"> *</span></label>
                    <asp:TextBox ID="tbemail" runat="server" class="form-control narrower areafield" disabled="disabled"></asp:TextBox> 
                    <asp:RequiredFieldValidator ID="rfvemail" runat="server" ErrorMessage="This field is required" CssClass="text-danger error-design" ControlToValidate="tbemail" ValidationGroup="git-group" Display="Dynamic"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="revEmail" runat="server" ErrorMessage="Please enter a valid email address" ControlToValidate="tbemail" SetFocusOnError="true"  ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" CssClass="text-danger error-design" Display="Dynamic"></asp:RegularExpressionValidator>                          
                    <br />

                    <label>Phone Number<span class="required-sign"> *</span></label>
                    <asp:TextBox ID="tbphone" runat="server" class="form-control narrower areafield" onkeypress="return isNumberKey(event)" ></asp:TextBox> 
                    <asp:RequiredFieldValidator ID="rfvphone" runat="server" ErrorMessage="This field is required" CssClass="text-danger error-design" ControlToValidate="tbphone" ValidationGroup="git-group"></asp:RequiredFieldValidator>
                    <br />

                    <label>Message<span class="required-sign"> *</span></label>
                    <asp:TextBox ID="tbmsg" TextMode="MultiLine" runat="server" class="form-control narrower areafield" placeholder="Your message here..."></asp:TextBox>                   
                    <asp:RequiredFieldValidator ID="rfvmessage" runat="server" ErrorMessage="This field is required" CssClass="text-danger error-design" ControlToValidate="tbmsg"  ValidationGroup="git-group"></asp:RequiredFieldValidator>

                    <br />
                    <div style="text-align: center">
                        <asp:Button ID="gitbtn" runat="server" Text="Send" Class="submitbtn btn"  ValidationGroup="git-group" OnClick="Sendbtn_Click"/>
                    </div>
                </div>  
           </div>
    </div>
</asp:Content>

