<%@ Page Title="" Language="C#" MasterPageFile="~/HeaderandFooter.master" AutoEventWireup="true" CodeFile="ResourceDisplay.aspx.cs" Inherits="ResourceDisplay" %>

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
        .lbltitle{

        }
        </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div id="maindiv">
                  <div id="centerdiv">
                              <p><span class="lbltitle">Service Required: Plumbing</span> </p>
                              <p><span class="lbltitle">Date: 06-08-2019</span> </p>
                              <p><span class="lbltitle">Description: Plumbing services needed on the second floor.</span> </p>

                      <div>
                        <asp:LinkButton ID="accbtn" Class="btn trbtn accbtn" runat="server" OnClick="Accept_click" CausesValidation="false"><i class="fa fa-check"></i> Accept</asp:LinkButton>
                        <asp:LinkButton ID="rejbtn" Class="btn trbtn rejbtn" runat="server" OnClick="Reject_click" CausesValidation="false"><i class="fa fa-times"></i> Reject</asp:LinkButton>
                      </div>

                      
                  </div>
        
    </div>
</asp:Content>

