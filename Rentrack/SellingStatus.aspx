<%@ Page Title="" Language="C#" MasterPageFile="~/HeaderandFooter.master" AutoEventWireup="true" CodeFile="SellingStatus.aspx.cs" Inherits="SellingStatus" %>

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
            width: 100%;
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
            background-color: #f8f8f8;
        }
        #centerdiv{
            width: 50%;
            margin-top: 100px;
            margin-bottom: 100px;
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
            box-shadow: 0px 0px 10px #999;
            background-color: white;
            padding: 50px;
            border-radius: 5px;
        }
        .accbtn{
            background-color: #2ca344; /*Green*/
            color: white;
            padding: 10px 20px;
            margin: 20px;
        }
        .rejbtn{
            background-color: #d61c1c; /*Red*/
            color: white;
            padding: 10px 20px;
            margin: 20px;
        }
        .accbtn:hover, .rejbtn:hover{
            background-color: #668; /*Red*/
            box-shadow: 0px 0px 10px #888;
            transition-duration: 0.6s;
            color: white;
        }
        #ques{
            font-size: 20px;
            font-weight: 300;
        }
        .warningdesign{
           padding: 5px 10px;
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
        #detailsdiv{
            
        }
        .submitbtn{
            color: white;
            background-color: #f2934f; /*Orange-ish*/
            padding: 10px 35px 10px 35px;
            margin: 20px 0px 20px 40px;
        }
            .submitbtn:hover{
                background-color: #555;
                color: white;
                transition-duration: 0.7s;
                box-shadow: 0px 2px 10px #aaa;
            }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div id="maindiv">
                  <div id="centerdiv">
                        <p id="ques">Has property, <asp:Label ID="proptitlelbl" runat="server" Text=""></asp:Label> been sold to <asp:Label ID="buyernamelbl" runat="server" Text=""></asp:Label>?</p>
                        <span class="alert-warning warningdesign" runat="server" id="formmsg"><i class="fa fa-info-circle"></i> Please select carefully.</span>
                      <br />

                      <div>
                        <asp:LinkButton ID="accbtn" Class="btn trbtn accbtn" runat="server" OnClick="Accept_click" CausesValidation="false"><i class="fa fa-check"></i> Yes</asp:LinkButton>
                        <asp:LinkButton ID="rejbtn" Class="btn trbtn rejbtn" runat="server" OnClick="Reject_click" CausesValidation="false"><i class="fa fa-times"></i> No</asp:LinkButton>
                      </div>

                      <br />
                      <div runat="server" id="detailsdiv">
                          <label>Selling Price (PKR)<span class="required-sign"> *</span></label>
                          <asp:TextBox ID="tbprice" runat="server" class="form-control narrower areafield" onkeypress="return isNumberKey(event)" placeholder="0"></asp:TextBox>                   
                          <asp:RequiredFieldValidator ID="RequiredFieldValidatortbprice" runat="server" ErrorMessage="This field is required" CssClass="text-danger error-design" ControlToValidate="tbprice" ValidationGroup="dets"></asp:RequiredFieldValidator>
                          <br>

                          <label>Date Sold<span class="required-sign"> *</span></label>
                            <asp:TextBox ID="tbdate" runat="server" Class="form-control narrower" TextMode="Date"></asp:TextBox>
                            <asp:TextBox ID="txttbstart" Visible="false" Class="form-control narrower" runat="server"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator32" runat="server" ErrorMessage="This field is required" CssClass="text-danger error-design" ControlToValidate="tbdate" ValidationGroup="dets" Display="Dynamic"></asp:RequiredFieldValidator>
                     <br>
                        <asp:LinkButton ID="submitbtn" Class="btn submitbtn" runat="server" OnClick="submit_click" ValidationGroup="dets">Submit</asp:LinkButton>

                      
                      </div>
                  </div>
        
    </div>
</asp:Content>

