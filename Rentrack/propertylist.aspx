<%@ Page Title="" Language="C#" MasterPageFile="~/HeaderandFooter.master" AutoEventWireup="true" CodeFile="propertylist.aspx.cs" Inherits="propertylist" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">

    <link href="css/bootstrap.min.css" rel="stylesheet" />
   <link href="css/bootstrap-grid.css" rel="stylesheet" />
    <link href="css/bootstrap-grid.min.css" rel="stylesheet" />
    <style>
        
        #maindiv{

            padding-top:50px;
        }
        .protype {
        font-size: 15px;
        font-weight: 600;
        line-height: 15px;
        text-transform: uppercase;
        font-family: sans-serif;
       }

         .propurpose {
         font-size: 13px;
         line-height: 17px;
         font-family: sans-serif;
         }

       .proPrice {
       font-size: 14px;
       line-height: 17px;
       font-family: sans-serif;
       font-weight: 600;
       }
    

    

        </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

<div class="container-fluid">
      <div class="row" id="maindiv">
      <asp:Repeater ID="rptrProperty" runat="server">
      <ItemTemplate>
                <div class="col-sm-3 col-md-3">
                 
                    <div >
                        <img src="Images/PropertyImages/<%#Eval("property_id") %>/<%#Eval("image_name") %>.jpg " class="img-thumbnail" alt="<%#Eval("image_name") %>">
                        <div class="caption">
                            <div class="protitle"><%#Eval("property_title") %></div>
                            <div class="protype"><%#Eval("property_type") %></div>
                            <div class="propurpose"><%#Eval("property_purpose") %></div>
                            <div class="prodescription"><%#Eval("property_desc") %></div>
                            <div class="proPrice"><%#Eval("property_price") %></div>

                        </div>

                        <div>
                        <asp:Button runat="server" Text="Call"></asp:Button>
                        <asp:Button runat="server" Text="Email"></asp:Button>
                            <button><a href="propertyviewpage.aspx">view</a></button>
                        </div>
                           
                    </div>
                     
                </div>
       </ItemTemplate>
      </asp:Repeater>
      </div> 
</div>

</asp:Content>

