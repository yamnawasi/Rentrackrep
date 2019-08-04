<%@ Page Title="" Language="C#" MasterPageFile="~/HeaderandFooter.master" AutoEventWireup="true" CodeFile="propertyviewpage.aspx.cs" Inherits="propertyviewpage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
<link href="css/bootstrap.min.css" rel="stylesheet" />
   <link href="css/bootstrap-grid.css" rel="stylesheet" />
    <link href="css/bootstrap-grid.min.css" rel="stylesheet" />

    
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
            align-items: center;
            justify-content: center;
            background-color: #f8f8f8;
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

        #carousel-div{
            max-width: 600px;
            margin: 50px 50px 20px 50px;

        }
        .align-two-vert{
            display: flex;
            flex-direction: column;
        }
        .align-two-hori{
            display: flex;
            flex-direction: row;
        }
        #formdiv{
            box-shadow: 0px 0px 15px #aaa;
            margin-top: 50px;
            margin-bottom: 10px;
            padding: 50px;
            background-color: white;
            border-radius: 5px;
            min-width: 450px;
            max-height: 600px;
        }
        #main-heading{
            font-family: Georgia;
            font-size: 25px;
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
        #desc{
            margin: 10px 50px 50px 50px;
            box-shadow: 0px 0px 10px #aaa;
            padding: 50px;
            background-color: white;
            border-radius: 5px;
        }
		.proptitle{
            font-size: 30px;
            font-family: Georgia;
		}
        .proPrice{
            font-size: 25px;
            padding: 2px 20px;
            color: white;
            background-color: #132542; /*Dark Blue*/
            border-radius: 50px;
        }
        .propdet{
            font-size: 16px;           
        }
        .protype{
            margin-top: 10px;
        }
        .propdesctext{
            box-shadow: 0px 0px 5px #aaa;
            padding: 10px 10px 40px 10px;
            border-radius: 5px;
            margin-bottom: 40px;
        }
        .roomdesc{
            font-size: 16px;
            font-weight: 400;
        }
        .sub-heading{
            font-size: 25px;
            font-weight: 300;
            color: #f2934f; /*Orange-ish*/
            margin-top: 20px;
        }
        .nokitchen{
            margin-bottom: 40px;
        }
     </style>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

