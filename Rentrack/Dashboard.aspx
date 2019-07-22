<%@ Page Title="" Language="C#" MasterPageFile="~/HeaderandFooter.master" AutoEventWireup="true" CodeFile="Dashboard.aspx.cs" Inherits="Dashboard" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">

    <!--Font Awesome-->
    <link rel="stylesheet" href="Content/font-awesome.min.css"/>

    <script>
        $(document).ready(function () {
            if ( window.history.replaceState ) {
                window.history.replaceState( null, null, window.location.href );
            }
            
        });
    </script>
    <style>
        #bigdiv{
            display: flex;
            flex-direction: column;
            width: 100%;
            align-items: center;
            justify-content: center;
            //background-color: #fafafa;
        }
        #btn-div{
            display: flex;
            flex-direction: row;
            width: 50%;
            align-content: center;
            justify-content: space-around;
            padding-top: 20px;
            padding-bottom: 20px;
        }
        .db-btn{
            background-color: #e58457; /*Orange*/
            color: white;
            padding: 10px 20px;
        }
            .db-btn:hover{
                background-color: #6c7696; /*Blue*/
                color: white;
                box-shadow: 0px 0px 20px #AAA;
                transition-duration: 0.6s;
            }
        #db-heading{
            font-size: 30px;
            font-weight: 300;
            padding-top: 50px;
        }
        .db-table{
            margin-top: 20px;
            width: 70%;
        }
        .sub-headings{
            font-family: Georgia;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div id="bigdiv">
        <div id="heading-div">
            <p id="db-heading">Dashboard</p>
            <hr />
        </div>

        <div id="btn-div">
            <a href="contract.aspx"><div class="btn db-btn" id="ccbtn"><i class="fa fa-pencil" id="ccicon"></i> Create Contract</div></a>
            <a href="AddProperty.aspx"><div class="btn db-btn" id="apbtn"><i class="fa fa-plus-circle" id="apicon"></i> Add Property</div></a>
            <a href="#"><div class="btn db-btn" id="rrbtn"><i class="fa fa-paper-plane" id="rricon"></i> Request Resource</div></a>
        </div>

        <div id="sold-prop" class="db-table">
            <hr />
            <br />
            <h3 class="sub-headings">Sold Properties</h3>
              <p>This table has a log of all the properties you have sold through Rentrack.</p>            
              <table class="table table-bordered">
                <thead>
                  <tr>
                    <th>S. No.</th>
                    <th>Property Title</th>
                    <th>Property Code</th>                     
                    <th>Sold To</th>
                    <th>Date</th>
                  </tr>
                </thead>
                <tbody>
                  <tr>
                    <td>1</td>
                    <td>400 sq House for Sale</td>
                    <td>1982711178</td>
                    <td>Mustafa Abbas</td>
                    <td>January 16, 2019</td>
                  </tr>
                  <tr>
                    <td>2</td>
                    <td>House for Sale</td>
                    <td>2562764179</td>
                    <td>Hassan Arshad</td>
                    <td>July 10, 2019</td>
                  </tr>
                </tbody>
              </table>
        </div>

        <div id="bought-prop" class="db-table">
            <h3 class="sub-headings">Bought Properties</h3>
              <p>This table has a log of all the properties you have bought through Rentrack.</p>            
              <table class="table table-bordered">
                <thead>
                  <tr>
                    <th>S. No.</th>
                    <th>Property Title</th>
                    <th>Property Code</th>                     
                    <th>Bought From</th>
                    <th>Date</th>
                  </tr>
                </thead>
                <tbody>
                  <tr>
                    <td>1</td>
                    <td>Studio Apartment</td>
                    <td>3456811901</td>
                    <td>Maryam Shah</td>
                    <td>April 12, 2017</td>
                  </tr>
                  <tr>
                    <td>2</td>
                    <td>Gulshan House for Sale</td>
                    <td>1453831945</td>
                    <td>Arsal Khan</td>
                    <td>July 22, 2018</td>
                  </tr>
                </tbody>
              </table>
        </div>

        <div id="rented-prop" class="db-table">
            <hr />
            <br />
            <h3 class="sub-headings">Rented Properties (Landlord)</h3>
              <p>This table has a log of all the properties you have rented to other users through Rentrack.</p>            
              <table class="table table-bordered">
                <thead>
                  <tr>
                    <th>S. No.</th>
                    <th>Property Title</th>
                    <th>Property Code</th>                     
                    <th>Rented to</th>
                    <th>Start Date</th>
                    <th>Contract Expiry</th>
                  </tr>
                </thead>
                <tbody>
                  <tr>
                    <td>1</td>
                    <td>Lower Portion for Rent</td>
                    <td>245671901</td>
                    <td>Yawar Mahmood</td>
                    <td>September 30, 2018</td>
                    <td>August 30, 2019</td>
                  </tr>
                  <tr>
                    <td>2</td>
                    <td>2 Room Apartment for Rent</td>
                    <td>744731972</td>
                    <td>Ahmed Ali</td>
                    <td>July 06, 2019</td>
                    <td>June 06, 2020</td>
                  </tr>
                </tbody>
              </table>
        </div>

        <div id="rented-from-prop" class="db-table">
            <hr />
            <br />
            <h3 class="sub-headings">Rented Properties (Tenant)</h3>
              <p>This table has a log of all the properties you have rented from other users through Rentrack.</p>            
              <table class="table table-bordered">
                <thead>
                  <tr>
                    <th>S. No.</th>
                    <th>Property Title</th>
                    <th>Property Code</th>                     
                    <th>Rented from</th>
                    <th>Start Date</th>
                    <th>Contract Expiry</th>
                  </tr>
                </thead>
                <tbody>
                  <tr>
                    <td>1</td>
                    <td>House in Gulistan-e-Jauhar</td>
                    <td>4345367771</td>
                    <td>Shahid Khan</td>
                    <td>Februray 12, 2019</td>
                    <td>January 12, 2020</td>
                  </tr>
                  <tr>
                    <td>2</td>
                    <td>3 Room House for Rent</td>
                    <td>7834984439</td>
                    <td>Batool Qamar</td>
                    <td>July 17, 2019</td>
                    <td>June 17, 2020</td>
                  </tr>
                </tbody>
              </table>
        </div>
    </div>
</asp:Content>

