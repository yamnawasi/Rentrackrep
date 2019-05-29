<%@ Page Title="" Language="C#" MasterPageFile="~/HeaderandFooter.master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="propertylist" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <!--Owl Carousel-->
    <link rel="stylesheet" href="OwlCarousel2-2.3.4\docs\assets\owlcarousel\assets\owl.carousel.min.css"/>
    <script src="OwlCarousel2-2.3.4/docs/assets/owlcarousel/owl.carousel.min.js"></script>
    <link rel="stylesheet" href="OwlCarousel2-2.3.4\docs\assets\owlcarousel\assets\owl.theme.default.min.css"/>
    
    <!--Font Awesome-->
    <link rel="stylesheet" href="Content/font-awesome.min.css"/>

    <title>Rentrack</title>

    <script>
        $(document).ready(function () {
            $("#buybutton").css({ "color": "#eda136", "border-bottom": "3px solid #eda136" });
            $("#buynewprops").show();
            $("#rentfeaturedprops").hide();

            $('.owl-carousel').owlCarousel({
                loop: true,
                margin: 10,
                responsiveClass: true,
                navText: [
                    '<i class="left-arrow fa fa-angle-left" aria-hidden="true"></i>',
                    '<i class="right-arrow fa fa-angle-right" aria-hidden="true"></i>'
                ],
                dots: true,
                responsive: {
                    0: {
                        items: 1,
                        nav: true
                    },
                    600: {
                        items: 2,
                        nav: true
                    },
                    1000: {
                        items: 3,
                        nav: true,
                        loop: false
                    }
                }
            });
           
            if ( window.history.replaceState ) {
                window.history.replaceState( null, null, window.location.href );
            }
            
        });




        function showRentOptions() {
            $("#rentbutton").css({ "color": "#eda136", "border-bottom": "3px solid #eda136" });
            $("#buybutton").css({ "color": "#b2b2b2", "border-bottom": "3px solid #b2b2b2" });
            $("#buybutton").hover(function () {
                $(this).css({ "color": "#eda136", "border-bottom": "3px solid #eda136" });
                /*},function () {
                    $(this).css({ "color": "#b2b2b2", "border-bottom": "3px solid #b2b2b2" });*/
            });
            $("#buynewprops").hide();
            $("#rentfeaturedprops").show();
        }
        function showBuyOptions() {
            $("#buybutton").css({ "color": "#eda136", "border-bottom": "3px solid #eda136" });
            $("#rentbutton").css({ "color": "#b2b2b2", "border-bottom": "3px solid #b2b2b2" });
            $("#rentbutton").hover(function () {
                $(this).css({ "color": "#eda136", "border-bottom": "3px solid #eda136" });
            });
            $("#buynewprops").show();
            $("#rentfeaturedprops").hide();

        }


    </script>

    <style>
        /*filters*/
        #bigdiv {
            display: flexbox;
            flex-direction: column;
            padding: 0px;
            margin: 0px;
            height:100%;
        }
        .filterdiv {
            background-image:url("Images/6.jpg");
            background-size: cover; 
            background-repeat: no-repeat;  
            background-attachment: fixed;
            padding: 90px 0px 0px 0px;
            width:100%;
            height: 500px;
            display:flex;
            flex-direction: column;
            text-align: center;
        }
        
        #slogan {
            color: white;
            font-family: Georgia;
            font-size: 30px;
        }
        #buyorrent {
            list-style-type: none;
            padding: 0px;
            margin-bottom: 20px;
        }
        #fildiv {
            background: rgba(0, 0, 0, 0.5);
            padding: 50px;
        }
        #buybutton, #rentbutton {
            border-bottom: 3px solid #b2b2b2;
            font-family: Calibri;
            display: inline-block;
            font-size: 22px;
            color: #b2b2b2; /*Gray*/
            padding-top: 8px;
            padding-bottom: 8px;
        }
            #buybutton:hover, #rentbutton:hover {
                border-bottom: 3px solid #eda136;
                color: #eda136;
                transition-duration: 0.6s;
                cursor: pointer;
            }
        #search-bar{
            /*border-top-left-radius: 50px;
            border-bottom-left-radius: 50px;*/
        }
        #search-button {
            background-color: #eda136; /*orange*/
            color: white;
            border: none;
        }

        /*Featured Properties Sliders*/
        #buynewprops, #rentfeaturedprops {
            max-width: 900px;
            text-align: center;
            margin-left: auto;
            margin-right: auto;
            margin-top: 50px;
        }
        .left-arrow {
            left: 40%;
        }
        .right-arrow {
            right: 40%;
        }
        .right-arrow, .left-arrow {
            position: absolute;
            font-size: 30px;
            color: gray;
        }
        .propdesc ul {
            list-style-type: none;
            padding: 0px;
        }
        .propdesc ul li{
            display: inline;
        }
        .buyprops, .rentprops {
            text-align: center;
            font-family: Georgia;
            margin: 10px;
            box-shadow: 2px 2px 5px #CACACA;
            color: black;
            border-radius: 5px;
        }
            .rentprops:hover, .buyprops:hover {
                transform: scale(1.03);
                transition-duration: 0.7s;
            }
        .propdesc, .proplocation, .proptitle{
            font-size: 16px;
            text-align: left;
            line-height: 10px;
        }
        .proptitle{
            line-height: 14px;
            font-family: Georgia;
            font-weight: 800;
        }
        .propprice {
            font-weight: 500;
            font-family: Calibri;
            font-size: 22px;
            background-color: #132542;
            color: white;
            text-align: center;
        }
        .gotoproppage {
            border: 3px solid #eda136;
            color: #eda136;
            background-color: white;
            text-align: center;
        }
            .gotoproppage:hover {
                background-color: #eda136;
                border: 3px solid #eda136;
                color: white;
                transition-duration: 0.4s;
            }
        .buypropstitle, #rentfeaturedpropstitle {
            font-family: Georgia;
            font-size: 30px;
            margin-bottom: 2%;
            margin-top: 30px;
        }
        .propimg {
            border-radius: 5px;
        } 


        /*Our Services*/
        #ourservicesdiv {
            margin-top: 50px;
            margin-bottom: 70px;
            background-color: #1e284c;
            padding: 0px;
        }
        .serviceblock {
            width: 100%;
            text-align: center;
            background-color: #11172D ; /*Our Services Dark blue*/
            padding: 0px;
        }
        .osheadings {
            color: orange;
            margin-top: 50px;
            font-family: Georgia, 'Times New Roman';
            font-size: 22px;
        }
        .ospara {
            color: white;
            font-size: 14px;
            padding: 0px 5px 5px 5px;
            margin-bottom: 14%;
            margin-left: 5%;
            margin-right: 5%;
        }
        #osbutton {
            background-color: orange;
            color: white;
            border: none;
            font-size: 20px;
            box-shadow: 4px 4px 15px #1e284c; 
        }
            #osbutton:hover {
                transform:translateY(-2px);
                transition-duration: 0.5s;
                background-color: #364b96; 
                text-decoration: none;
                color: white;
            }
            #osbutton a{
                color: white;
            }
        #ostitle {
            font-family: Georgia;
            font-size: 30px;
            text-align: center;
            padding-bottom: 20px;
            padding-top: 40px;
            color: white;
        }
        /*Small and Extra Small Screens*/
        @media (max-width: 768px) {
            .osimg{
                display: none;
            }
            .ospara {
                margin-bottom: 0px;
                padding-bottom: 10%;
            }
            .osheadings {
                margin-top: 0px;
                padding-top: 10%;
                color: orange;
            }
            .serviceblock {
                background-color: black;          
            }
            #conblock {     
                background-image: url('Images/con1.jpg');
            }
            #dbblock {     
                background-image: url('Images/db.jpg');
                background-position: center;
            }
            #notifblock {     
                background: rgba(0, 0, 0, 0.5);
            }
            .morediv {     
                background: rgba(0, 0, 0, 0.5);
                padding-bottom: 70px;
            }
            #osbutton {
                display: inline;
                margin-bottom: 5%;
                padding: 15px;
                box-shadow: 4px 4px 15px #23305D; 
                background-color: orange;
            }
        }

        /*Large Screens*/
        @media (min-width: 992px) and (max-width: 1200px) {
            #moreimg {
                display: none;              
            }
            #osbutton {
                display: inline;
                padding: 15px;
            }
            .morediv {
                text-align: center;
                padding-bottom: 70px;
            }
                #moreheading {
                    margin-top: 5%;
                }
        }
        /*Extra Large Screens*/
        @media (min-width: 1200px) {
            #moreimg {
                display: inline;   
            }
            #moreheading {
                margin-top: 14%;
            }
        }
        /*Medium Screens and Smaller*/
         @media (max-width: 992px) {
            #buynewprops, #rentfeaturedprops {
                margin: 50px;   
            }
         }
        
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div id="thebigdiv">

        <!--Search Bar-->
        <div class="container filterdiv col-lg-12 col-md-12 col-sm-12 col-xs-12 parallax">
            <div id="fildiv" class="offset-xl-3 col-xl-6 offset-lg-3 col-lg-6 offset-md-2 col-md-8 offset-sm-1 col-sm-10 col-12">
                    <p id="slogan">Find your perfect home.</p>
                    <div id="buyorrent" class="row">
                        <p class="offset-xl-1 col-xl-4 offset-lg-1 col-lg-4 offset-md-1 col-md-4 offset-sm-1 col-sm-4 offset-1 col-4" id="buybutton" onclick="showBuyOptions()">Buy</p>
                        <p class="offset-xl-2 col-xl-4 offset-lg-2 col-lg-4 offset-md-2 col-md-4 offset-sm-2 col-sm-4 offset-2 col-4" id="rentbutton" onclick="showRentOptions()">Rent</p>
                    </div>
                    <div class="row">
                        <input id="search-bar" class="offset-1 col-8 offset-md-1 col-md-8 offset-sm-1 col-sm-7 offset-1 col-10" type="text" placeholder="Enter Location"/>
                        <button class="btn offset-xl-0 col-xl-2 offset-lg-0 col-lg-2 offset-md-0 col-md-2 offset-sm-0 col-sm-3 offset-4 col-4" id="search-button">Search</button>
                    </div>
            </div>
        </div>
        
        <!--New/Featured Properties-->

        <!--Properties on Sale-->
        <div id="buynewprops">

            <!--Recent properties on Sale-->
            <div class="buypropstitle">Newest Listings</div>
            
            <div class="owl-carousel buypropsslider">
              <asp:Repeater ID="rptrbuy" runat="server">
                <ItemTemplate>
                  <div class="card">
                      <img class="card-img-top" src="Images/PropertyImages/<%#Eval("property_id")%>/<%#Eval("image_name")%>.jpg" alt="<%#Eval("image_name") %>"/>
                      <div class="card-body">
                        <h5 class="card-title proptitle"><%#Eval("property_title") %></h5>
                        <p class="propprice">PKR <%#Eval("property_price") %></p>
                        <p class="card-text ">
                            <div class="propdesc">
                                  <ul>
                                      <li><%#Eval("no_of_bedrooms")%> Bed |</li>
                                      <li><%#Eval("no_of_bathrooms")%> Bath |</li>
                                      <li><%#Eval("property_area") %> Sqft</li>
                                  </ul>
                            </div>
                        </p>
                        <p class="proplocation"><%#Eval("area") %></p>
                        <div style="text-align: center">
                            <a href="#" class="btn btn-primary gotoproppage">View Property</a>
                        </div>
                      </div>
                    </div>
                </ItemTemplate>
              </asp:Repeater>
            </div>

            <!--Properties under 5 Crore for Sale-->
            <div class="buypropstitle">Houses Under 5 Crore</div>
            <div class="owl-carousel buypropsslider">

              <asp:Repeater ID="rptrbuyunder" runat="server">
                <ItemTemplate>
                  <div class="card">
                      <img class="card-img-top" src="Images/PropertyImages/<%#Eval("property_id")%>/<%#Eval("image_name")%>.jpg" alt="<%#Eval("image_name") %>"/>
                      <div class="card-body">
                        <h5 class="card-title proptitle"><%#Eval("property_title") %></h5>
                        <p class="propprice">PKR <%#Eval("property_price") %></p>
                        <p class="card-text ">
                            <div class="propdesc">
                                  <ul>
                                      <li><%#Eval("no_of_bedrooms")%> Bed |</li>
                                      <li><%#Eval("no_of_bathrooms")%> Bath |</li>
                                      <li><%#Eval("property_area") %> Sqft</li>
                                  </ul>
                            </div>
                        </p>
                        <p class="proplocation"><%#Eval("area") %></p>
                        <div style="text-align: center">
                            <a href="#" class="btn btn-primary gotoproppage">View Property</a>
                        </div>
                      </div>
                    </div>
                </ItemTemplate>
              </asp:Repeater>
            </div>

        </div>

        <!--Featured Properties for Rent-->
        <div id="rentfeaturedprops">
            <div id="rentfeaturedpropstitle">Latest Properties for Rent</div>
            <div id="rentfeaturedpropsslider" class="owl-carousel">
              
                <asp:Repeater ID="rptrrent" runat="server">
                <ItemTemplate>
                  <div class="card">
                      <img class="card-img-top" src="Images/PropertyImages/<%#Eval("property_id")%>/<%#Eval("image_name")%>.jpg" alt="<%#Eval("image_name") %>"/>
                      <div class="card-body">
                        <h5 class="card-title proptitle"><%#Eval("property_title") %></h5>
                        <p class="propprice">PKR <%#Eval("property_price") %></p>
                        <p class="card-text ">
                            <div class="propdesc">
                                  <ul>
                                      <li><%#Eval("no_of_bedrooms")%> Bed |</li>
                                      <li><%#Eval("no_of_bathrooms")%> Bath |</li>
                                      <li><%#Eval("property_area") %> Sqft</li>
                                  </ul>
                            </div>
                        </p>
                        <p class="proplocation"><%#Eval("area") %></p>
                        <div style="text-align: center">
                            <a href="#" class="btn btn-primary gotoproppage">View Property</a>
                        </div>
                      </div>
                    </div>
                </ItemTemplate>
              </asp:Repeater>

            </div>
        </div>

        <!--Our Services-->

        <div id="ourservicesdiv" class="container-fluid ">
            <div class="row" style="width: 100%; margin-left: 0px; padding-bottom: 0px;">
                <div  class="col-lg-12">
                    <p id="ostitle">We are not just an ordinary property listing website.</p>
                </div>

                <div class="col-xl-3 col-lg-4 col-md-6 serviceblock" id="conblock">
                    <p class="osheadings">Contract Templates</p>
                    <p class="ospara">Create your contracts in a streamlined way by filling using our contract form and templates.</p>
                    <img src="Images/con4.jpg" class="img-fluid osimg"/>
                </div>

                <div class="col-xl-3 col-lg-4 col-md-6 serviceblock" id="notifblock">
                    <img src="Images/notif1.jpg" class="img-fluid osimg"/>
                    <p class="osheadings">Notifications and Reminders</p>
                    <p class="ospara">Managing contracts means keeping track of activities and deadlines. Our notifications help you do just that.</p>      
                </div>


                <div class="col-xl-3 col-lg-4 col-md-6 serviceblock" id="dbblock">
                    <p class="osheadings">Dashboard</p>
                    <p class="ospara">Stay on top of rent payment dates, inspections, contract renewals and plumber visits.</p>
                    <img src="Images/db.jpg" class="img-fluid osimg"/>
                </div>
                <div class="col-xl-3 col-lg-12 col-md-6 serviceblock morediv">
                    <img src="Images/am.jpg" class="img-fluid osimg" id="moreimg"/>
                    <p class="osheadings" id="moreheading">... and more.</p>
                    <a href="Our Services.aspx"><span id="osbutton" class="btn">Our Services</span></a>
                </div>
            </div>

        </div>



      </div>
</asp:Content>