<div id="maindiv">
    <div >
      <div class="align-two-hori">
       <div class="align-two-vert">
       <div class="carousel slide" data-ride="carousel" id="carousel-div">
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
                  <div class="carousel-item <%#GetActiveClass(Container.ItemIndex) %>">
                    <img class="card-img-top img-fluid img-thumbnail" src="Images/PropertyImages/<%#Eval("property_id")%>/<%#Eval("image_name")%>.jpg" alt="<%#Eval("image_name") %>" />
                  </div>
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
    
     <!--Property Description-->
     <div id="desc" class="">
         <asp:Repeater ID="rptr" Runat="Server">
          <ItemTemplate>
              <div class="divDet1">
                  <h1 class="proptitle"> <%#Eval("property_title")%></h1>
                   <span class="proPrice">PKR <%#Eval("property_price")%></span>
                  <h1 class="sub-heading">Property Description</h1>
                   <h1 class="protype propdet">Property Type: <%#Eval("property_type")%></h1>
                   <h1 class="propurpose propdet">Purpose: <%#Eval("property_purpose")%></h1>
                   <h1 class="proparea propdet">Land Area: <%#Eval("property_area")%> Sq. Ft</h1>
                   <h1 class="desctitle propdet">Description:</h1>
                   <p class="propdesctext"><%#Eval("property_desc")%></p>
              </div>
              <hr />
              <div class="divDet2">
                   <h1 class="h1size sub-heading">Room Description</h1>
                   <div>                
                     <h1 class="nooffloors roomdesc"><i class="fa fa-building"></i> No of Floors: <%#Eval("no_of_floors")%></h1>
                     <h1 class="norooms roomdesc"><i class="fa fa-bed"></i> No of Bedrooms: <%#Eval("no_of_bedrooms")%></h1>
                     <h1 class="nobathrooms roomdesc"><i class="fa fa-bath"></i> No of Bathrooms: <%#Eval("no_of_bathrooms")%></h1>
                     <h1 class="noofhalls roomdesc"><i class="fa fa-home"></i> No of Halls: <%#Eval("no_of_hall")%></h1>
                     <h1 class="nokitchen roomdesc"><i class="fa fa-coffee"></i> No of Kitchens: <%#Eval("no_of_kitchen")%></h1>
                  </div>
             </div>
              <hr />
             <div class="propLocation">
                     <h5 class="sub-heading">Location</h5>
                      <h1 class="locarea propdet"><%#Eval("subarea")%></h1>
                      <h1 class="locarea propdet"><%#Eval("area")%></h1>
                      <h1 class="propcity propdet"><%#Eval("city_name")%></h1>
                      <h1 class="procountry propdet"><%#Eval("country")%></h1>
                      <h1 class="proprov propdet"><%#Eval("province_state")%></h1>

             </div>
          </ItemTemplate>
        </asp:Repeater>
     </div>
    

    </div>

    <!--Contact Owner Form-->
    <div runat="server" id="showform">
    <div id="formdiv" class="">
           
             <h1 id="main-heading">Contact Owner/Agent</h1>

                    <label class="narrower">Full Name<span class="required-sign"> *</span></label>
                    <asp:TextBox ID="tbname" runat="server" class="form-control narrower areafield"></asp:TextBox> 
                    <asp:RequiredFieldValidator ID="rfvname" runat="server" ErrorMessage="This field is required" CssClass="text-danger error-design" ControlToValidate="tbname" ValidationGroup="contact-group"></asp:RequiredFieldValidator>
                    <br />

                    <label class="narrower">Email<span class="required-sign"> *</span></label>
                    <asp:TextBox ID="tbemail" runat="server" class="form-control narrower areafield" disabled="disabled"></asp:TextBox> 
                    <asp:RequiredFieldValidator ID="rfvemail" runat="server" ErrorMessage="This field is required" CssClass="text-danger error-design" ControlToValidate="tbemail" ValidationGroup="contact-group" Display="Dynamic"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="revEmail" runat="server" ErrorMessage="Please enter a valid email address" ControlToValidate="tbemail" SetFocusOnError="true"  ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" CssClass="text-danger error-design" Display="Dynamic"></asp:RegularExpressionValidator>                          
                    <br />

                    <label class="narrower">Phone Number<span class="required-sign"> *</span></label>
                    <asp:TextBox ID="tbphone" runat="server" class="form-control narrower areafield" onkeypress="return isNumberKey(event)" ></asp:TextBox> 
                    <asp:RequiredFieldValidator ID="rfvphone" runat="server" ErrorMessage="This field is required" CssClass="text-danger error-design" ControlToValidate="tbphone" ValidationGroup="contact-group"></asp:RequiredFieldValidator>
                    <br />

                    <label class="narrower">Message<span class="required-sign"> *</span></label>
                    <asp:TextBox ID="tbmsg" TextMode="MultiLine" runat="server" class="form-control narrower areafield" placeholder="Your message here..."></asp:TextBox>                   
                    <asp:RequiredFieldValidator ID="rfvmessage" runat="server" ErrorMessage="This field is required" CssClass="text-danger error-design" ControlToValidate="tbmsg"  ValidationGroup="contact-group"></asp:RequiredFieldValidator>

               <div style="text-align: center">
                   <asp:Button  class="btn submitbtn" ID="email" runat="server" Text="Email"  OnClick="Sendbtn_Click" ValidationGroup="contact-group"/>
               </div>
        </div>

       </div>
     

        </div>

    
    
  </div>
</div>

 


</asp:Content>

