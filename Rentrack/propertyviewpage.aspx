<%@ Page Title="" Language="C#" MasterPageFile="~/HeaderandFooter.master" AutoEventWireup="true" CodeFile="propertyviewpage.aspx.cs" Inherits="propertyviewpage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
<link href="css/bootstrap.min.css" rel="stylesheet" />
   <link href="css/bootstrap-grid.css" rel="stylesheet" />
    <link href="css/bootstrap-grid.min.css" rel="stylesheet" />
    <style>
        #maindiv{
            padding-top:50px;
            padding-left:35px;
            
        }
       
        #desc{
            max-width:450px;
            align-content:center;
            padding:0px 40px 40px 60px;
        }
        .pronameview{
            font-size:20px;
            line-height:17px;
            font-family:sans-serif;
            font-weight:600;
            color:#696e80;
        }
        h1{
            font-size:20px;
            line-height:17px;
            font-family:sans-serif;
        }
         .proPrice {
       font-size: 14px;
       line-height: 17px;
       font-family: sans-serif;
       font-weight: 600;
       }
    
  .divDet1,  .divDet2 ,.divDet3, .divDdet4{
        
        border-bottom:1px dashed #D5d6D8;
        margin-bottom:20px;
    }
    
    .h1size{
        font-weight:600;
        font-size:30px;

    }
 
     .norooms ,.nobathrooms ,.sqyard{
           font-size:15px;
            line-height:17px;
            font-family:sans-serif;
            font-weight:600;
            color:#696e80;

    }
     #divDet5{
          padding-left:40px;
          padding-top:0px;
          width:250px;
          align-content:center;
         
     }
     #div6{

         align-items:baseline;
     }
  
     .btn{
             height: 50px;
             width:80px;
            padding: 0 20px;
			text-align: center;
            background: #eda136;
            font-size: 16px;
            font-weight: 300;
            line-height: 50px;
            color: #fff;
            -webkit-border-radius: 4px; border-radius: 4px;
            text-shadow: none;
           -webkit-box-shadow: none; box-shadow: none;
            -o-transition: all .3s; -moz-transition: all .3s; -webkit-transition: all .3s;  transition: all .3s;
        
        } .btn:hover { opacity: 0.7; color: black; }
		 .btn:active { outline: 0; opacity: 0.6; color: #fff; -moz-box-shadow: none; -webkit-box-shadow: none; box-shadow: none; }
		 
     </style>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

<div class="row" id="maindiv">
    <div class="col-md-5">
       <div  class="img-thumbnail" >
        <!-- Image carousel -->

        
                     <img src="Images/PropertyImages/25/House-25.jpg"/ class="img-thumbnail" >
        </div>


    <div id="desc" class="col-md-7">
        <div class="divDet1">
           <h1 class="pronameview"> 400 sq yd house</h1>
           <span class="proPrice">RS 12,000</span>
         </div>
         <div class="divDet2">
             <h1 class="h1size">size</h1>
             <div>
               <h1 class="norooms"> No of rooms:</h1>
                <h1 class="nobathrooms"> No of bathrooms:</h1>
                 <h1 class="sqyard"> sq yards:</h1>
             </div>
         </div>

         <div class="divDet3">
           <h5>Description</h5>
           <p>a small house</p>

         </div>
         
        <div class="divDet4">

            <h5>add to fav</h5>
        </div>
     </div>



    <div id="divDet5" >

        <h1>contact owner/agent</h1>

        <asp:Button  class="btn" ID="Button1" runat="server" Text="Call" />
        <asp:Button   class="btn" ID="Button2" runat="server" Text="Email" />
    </div>
  
    <div id="div6">
        <h1>similar properties</h1>
    </div>
 </div>
 


</asp:Content>

