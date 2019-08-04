<%@ Page Title="" Language="C#" MasterPageFile="~/HeaderandFooter.master" AutoEventWireup="true" CodeFile="Agency Profile.aspx.cs" Inherits="Agency_Profile" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">

    <!--Owl Carousel-->
    <link rel="stylesheet" href="OwlCarousel2-2.3.4\docs\assets\owlcarousel\assets\owl.carousel.min.css"/>
    <script src="OwlCarousel2-2.3.4/docs/assets/owlcarousel/owl.carousel.min.js"></script>
    <link rel="stylesheet" href="OwlCarousel2-2.3.4\docs\assets\owlcarousel\assets\owl.theme.default.min.css"/>

    <script>
        $(document).ready(function () {
            if ( window.history.replaceState ) {
                window.history.replaceState( null, null, window.location.href );
            }

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
                        items: 2,
                        nav: true,
                        loop: false
                    }
                }
            });
        });
    </script>

    <style>
        #bigdiv{
            width: 100%;
            display: flex;
            align-items: center;
            justify-content: center;
            background-color: #f8f8f8;
        }
        #centerdiv{
            width: 80%;
            background-color: white;
            border-radius: 10px;
            margin: 50px 0px;
            box-shadow: 0px 0px 10px #aaa;
        }
        #titlediv{
            padding: 35px;
            border-top-left-radius: 10px;
            border-top-right-radius: 10px;
            background: linear-gradient(#e58457, #6c7696);
            width: 100%;
            text-align: center;
        }
        #agencyname{
            color: white;
            font-weight: 300;
            font-size: 27px;
        }
        #contentdiv{
            width: 100%;
            background-color: white;
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
        }
        .ai-stuff{
        }
        .ai-label{
            font-weight: 600;
        }
        #agencyinfo{
            padding: 30px;
        }
        .sub-heading{
            font-size: 25px;
            font-family: Georgia;
            color: #f2934f; /*Orange-ish*/
            margin-top: 30px;
        }
        .search-btn{
            padding: 15px 30px;
            font-size: 20px;
            font-weight: 300;
        }
            .search-btn:hover{
                transition-duration: 0.6s;
            }
        .card{
            box-shadow: 0px 0px 10px #AAA;
            width: 300px;
        }
            .card:hover{
                transform: scale(1.02);
                transition-duration: 0.6s;
            }
        #agent-list{
            display: grid;
            grid-template-rows: 1fr 1fr;
            grid-template-columns: 1fr 1fr 1fr;
            width: 80%;
        }
        .city{
            text-transform: uppercase;
            font-size: 14px;
            font-weight: bold;
            line-height: 10px;
        }
        .agent-name{           
            color: #677893; /*Steel Blue*/
            font-weight: 400;
            text-align: center;
        }
        .agent-card{
            margin: 30px;
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
        #agentdiv{
            max-width: 700px;
        }
        .propdesc ul {
            list-style-type: none;
            padding: 0px;
        }
        .propdesc ul li{
            display: inline;
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
        #propdiv{
            max-width: 700px;
            margin: 30px 50px 50px 50px;
            align-items: center;
            padding: 20px;
        }
         .ag-line{
            width: 80%;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div id="bigdiv">
        <div id="centerdiv">

            <!--Agency Info-->
            <asp:Repeater ID="rptragencyinfo" runat="server">
                <ItemTemplate>
                    <div id="titlediv">
                        <h2 id="agencyname"><%#Eval("agency_name")%></h2>
                    </div>

                    <div id="contentdiv">
                        <h2 id="infotitle" class="sub-heading">Agency Information</h2>
                        <div id="agencyinfo">
                            <p class="ai-stuff"><span class="ai-label"><i class="fa fa-building"></i> Head Office: </span><%#Eval("agency_address")%></p>
                            <p class="ai-stuff"><span class="ai-label"><i class="fa fa-phone"></i> Phone Number: </span><%#Eval("agency_phone")%></p>                    
                            <p class="ai-stuff"><span class="ai-label"><i class="fa fa-envelope"></i> Email: </span><%#Eval("agency_email")%></p>
                        </div>
                    </div>
                    
                 </ItemTemplate>
              </asp:Repeater>

            <hr class="ag-line"/>

            <!--Agent Info-->
            <div style="display: flex; flex-direction: column; justify-content: center; align-items: center">
            <h2 id="infotitle" class="sub-heading">Agents</h2>
            <div id="agentdiv" class="owl-carousel">
              <asp:Repeater ID="rptragent" Runat="Server">
                <ItemTemplate>
                    <div class="card agent-card">
                      <div class="card-body">
                        <h5 class="card-title agent-name"><%# Eval ("f_name") %> <%# Eval ("l_name") %></h5>
                          <hr />
                        <p class="card-text ">
                            <p class="agency-name"><%# Eval ("agency_name") %></p>
                            <p class="city"><%# Eval ("city_name") %></p>
                        </p>
                        <div style="text-align: center">
                            <a href="AgentProfile.aspx?id=<%# Eval ("agent_id") %>" class="btn gotoproppage">View Profile</a>
                        </div>
                      </div>
                    </div>
                </ItemTemplate>
              </asp:Repeater>
            </div>
            </div>

            <hr  class="ag-line"/>

            <!--Properties-->
            <div style="display: flex; flex-direction: column; justify-content: center; align-items: center">
            <h2 id="proptitle" class="sub-heading">Current Listings</h2>
            <div id="propdiv" class="owl-carousel">
              <asp:Repeater ID="rptrprop" Runat="Server">
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
                        <div style="text-align: center">
                            <a href="propertyviewpage.aspx?property_id=<%#Eval("property_id") %>" class="btn btn-primary gotoproppage">View Property</a>
                        </div>
                      </div>
                    </div>
                </ItemTemplate>
              </asp:Repeater>
            </div>
            </div>
        </div>
    </div>
</asp:Content>

