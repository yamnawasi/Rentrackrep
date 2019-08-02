<%@ Page Title="" Language="C#" MasterPageFile="~/HeaderandFooter.master" AutoEventWireup="true" CodeFile="propertyviewpage.aspx.cs" Inherits="propertyviewpage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
<link href="css/bootstrap.min.css" rel="stylesheet" />
   <link href="css/bootstrap-grid.css" rel="stylesheet" />
    <link href="css/bootstrap-grid.min.css" rel="stylesheet" />
    <style>
        #maindiv{
            background-color: #fff;
            padding-top:50px;
            padding-left:35px;
            
        }
       
        #desc{
            max-width:450px;
            align-content:center;
            padding:0px 40px 40px 60px;
           
        }

        #imgp{
            width:30%;
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
   
          width:250px;
          align-content:center;
          float:right;
         
     }
    
  
     .btne{
             height: 50px;
             width:85px;
            
            padding:0 20px ;
            margin-top:10px;
            margin-left:35%;
            margin-bottom:20px;
			align-content:center;
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

          #myCarousel img {

width: auto;

height: 225px;

max-height: 225px;

}
		 
     </style>
      <script> 
        $(document).ready(function () {
        });
        function isNumberKey(evt)
        {
             var charCode = (evt.which) ? evt.which : evt.keyCode;
             if (charCode > 31 && (charCode < 48 || charCode > 57))
                return false;    
             return true;
        }
    </script> 

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

<div class="row" id="maindiv">
    <div class="row">
   

           <div id="demo" class="carousel slide col-lg-4 col-md-3 col-sm-3 col-4" data-ride="carousel">

  <!-- Indicators -->
  <ul class="carousel-indicators">
    <li data-target="#demo" data-slide-to="0" class="active"></li>
    <li data-target="#demo" data-slide-to="1"></li>
    <li data-target="#demo" data-slide-to="2"></li>
  </ul>

  <!-- The slideshow -->
     <div class="carousel-inner" role="listbox">

      <asp:Repeater ID="imagerepeater" Runat="Server">
          <ItemTemplate>
              <div class="carousel-item active">
                <img class="card-img-top" src="Images/PropertyImages/<%#Eval("property_id")%>/<%#Eval("image_name")%>.jpg" alt="<%#Eval("image_name") %>"/>
              </div>
   <!-- <div class="carousel-item">
     
        <img src="Images/PropertyImages/3/2%20Room%20Apartment-3-1.jpg" />
    </div>
    <div class="carousel-item">
    <img src="Images/PropertyImages/1/House%20for%20Sale-1.jpg" />
    </div>  -->
          </ItemTemplate>
      </asp:Repeater>
  </div>

  <!-- Left and right controls -->
  <a class="carousel-control-prev" href="#demo" data-slide="prev">
    <span class="carousel-control-prev-icon"></span>
  </a>
  <a class="carousel-control-next" href="#demo" data-slide="next">
    <span class="carousel-control-next-icon"></span>
  </a>

</div>


         


        <div id="desc" class=" col-lg-4 col-md-3 col-sm-3 col-4">
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
        
     </div>
        <div id="divDet5" class=" col-lg-4 col-md-3 col-sm-3 col-4" >
           
             <h1>contact owner/agent</h1>

                <div>
                    <label>Name</label>
                    <asp:TextBox ID="tbfname" runat="server" Class="form-control narrower" InitialValue="0"></asp:TextBox>
                    </div>
                <div>
                    <label>Email</label>
                    <asp:TextBox ID="buyemail" runat="server" Class="form-control narrower" TextMode="Email"></asp:TextBox>
                </div>
                <div>
                    <label>Phone  No.</label>
                    <asp:TextBox ID="tbphone" runat="server" Class="form-control narrower" onkeypress="return isNumberKey(event)" placeholder="E.g. 03001234567"></asp:TextBox>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" CssClass="text-danger error-design"
			            ErrorMessage="Enter a valid phone no."  ControlToValidate="tbphone" Display="Dynamic" 
			            ValidationExpression="^[01]?[- .]?(\([2-9]\d{2}\)|[2-9]\d{2})[- .]?\d{3}[- .]?\d{4}$" ValidationGroup="signup"> 
                    </asp:RegularExpressionValidator>
               </div>

                 <div id="message"  runat="server">
                   
                    <label>Message</label>
                    <asp:TextBox ID="msg" runat="server" class="form-control narrower areafield"></asp:TextBox> 
                    
                 </div>

               <div >
                   <asp:Button   class="btn   btne " ID="email" runat="server" Text="email"  />
                   </div>
    </div>

    
    
  </div>
</div>

 


</asp:Content>

