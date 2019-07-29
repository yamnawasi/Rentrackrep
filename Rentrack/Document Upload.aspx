<%@ Page Title="Document Upload" Language="C#" MasterPageFile="~/HeaderandFooter.master" AutoEventWireup="true" CodeFile="Document Upload.aspx.cs" Inherits="Document_Upload" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style>
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
        #bigdiv{
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
        }
        #du-heading{
            font-size: 30px;
            font-weight: 300;
            text-align: center;
        }
        #uploaddiv{
            margin: 100px;
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
        #du-label{
            margin: 20px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div id="bigdiv">
        <div id="uploaddiv">            
            <h2 id="du-heading">Upload Tenancy Agreement</h2>
            <hr />
            <label id="du-label">Kindly upload a PDF version of your signed tenancy agreement.</label>
            <asp:FileUpload ID="futa" CssClass="form-control" runat="server" style="height: 43px;"/>
            <asp:RegularExpressionValidator ID="revta" runat="server" ErrorMessage="Please upload as a .pdf file" CssClass="text-danger error-design" ControlToValidate="futa" ValidationExpression="(.*?)\.(pdf|PDF)$"></asp:RegularExpressionValidator>
            <br />
            <div style="text-align: center">
                <asp:Button ID="submitrev" runat="server" Text="Submit" Class="submitbtn btn"/>
            </div>
        </div>
    </div>
</asp:Content>

