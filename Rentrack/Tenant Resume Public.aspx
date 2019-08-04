<%@ Page Title="" Language="C#" MasterPageFile="~/HeaderandFooter.master" AutoEventWireup="true" CodeFile="Tenant Resume Public.aspx.cs" Inherits="Tenant_Resume_Public" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style>

        #centerdiv {
            padding: 0px;
            box-shadow: 0px 0px 15px #AAA;
            border-radius: 5px;
            margin-top: 5%;
            margin-bottom: 5%;
        }
        .formdiv {
            width: 100%;
            padding: 6% 10% 5% 10%;
        }
        .leftmargin {               
            margin-left: 20%;
        }
        .heading{
            width: 100%;
            background-color: #11172D ; /*Dark blue*/
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            padding: 5% 0% 5% 0%;
        }
        .title{
            font-size: 40px;
            font-weight: 300;
            font-family: Calibri;
            text-align: center;
            color: orange;
        }
        .names{
            color: orange;
        }
        .usrbold{
            font-weight: 500;
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
        .align-content-center{
            text-align: center;
        }
        .align-inline{
             display: grid; 
             grid-gap: 20px;
             grid-template-columns: 1fr 1fr;
        }
        .accbtn{
            background-color: #2ca344; /*Green*/
            color: white;
            padding: 10px 20px;
        }
        .rejbtn{
            background-color: #d61c1c; /*Red*/
            color: white;
            padding: 10px 20px;
        }
        .accbtn:hover, .rejbtn:hover{
            background-color: #668; /*Red*/
            box-shadow: 0px 0px 10px #888;
            transition-duration: 0.6s;
            color: white;
        }
        .trbtn{
            margin: 20px;
        }
        .lblnores{
            font-family: Georgia;
            font-size: 30px;
            margin-bottom: 2%;
            margin-top: 100px;
            text-align: center;
            color: darkgray;
        }
        /*Extra Small Screen*/
        @media (max-width: 576px) {
            #centerdiv {
                margin-top: 0%;
                margin-bottom: 0%;
            }
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div style="width:100%">
        <div class="offset-lg-2 col-lg-8 offset-sm-1 col-sm-10 col-12 container-fluid" id="centerdiv">

            <div class="heading">    
                <h3 class="title align-content-center">Tenant Resume</h3>
            </div>

                <div class="align-content-center">
                    <asp:Label ID="lbltntid" runat="server" CssClass="lblnores align-content-center"></asp:Label>
                </div>

                <div id="usrdiv" class="formdiv">
                    <asp:Repeater ID="rptrusr" runat="server">
                        <ItemTemplate>    
                
                            <div class="align-content-center">
                                <h5 class="align-content-center names"><%#Eval("f_name")%> <%#Eval("l_name")%></h5>
                            </div>

                            <br />

                            <div class="leftmargin">
                                <div class="align-inline ">
                                <label class="usrbold">Move-in Date</label>
                                <p class="useradd"><%#Eval("move_in_date")%></p>
                                </div>

                                <div class="align-inline">
                                <label class="usrbold">No. of Tenants</label>
                                <p class="useradd"><%#Eval("number_of_tenants")%></p>
                                </div>
                                    
                                <div class="align-inline">
                                <label class="usrbold">Moving From</label>
                                <p class="usrdob"><%#Eval("move_in_from")%></p>
                                </div>

                                <div class="align-inline">
                                <label class="usrbold">Do you have any pets?</label>
                                <p class="usrphone"><%#Eval("pets")%></p>
                                </div>

                                <div class="align-inline">
                                <label class="usrbold">Do you smoke?</label>
                                <p class="usremail"><%#Eval("smoking")%></p>
                                </div>

                                <div class="align-inline">
                                <label class="usrbold">Employer</label>
                                <p class="usremail"><%#Eval("employer")%></p>
                                </div>

                                <div class="align-inline">
                                <label class="usrbold">Job Title</label>
                                <p class="usremail"><%#Eval("job_title")%></p>
                                </div>
                            </div>

                                
                            </ItemTemplate>
                        </asp:Repeater>
                            <br />   
                        <div class="align-content-center">
                            <asp:LinkButton ID="accbtn" Class="btn trbtn accbtn" runat="server" OnClick="Accept_click"><i class="fa fa-check"></i> Accept</asp:LinkButton>
                            <asp:LinkButton ID="rejbtn" Class="btn trbtn rejbtn" runat="server" OnClick="Reject_click"><i class="fa fa-times"></i> Reject</asp:LinkButton>
                                
                        </div>               
                </div>    
        </div>
    </div>
</asp:Content>

