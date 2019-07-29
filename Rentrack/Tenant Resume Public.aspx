<%@ Page Title="" Language="C#" MasterPageFile="~/HeaderandFooter.master" AutoEventWireup="true" CodeFile="Tenant Resume Public.aspx.cs" Inherits="Tenant_Resume_Public" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style>

        #maindiv {
    		background-color: white;
    	}
        #box {
			font-family: 'Roboto', sans-serif;
            padding-top:70px;
            padding-bottom:70px;
            margin: 0px;
            width:100%;
            height:100%;
        }
        #usrdiv {
	        
            padding:50px 70px 50px 70px;           
			color:black;
        }
        .heading{
            font-size: 40px;
            font-weight: 300;
            font-family: Calibri;
        }
        .revtitle{
            font-size: 25px;
            font-weight: 300;
            font-family: Calibri;
        }
        .narrower{
            font-size: 14px;
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
        .align-content-center{
            text-align: center;
        }
        .align-inline{
             display: grid; 
             grid-gap: 20px;
             grid-template-columns: 1fr 1fr;
        }
        .revusr{
            border:0.3px solid black;
            border-radius: 3px;
            margin: 5px;
            padding:10px;
        }
        .revbox{
            margin: 10px;
        }
        #accbtn{
            background-color: #2ca344; /*Green*/
            color: white;
            padding: 10px 20px;
        }
        #rejbtn{
            background-color: #d61c1c; /*Red*/
            color: white;
            padding: 10px 20px;
        }
        .trbtn{
            margin: 20px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div id="maindiv">
    <div class="container-fluid col-lg-12 col-md-12 col-sm-12 col-12">
        <div id="box" class="col-lg-12 col-md-12 col-sm-12 col-12">

            <h3 class="heading align-content-center">Rental Resume</h3>

            <div id="usrdiv" class="offset-xl-3 col-xl-6 offset-lg-2 col-lg-8 offset-md-1 col-md-10 col-sm-12 col-12">
                
                
                                <div class="align-content-center">
                                    <h5 class="align-content-center">Ahmed Ali</h5>
                                <br />
                                    <div>

                                    <div class="align-inline">
                                    <label>Move-in Date</label>
                                    <p class="useradd">Within next month</p>
                                    </div>

                                    <div class="align-inline">
                                    <label>No. of Tenants</label>
                                    <p class="useradd">2 Adults</p>
                                    </div>
                                    
                                    <div class="align-inline">
                                    <label>Moving From</label>
                                    <p class="usrdob">University Road</p>
                                    </div>

                                <div class="align-inline">
                                    <label>Do you have any pets?</label>
                                    <p class="usrphone">No</p>
                                    </div>

                                <div class="align-inline">
                                    <label>Do you smoke?</label>
                                    <p class="usremail">No</p>
                                </div>

                                <div class="align-inline">
                                    <label>Employer</label>
                                    <p class="usremail">Dawn Newspapers</p>
                                </div>

                                <div class="align-inline">
                                    <label>Job Title</label>
                                    <p class="usremail">Sports Journalist</p>
                                </div>
                            </div>
                <br />   
                
                      <div>
                          <a href="contract.aspx"><div class="btn trbtn" id="accbtn"><i class="fa fa-check"></i> Accept</div></a>
                          <a href="#"><div class="btn trbtn" id="rejbtn"><i class="fa fa-times"></i> Reject</div></a>                            
                      </div>
                            
                            </div>              
                        

            </div>    
        </div>
    </div>
   </div>
</asp:Content>

