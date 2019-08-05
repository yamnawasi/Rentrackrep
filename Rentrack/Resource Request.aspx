<%@ Page Title="" Language="C#" MasterPageFile="~/HeaderandFooter.master" AutoEventWireup="true" CodeFile="Resource Request.aspx.cs" Inherits="Resource_Request" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">

    <title>Request Resource</title>

    <script>
        $(document).ready(function () {
            if ( window.history.replaceState ) {
                window.history.replaceState( null, null, window.location.href );
            }
        });
       
    </script>

    <style>
        #centerdiv {
            padding: 0px;
            box-shadow: 0px 0px 15px #AAA;
            border-radius: 5px;

        }
        #headdiv{
            width: 100%;
            display: flex;
            align-items: center;
            justify-content: center;
            padding: 5% 0% 0% 0%;
        }
        #heading{
            font-size: 30px;
            font-weight: 300;
            font-family: Calibri;
        }
        #formdiv {
            width: 100%;
            padding: 5% 20% 15% 20%;
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
        .cancelbtn{
            padding: 10px 35px 10px 35px;
            color: black;
            background-color: #bbb;
        }
        .cancelbtn:hover{
            transition-duration: 0.7s;
            box-shadow: 0px 2px 10px #aaa;
        }
        .error-design{
            color: red;
            font-family: Calibri;
            font-size: 14px;
            font-weight: 600;
        }
        .align-inline{            
             display: grid; 
             grid-gap: 10px;
             grid-template-columns: 1fr 1fr;
        }
        .remind{
            font-size: 16px;
            font-weight: 300;
            color: black;          
            margin: 5px;
            font-family: Arial, sans-serif;
        }
        .rad{
            margin: 10px 15px 10px 15px;
        }
        .align-content-center{
            text-align: center;
         }
        /*Extra Small Screen*/
        @media (max-width: 576px) {
            #headdiv {
                border-top-left-radius: 0px;
                border-top-right-radius: 0px;
                padding: 30px;
            }
            #formdiv {
            width: 100%;
            padding: 5% 15% 15% 15%;
            }
        }

        /*Small Screen*/
        @media (max-width: 768px){
            
            .align-three-inline{
                grid-template-columns: none;
                grid-gap: 0px;
            }
            #formdiv {
            width: 100%;
            padding: 5% 15% 15% 15%;
            }
        }

        /*Medium Screen*/
        @media (max-width: 992px){

        }

        @media (min-width: 577px) {
            #headdiv {
                border-top-left-radius: 5px;
                border-top-right-radius: 5px;
            }
            #centerdiv {
                margin-top: 40px;
                margin-bottom: 40px;
            }
        }

    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div style="width:100%">
        <div class="offset-lg-2 col-lg-8 offset-sm-1 col-sm-10 col-12 container-fluid" id="centerdiv">
            
            <div id="headdiv">
                <!--Heading -->
                <p id="heading">Resource Request</p>
            </div>

            <div id="formdiv">
            
                <div>
                    <label>Event Date</label>
                    <asp:TextBox ID="tbdate" runat="server" Class="form-control narrower" TextMode="Date"></asp:TextBox>
                    <asp:RangeValidator ID="DateRangeValidator" runat="server" CssClass="text-danger error-design" Type="Date" Format="DD/MM/YYYY" ControlToValidate="tbdate" ErrorMessage="The date has already passed" Display="Dynamic"></asp:RangeValidator>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator17" runat="server" ErrorMessage="This field is required" CssClass="text-danger error-design" ControlToValidate="tbdate" ValidationGroup="req" EnableClientScript="True"></asp:RequiredFieldValidator>
                </div>    
                
                <div>
                    <label>Tenant/Landlord Email</label>
                    <asp:TextBox ID="tbemail" runat="server" Class="form-control narrower" TextMode="Email"></asp:TextBox>
                    <asp:Label ID="lblemail" runat="server" class="text-danger error-design" Display="dynamic" Visible="false"></asp:Label>
                    <asp:RegularExpressionValidator ID="emailexp" runat="server" ValidationGroup="req" ErrorMessage="Incorrect format" ControlToValidate="tbemail" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" CssClass="Validation-Msg text-danger error-design" Display="Dynamic"></asp:RegularExpressionValidator> 
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ValidationGroup="req" ErrorMessage="This field is required" CssClass="text-danger error-design" ControlToValidate="tbemail"></asp:RequiredFieldValidator>
                </div>

                <div>
                    <div>
                        <label>Service</label>
                    </div>
                    <div>
                        <asp:DropDownList ID="serv" runat="server" Class="form-control narrower">
                            <asp:ListItem Value="Plumbing">Plumbing</asp:ListItem>
                            <asp:ListItem Value="Painting">Painting</asp:ListItem>
                            <asp:ListItem Value="Inspection">Inspection</asp:ListItem>
                            <asp:ListItem Value="Other">Other</asp:ListItem>
                        </asp:DropDownList>
                    </div>
                     <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ValidationGroup="req" ErrorMessage="This field is required" CssClass="text-danger error-design" ControlToValidate="serv"></asp:RequiredFieldValidator>
                </div>

                <div>
                    <label>Description</label>
                    <asp:TextBox ID="tbdes" runat="server" Class="form-control narrower"  TextMode="MultiLine" Placeholder="Add Event details here" Rows="4"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ValidationGroup="req" ErrorMessage="This field is required" CssClass="text-danger error-design" ControlToValidate="tbdes"></asp:RequiredFieldValidator>
                </div>

            

                <div style="width: 100%; text-align: center; margin-top: 30px">
                        <asp:Button ID="cancelbtn" runat="server" Text="Cancel" class="btn btn-light cancelbtn" OnClick="Cancel_btn"/>
                        <asp:Button ID="submitbtn" runat="server" Text="Send" class="btn submitbtn" ValidationGroup="req" OnClick="Send_btn"/>
                </div>

            </div>

        </div>
        </div>
</asp:Content>


