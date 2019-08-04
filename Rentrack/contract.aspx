<%@ Page Title="" Language="C#" MasterPageFile="~/HeaderandFooter.master" AutoEventWireup="true" CodeFile="contract.aspx.cs" Inherits="contract" %>

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

        $(function () {
            $('[id*=lndlrdcnicnum]').on('keypress', function () {
                var number = $(this).val();
                if (number.length == 5) {
                    $(this).val($(this).val() + '-');
                }
                else if (number.length == 13) {
                    $(this).val($(this).val() + '-');
                }
            });
        });

            $(function () {
            $('[id*=tntcnicnum]').on('keypress', function () {
                var number = $(this).val();
                if (number.length == 5) {
                    $(this).val($(this).val() + '-');
                }
                else if (number.length == 13) {
                    $(this).val($(this).val() + '-');
                }
            });
        });

        function IsValidationGroupMatch(control, validationGroup) {
            if ((typeof (validationGroup) == "undefined") || (validationGroup == null)) {
                return true;
            }
            var controlGroup = "";
            if (typeof (control.validationGroup) == "string") {
                controlGroup = control.validationGroup;
            }

            //return (controlGroup == validationGroup);

            var controlValidationGroups = controlGroup.split(",");
            return (controlValidationGroups.indexOf(validationGroup) > -1);
        }
        
    </script>

    <style>
        #header{
            position: relative;
        }
        #centerdiv {
            padding: 0px;
            box-shadow: 0px 0px 15px #AAA;
            border-radius: 5px;

        }
        #topdiv{
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
            padding: 5% 15% 15% 15%;
        }

        .narrower{
            font-size: 14px;
        }
        .subheading {
            color: orange;
            margin-top: 5px;
            text-transform: uppercase;
            font-family: Calibri;
            font-weight: 700;
            font-size: 20px;
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
        .required-sign{
            color: red;
            font-size: 20px;
        }
        .align-three-inline{
             display: grid; 
             grid-gap: 10px;
             grid-template-columns: 1fr 1fr 1fr;
        }
        .align-two-inline{            
             display: grid; 
             grid-gap: 10px;
             grid-template-columns: 1fr 1fr;
        }
        .inlinefields{
            margin-right: 10px;
        }

        .remind{
            font-size: 16px;
            font-weight: 300;
            color: black;          
            margin: 5px;
            font-family: Arial, sans-serif;
        }

        /*Extra Small Screen*/
        @media (max-width: 576px) {
            #topdiv {
                border-top-left-radius: 0px;
                border-top-right-radius: 0px;
                padding: 30px;
            }
            .align-two-inline{
                 grid-template-columns: none;
            }

        }

        /*Small Screen*/
        @media (max-width: 768px){
            
            .align-three-inline{
                grid-template-columns: none;
                grid-gap: 0px;
            }
        }

        /*Medium Screen*/
        @media (max-width: 992px){

        }

        @media (min-width: 577px) {
            #topdiv {
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
            
            <div id="topdiv">
                <!--Heading -->
                <p id="heading">Contract Information</p>
            </div>

            <div id="formdiv">
                <p class="subheading"><span><i class="fa fa-user-o" style="font-size: 25px"></i></span>  Landlord</p>

                <!--Landlord details -->
                <div class="align-two-inline">              
                    <div>
                        <label>First Name</label>
                        <asp:TextBox ID="tblndfname" runat="server" Class="form-control narrower" InitialValue="0"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator18" runat="server" ErrorMessage="This field is required" CssClass="text-danger error-design" ControlToValidate="tblndfname" ValidationGroup="lndlrd" ></asp:RequiredFieldValidator>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="This field is required" CssClass="text-danger error-design" ControlToValidate="tblndfname" ValidationGroup="generate" ></asp:RequiredFieldValidator>
                    </div>

                    <div>
                        <label>Last Name</label>
                        <asp:TextBox ID="tblndlname" runat="server" Class="form-control narrower"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator19" runat="server" ErrorMessage="This field is required" CssClass="text-danger error-design" ControlToValidate="tblndlname" ValidationGroup="lndlrd" ></asp:RequiredFieldValidator>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ValidationGroup="generate" ErrorMessage="This field is required" CssClass="text-danger error-design" ControlToValidate="tblndlname"></asp:RequiredFieldValidator>
                    </div>
                </div>

                <div  class="align-two-inline">
                    <div>
                        <label>Son/Daughter of</label>
                        <asp:TextBox ID="lndlrdparent" runat="server" Class="form-control narrower"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator20" runat="server" ErrorMessage="This field is required" CssClass="text-danger error-design" ControlToValidate="lndlrdparent" ValidationGroup="lndlrd" ></asp:RequiredFieldValidator>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ValidationGroup="generate" ErrorMessage="This field is required" CssClass="text-danger error-design" ControlToValidate="lndlrdparent"></asp:RequiredFieldValidator>
                    </div>
                    
                    <div>
                        <label>CNIC No.</label>
                        <asp:TextBox  ID="lndlrdcnicnum" runat="server" Class="form-control narrower" onkeypress="return isNumberKey(event)" placeholder="E.g. 35101-1234567-8" MaxLength="15"></asp:TextBox>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" CssClass="text-danger error-design"
			                ErrorMessage="Enter CNIC in correct format"  ControlToValidate="lndlrdcnicnum" Display="Dynamic" 
			                ValidationExpression="^[0-9+]{5}-[0-9+]{7}-[0-9]{1}$" ValidationGroup="lndlrd"> 
                        </asp:RegularExpressionValidator>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator21" runat="server" ErrorMessage="This field is required" CssClass="text-danger error-design" ControlToValidate="lndlrdcnicnum" ValidationGroup="lndlrd"></asp:RequiredFieldValidator>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ValidationGroup="generate" ErrorMessage="This field is required" CssClass="text-danger error-design" ControlToValidate="lndlrdcnicnum"></asp:RequiredFieldValidator>
                    </div>
                </div>

                <div>
                    <label>Landlord's Address</label>
                    <asp:TextBox ID="tblndaddress" runat="server" Class="form-control narrower"  TextMode="MultiLine"></asp:TextBox>
                     <asp:RequiredFieldValidator ID="RequiredFieldValidator23" runat="server" ErrorMessage="This field is required" CssClass="text-danger error-design" ControlToValidate="tblndaddress" ValidationGroup="lndlrd"></asp:RequiredFieldValidator>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ValidationGroup="generate" ErrorMessage="This field is required" CssClass="text-danger error-design" ControlToValidate="tblndaddress"></asp:RequiredFieldValidator>
                </div>

                <div>
                    <label>Rent Property Address</label>
                    <asp:TextBox ID="tbrntaddress" runat="server" Class="form-control narrower"  TextMode="MultiLine"></asp:TextBox>
                     <asp:RequiredFieldValidator ID="RequiredFieldValidator24" runat="server" ErrorMessage="This field is required" CssClass="text-danger error-design" ControlToValidate="tbrntaddress" ValidationGroup="lndlrd"></asp:RequiredFieldValidator>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ValidationGroup="generate" ErrorMessage="This field is required" CssClass="text-danger error-design" ControlToValidate="tbrntaddress"></asp:RequiredFieldValidator>
                </div>

                <hr />

                <!--Tenant details -->
                <p class="subheading"><span><i class="fa fa-user-o" style="font-size: 25px"></i></span>  Tenant</p>
                <div class="align-two-inline">              
                    <div>
                        <label>First Name</label>
                        <asp:TextBox ID="tbtntfname" runat="server" Class="form-control narrower" InitialValue="0"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator25" runat="server" ErrorMessage="This field is required" CssClass="text-danger error-design" ControlToValidate="tbtntfname" ValidationGroup="tnt"></asp:RequiredFieldValidator>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="This field is required" CssClass="text-danger error-design" ControlToValidate="tbtntfname" ValidationGroup="generate" ></asp:RequiredFieldValidator>
                    </div>

                    <div>
                        <label>Last Name</label>
                        <asp:TextBox ID="tbtntlname" runat="server" Class="form-control narrower"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator26" runat="server" ErrorMessage="This field is required" CssClass="text-danger error-design" ControlToValidate="tbtntlname" ValidationGroup="tnt"></asp:RequiredFieldValidator>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ValidationGroup="generate" ErrorMessage="This field is required" CssClass="text-danger error-design" ControlToValidate="tbtntlname"></asp:RequiredFieldValidator>
                    </div>
                </div>

                <div  class="align-two-inline">
                    <div>
                        <label>Son/Daughter of</label>
                        <asp:TextBox ID="tntparent" runat="server" Class="form-control narrower"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator27" runat="server" ErrorMessage="This field is required" CssClass="text-danger error-design" ControlToValidate="tntparent" ValidationGroup="tnt"></asp:RequiredFieldValidator>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" ValidationGroup="generate" ErrorMessage="This field is required" CssClass="text-danger error-design" ControlToValidate="tntparent"></asp:RequiredFieldValidator>
                    </div>

                    <div>
                        <label>CNIC No.</label>
                        <asp:TextBox  ID="tntcnicnum" runat="server" Class="form-control narrower" onkeypress="return isNumberKey(event)" placeholder="E.g. 35101-1234567-8" MaxLength="15"></asp:TextBox>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" CssClass="text-danger error-design"
			                ErrorMessage="Enter CNIC in correct format"  ControlToValidate="tntcnicnum" Display="Dynamic" 
			                ValidationExpression="^[0-9+]{5}-[0-9+]{7}-[0-9]{1}$" ValidationGroup="tnt"> 
                        </asp:RegularExpressionValidator>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator28" runat="server" ErrorMessage="This field is required" CssClass="text-danger error-design" ControlToValidate="tntcnicnum" ValidationGroup="tnt"></asp:RequiredFieldValidator>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator11" runat="server" ValidationGroup="generate" ErrorMessage="This field is required" CssClass="text-danger error-design" ControlToValidate="tntcnicnum"></asp:RequiredFieldValidator>
                    </div>
                </div>

                <div>
                    <label>Tenant's Address</label>
                    <asp:TextBox ID="tntaddress" runat="server" Class="form-control narrower"  TextMode="MultiLine"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator30" runat="server" ErrorMessage="This field is required" CssClass="text-danger error-design" ControlToValidate="tntaddress" ValidationGroup="tnt"></asp:RequiredFieldValidator>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator13" runat="server" ValidationGroup="generate" ErrorMessage="This field is required" CssClass="text-danger error-design" ControlToValidate="tntaddress"></asp:RequiredFieldValidator>
                </div>

                <hr />

                <!--Finance details -->
                <p class="subheading"><span><i class="fa fa-money" style="font-size: 25px"></i></span>  Finance</p>

                <div  class="align-two-inline">
                    <div>
                        <label>Rent (in PKR)</label>
                        <asp:TextBox ID="tbrent" runat="server" Class="form-control narrower" onkeypress="return isNumberKey(event)"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator31" runat="server" ErrorMessage="This field is required" CssClass="text-danger error-design" ControlToValidate="tbrent" ValidationGroup="lndlrd"></asp:RequiredFieldValidator>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator14" runat="server" ValidationGroup="generate" ErrorMessage="This field is required" CssClass="text-danger error-design" ControlToValidate="tbrent" Display="Dynamic"></asp:RequiredFieldValidator>
                    </div>

                    <div>
                        <label>Fixed Deposit (in PKR)</label>
                        <asp:TextBox ID="tbfxd" runat="server" Class="form-control narrower" onkeypress="return isNumberKey(event)"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator34" runat="server" ErrorMessage="This field is required" CssClass="text-danger error-design" ControlToValidate="tbfxd" ValidationGroup="lndlrd"></asp:RequiredFieldValidator>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator15" runat="server" ValidationGroup="generate" ErrorMessage="This field is required" CssClass="text-danger error-design" ControlToValidate="tbfxd"></asp:RequiredFieldValidator>
                    </div>
                </div>
                <div>
                    <label>Rent Pay Day</label>
                    <asp:TextBox ID="rntpay" runat="server" Class="form-control narrower"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator35" runat="server" ErrorMessage="This field is required" CssClass="text-danger error-design" ControlToValidate="rntpay" ValidationGroup="lndlrd"></asp:RequiredFieldValidator>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator36" runat="server" ErrorMessage="This field is required" CssClass="text-danger error-design" ControlToValidate="rntpay" ValidationGroup="generate" EnableClientScript="True"></asp:RequiredFieldValidator>
                </div>
                <hr />

                <!--Contract Lifecycle details -->
                <p class="subheading"><span><i class="fa fa-refresh" style="font-size: 25px"></i></span>  Lifecycle</p>

                <div  class="align-two-inline">
                    <div>
                        <label>Start Date</label>
                        <asp:TextBox ID="tbstart" runat="server" Class="form-control narrower" TextMode="Date"></asp:TextBox>
                        <asp:TextBox ID="txttbstart" Visible="false" Class="form-control narrower" runat="server"></asp:TextBox>
                        <asp:RangeValidator ID="RangeValidator1" runat="server" CssClass="text-danger error-design" Type="Date" Format="DD/MM/YYYY" ControlToValidate="tbstart" ErrorMessage="The date can not be in the past or out of range" Display="Dynamic" SetFocusOnError="true"></asp:RangeValidator>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator32" runat="server" ErrorMessage="This field is required" CssClass="text-danger error-design" ControlToValidate="tbstart" ValidationGroup="lndlrd"></asp:RequiredFieldValidator>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator16" runat="server" ErrorMessage="This field is required" CssClass="text-danger error-design" ControlToValidate="tbstart" ValidationGroup="generate" EnableClientScript="True"></asp:RequiredFieldValidator>
                    </div>

                    <div>
                        <label>End Date</label>
                        <asp:TextBox ID="tbend" runat="server" Class="form-control narrower" TextMode="Date"></asp:TextBox>
                        <asp:TextBox ID="tbendtxt" Visible="false" Class="form-control narrower" runat="server"></asp:TextBox>
                        <asp:RangeValidator ID="DateRangeValidator" runat="server" CssClass="text-danger error-design" Type="Date" Format="DD/MM/YYYY" ControlToValidate="tbend" ErrorMessage="The date can not be in the past or out of range" Display="Dynamic" SetFocusOnError="true"></asp:RangeValidator>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator33" runat="server" ErrorMessage="This field is required" CssClass="text-danger error-design" ControlToValidate="tbend" ValidationGroup="lndlrd"></asp:RequiredFieldValidator>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator17" runat="server" ErrorMessage="This field is required" CssClass="text-danger error-design" ControlToValidate="tbend" ValidationGroup="generate" EnableClientScript="True"></asp:RequiredFieldValidator>
                    </div>
                </div> 
                <div>
                    <label>Contract Life</label>
                </div>
                <div>
                    <asp:DropDownList ID="Cntrctlife" runat="server" Class="form-control narrower">
                        <asp:ListItem Value="2 months">2 months</asp:ListItem>
                        <asp:ListItem Value="11 months">11 months</asp:ListItem>
                        <asp:ListItem Value="yearly">yearly</asp:ListItem>
                    </asp:DropDownList>
                </div>

                <div style="width: 100%; text-align: center; margin-top: 30px">
                    <asp:Button ID="cancelbtn" runat="server" Text="Cancel" class="btn btn-light cancelbtn" CausesValidation="false"/>
                    <asp:Button ID="sndtnt" runat="server" Text="Send Tenant" class="btn submitbtn finbtn" ValidationGroup="lndlrd" OnClick="Sndtnt"/>
                    <asp:Button ID="sndlnd" runat="server" Visible="true" Text="Send Landlord" class="btn submitbtn finbtn" ValidationGroup="tnt" OnClick="Sndlnd"/>
                    <asp:Button ID="submitbtn" runat="server" Text="Generate" class="btn submitbtn finbtn" ValidationGroup="generate" OnClick="Generate_Click"/>
                </div>

            </div>

        </div>
        </div>
</asp:Content>


