<%@ Page Title="" Language="C#" MasterPageFile="~/HeaderandFooter.master" AutoEventWireup="true" CodeFile="propertylist.aspx.cs" Inherits="propertylist" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">

    <link href="css/bootstrap.min.css" rel="stylesheet" />
   <link href="css/bootstrap-grid.css" rel="stylesheet" />
    <link href="css/bootstrap-grid.min.css" rel="stylesheet" />
    <style>
       
        
         #filterdiv
         {
      padding-top:20px;
      padding-bottom:20px;
       background-color:#11172D ; /*Dark blue*/
      
      height:75px;

         }

        #filterdiv  .buttonClass
        { font-family: Georgia;
          font-size: 15px;
          font-weight: 200;
          color:whitesmoke;
          margin-left:30px;
          text-decoration: none;
          border: none;
          background-color: none;
        }
        #filterdiv .buttonClass:hover
        {    
            border: none;
            
            color: white;
            box-shadow: 0px 0px 20px #808080;
            transition-duration: 0.6s;
            text-decoration: none
        }
         .dropdowndesign{
            width: 10%;
          
            margin-left:20px;
           
            
        }
         .search-btn{
            font-family: Georgia;
            padding: 4px 20px ;
            margin-left:20px;
            font-size: 15px;
            font-weight: 200;
           background-color: #e58457; /*Orange*/
        }
            .search-btn:hover{
                transition-duration: 0.6s;
                 background-color: #b8ac96; /*Orange*/
            }
            .propertydisplay{
                margin-top:0px;
               /* box-shadow: 0px 0px 6px #aaa;*/
                
                background-color: white;
                border-radius: 5px;
                

            }


            #error-div{
                max-height:500px;
                margin-bottom:500px;
            }
        .empty-message{
            color: gray;
            text-align: center;
            font-size:20px;
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
        }.sub-heading{
            font-size: 25px;
            font-weight: 300;
            color: #f2934f; /*Orange-ish*/
            margin-top: 20px;
        }
    
   #styleimg{
       align-content:center;
       float:right;
   }
    #desc-div{
            max-width: 600px;
          /*margin: 50px 50px 20px 50px;*/  /*ye padding sahi krni ha*/
            margin:50px 0px 20px 300px;
           

        }


        </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

<div class="container-fluid" id="maincontrol">
      <div class="row justify-content-md-center sticky-top col-lg-15 col-sm-15 col-md-15" id="filterdiv">
        
               <asp:linkbutton runat="server" Text="All " class="buttonClass" OnClick="AllButton_Click"/>
               <asp:linkbutton runat="server"  Text="Rent"  class="buttonClass" OnClick="RentButton_Click"/>
               <asp:linkbutton runat="server"  Text="Sell" class="buttonClass" OnClick="BuyButton_Click"/>
              
               <asp:linkbutton runat="server" Text="House" class="buttonClass" OnClick="HouseButton_Click"/>
               <asp:linkbutton runat="server" Text="Appartment" class="buttonClass" OnClick="AppartmentButton_Click"/>
               <asp:linkbutton runat="server" Text="Lower portion" class="buttonClass" OnClick="LowerPortionButton_Click"/>
               <asp:linkbutton runat="server" Text="Upper portion" class="buttonClass" OnClick="UpperPortionButton_Click"/>
          
          
               <asp:DropDownList ID="cityddl" runat="server" class="dropdowndesign narrower form-control"></asp:DropDownList>
               <asp:DropDownList ID="areadd" runat="server" class="dropdowndesign narrower form-control"></asp:DropDownList>

               <asp:Button ID="Searchbtn" runat="server" Text="Search" class="btn btn-dark search-btn" OnClick="CitySearchbtn_Click"/>
          
         
        </div>
         
        
         <div class="propertydisplay row" id="desc-div"> 
      <asp:Repeater ID="rptrProperty" runat="server">
      <ItemTemplate>
                 <a style="text-decoration:none;" href="propertyviewpage.aspx?property_id=<%#Eval("property_id") %>">
                   
                    <div class="col-lg-16 col-sm-16 col-md-16"   >
                        <img src="Images/PropertyImages/<%#Eval("property_id") %>/<%#Eval("image_name") %>.jpg " class="img-thumbnail" id="styleimg" alt="<%#Eval("image_name") %>">
                         <div class="caption">
                            <h1 class="protitle"><%#Eval("property_title") %></h1>
                             <span class="proPrice">PKR<%#Eval("property_price") %></span>
                              <h1 class="sub-heading">Property Description</h1>
                            <h1 class="protype  propdet"> Property Type:<%#Eval("property_type") %></h1>
                            <h1 class="propurpose  propdet">Purpose:<%#Eval("property_purpose") %></h1>
                             <h1 class="proparea propdet">Land Area: <%#Eval("property_area")%> Sq. Ft</h1>
                             <h1 class="desctitle propdet">Description:</h1>
                            <p class="propdesctext"><%#Eval("property_desc") %></p>
                            

                        </div>
                   </div>
                     
                 </a>
               
       </ItemTemplate>
      </asp:Repeater>
              </div>

          
           <div style="text-align: center" class="col" id="error-div">
                    <asp:label runat="server" text="" ID="propemptymsg" class="empty-message"></asp:label>
                </div>
         
      </div>

</asp:Content>

