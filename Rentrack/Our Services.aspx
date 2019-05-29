<%@ Page Title="Our Services" Language="C#" MasterPageFile="~/HeaderandFooter.master" AutoEventWireup="true" CodeFile="Our Services.aspx.cs" Inherits="Our_Services" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <script>
        $(document).ready(function () {
            if ( window.history.replaceState ) {
                window.history.replaceState( null, null, window.location.href );
            }
        });
    </script>
    <style>
        #bigdiv{
            width: 100%;
            background-color: #EEE;
            display: flex;
            flex-direction: column;
            align-items: center;
        }
        #headdiv{
            width: 100%;
            background: url("Images/ourservices.jpg");
            background-repeat: no-repeat;
            background-attachment: fixed;
            display: flex;
            flex-direction: column;
            align-items: center;          
        }
        #os-heading{
            padding-top: 40px;
            color: #23305D;
            font-size: 40px;
            font-family: Georgia;
            font-weight: 600;
            animation: Slide_Down 1.4s ease; 
        }

        #whitediv{
            background-color: white;
            width: 85%;
            margin-top: 250px;
            border-top-left-radius: 5px;
            border-top-right-radius: 5px;
            animation: Slide_Up 1.4s ease; 
            box-shadow: 0px 0px 20px #DDD;
        }
        #frontdiv{
            width: 85%;
            background-color: white;
            box-shadow: 0px 20px 20px #DDD;
            animation: Slide_Up 1.4s ease;
        }
        #wdwo{
            text-align: center;
            color: orange;
            font-size: 28px;
            font-weight: 300;
            margin: 40px 0px 40px 0px;
        }
        #trad-activities{
            padding: 70px 0px 70px 0px;
            background-color: #677893; /*Steel Blue*/
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
        }
            #trad-activities p{
                text-align: center;
                font-size: 25px;
                color: white;
                font-family: Georgia;
                margin-left: 50px;
                margin-right: 50px;
            }
            #trad-activities ul{
                list-style: none;
                padding-top: 30px;
                padding-bottom: 30px;
            }
            #trad-activities ul li{
                font-size: 20px;
                color: white;
                font-weight: 300;
                line-height: 35px;
            }
            #trad-activities span{
                color: white; 
                background-color: #f2934f; /*Orange*/
                padding: 10px 30px 10px 30px;
                font-size: 18px;
            }
                #trad-activities span:hover{
                    background-color: #e87929; /*Dark Orange*/
                    transition-duration: 0.8s;
                    box-shadow: 0px 0px 20px #434b59;
                }
        

        #middiv{
            padding: 100px;
            text-align: center;
        }
            #middiv p{
                font-size: 20px;
            }
            #middiv h5{
                padding-top: 50px;
                font-size: 22px;
            }

        .service-heading{
            color: #f2934f;
        }
        
        .align-two-inline{
            display: grid;
            grid-template-columns: 1fr 1fr;
        }
        .service-desc{
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            padding: 0px 30px 0px 30px;
        }
        .bg-gray{
            background-color: #efefef;
        }

        @keyframes Slide_Up{
            0%{
                transform:translateY(250px);
            }
            100%{
                transform:translateY(0px);
            }
        }
        @keyframes Slide_Down{
            0%{
                transform:translateY(-100px);
            }
            100%{
                transform:translateY(0px);
            }
        }

        /*Responsiveness*/

        /*Medium Screen and Smaller*/
        @media (max-width: 992px) {
            #whitediv{
                width: 100%;
                box-shadow: none;
                border-top-left-radius: 0px;
                border-top-right-radius: 0px;
            }
            #frontdiv{
                width: 100%;
            }
        }
        /*Small Screen and Extra Small Screen*/
        @media (max-width: 768px) {
            .service-img{
                display: none;
            }
            .service-desc{
                padding: 50px 70px;
                text-align: justify;
            }
            .align-two-inline{
                display: grid;
                grid-template-columns: none;
            }
            #middiv{
                padding: 70px 50px;
            }
            #notif-div{
                color: white;
                background: url("Images/notif3.jpg");
                background-repeat: no-repeat;
                background-size: cover;
            }
            #dash-div{
                color: white;
                background: url("Images/db3.png");
                background-repeat: no-repeat;
                background-size: cover;
            }
            #whitediv{
                display: none;
            }
            #headdiv{
                height: 150px;
            }
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div id="bigdiv">
        <!--Heading div-->
        <div id="headdiv">
            <p id="os-heading">Our Services</p>
            <div id="whitediv">
                <p id="wdwo">What do we have to offer?</p>
            </div>
        </div>
        
        <!--Front div-->
        <div id="frontdiv">
            <div id="trad-activities">
                <p>Rentrack allows you do all the activities that a traditional property listing website does.</p>
                <ul>
                    <li><i class="fa fa-check"></i> Buying properties</li>
                    <li><i class="fa fa-check"></i> Renting properties</li>
                    <li><i class="fa fa-check"></i> Selling properties</li>
                    <li><i class="fa fa-check"></i> Connecting with Agents</li>
                </ul>
                <a href="FAQ.aspx"><span class="btn">Learn More with FAQ</span></a>
            </div>

            <div id="middiv">
                <p>In addition, we allow you to manage your rental contracts and keep track of the properties you have bought and sold with our <b>contract management system</b>.</p>
                <h5>Have a look at its features.</h5>
            </div>

            <div id="services-div">

                <div class="align-two-inline">
                    <div>
                        <img class="service-img img-fluid" src="Images/cont.jpg" />
                    </div>
                    <div class="service-desc bg-gray" id="con-div">
                        <h5 class="service-heading">Contract Templates</h5>
                        <p class="service-text">For dealings to proceed smoothly throughout the contractual period, it is essential that both parties are clear on all the terms and conditions. To avoid ambiguity and disagreements, we allow you to generate contracts through our contract templates. </p>
                    </div>
                </div>

                <div class="align-two-inline">
                    <div class="service-desc" id="dash-div">
                        <h5 class="service-heading">Dashboard</h5>
                        <p class="service-text">Stay on top of rent dates, inspections, contract renewals and plumber visits. The dasboard gives you the capability to view upcoming events in a yearly, monthly or even weekly setting. </p>
                    </div>                   
                    <div>
                        <img class="service-img img-fluid" src="Images/db2.png" />
                    </div>
                </div>

                <div class="align-two-inline">
                    <div>
                        <img class="service-img img-fluid" src="Images/highlight.png" />
                    </div>
                    <div class="service-desc bg-gray" id="high-div">
                        <h5 class="service-heading">Highlighting</h5>
                        <p class="service-text">If you receive a contract and disagree with certain conditions, you can highlight those specific parts and recommend adjustments. </p>
                    </div>
                </div>

                <div class="align-two-inline">
                    <div class="service-desc" id="notif-div">
                        <h5 class="service-heading">Notifications</h5>
                        <p class="service-text">Managing contracts means keeping track of activities and deadlines. If a tenant requests an event such as re-painting the lounge, you get a notification to accept, decline or edit the request. Notifications also come to ask for ratings after an event so we may know your point of view. </p>
                    </div>                   
                    <div>
                        <img class="service-img img-fluid" src="Images/notif2.jpg" />
                    </div>
                </div>

                <div class="align-two-inline">
                    <div>
                        <img class="service-img img-fluid" src="Images/rating1.jpg" />
                    </div>
                    <div class="service-desc bg-gray" id="rat-div">
                        <h5 class="service-heading" >Ratings and Reviews</h5>
                        <p class="service-text">Give feedback on tenants, landlord, buyer, seller and the properties by rating and giving your reviews about them.</p>
                        <p class="service-text">Give your reviews on how well your request for an event was handled to let other users know of your experience.</p>
                    </div>
                </div> 
            </div>

        </div>

    </div>
</asp:Content>

