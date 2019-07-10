<%@ Page Title="" Language="C#" MasterPageFile="~/HeaderandFooter.master" AutoEventWireup="true" CodeFile="Find Agent.aspx.cs" Inherits="Find_Agent" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <script>
        if ( window.history.replaceState ) {
                window.history.replaceState( null, null, window.location.href );
        }
    </script>
    <style>
        #search-div{
            width: 100%;
            height: 500px;
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            text-align: center;
            background-color: #677893; /*Steel Blue*/
        }
        .dropdowndesign{
            width: 30%;
        }
        #description{
            width: 70%;
            color: white;
            font-size: 22px;
            font-weight: 300;
        }
        #selecttxt{
            color: #f2934f; /*Orange-ish*/
            font-family: Georgia;
            font-size: 25px
        }
        #Searchbtn{
            padding: 30px;
        }
        .search-btn{
            padding: 15px 30px;
            font-size: 20px;
            font-weight: 300;
        }
        .card{
            box-shadow: 0px 0px 10px #AAA;
            width: 300px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div id="bigdiv">
        <div id="search-div">
            <p id="description">Whether you're buying or selling, renting or relocating, our comprehensive directory of real estate agents will help you to find that perfect agent to fit your individual needs.</p>     
            <br /><p id="selecttxt">Select a city to find agents in</p>
            
            <!--City Dropdown-->
            <asp:RequiredFieldValidator ID="RequiredFieldValidatorddcity" runat="server" ErrorMessage="This field is required" CssClass="text-danger error-design" ControlToValidate="cityddl" InitialValue="0" validationgroup="Addareafields"></asp:RequiredFieldValidator>
            <asp:DropDownList ID="cityddl" runat="server" class="dropdowndesign narrower form-control"></asp:DropDownList>

            <br />
            <asp:Button ID="Searchbtn" runat="server" Text="Search" class="btn btn-dark search-btn" OnClick="Searchbtn_Click"/>
        </div>

        <div id="agent-list">

                    <div class="card">
                      <div class="card-body">
                        <h5 class="card-title agent-name">Hamn Kamran</h5>
                        <p class="card-text ">
                            <p class="agency-name">ABC Agency</p>
                        </p>
                        <div style="text-align: center">
                            <a href="#" class="btn btn-primary gotoproppage">View Profile</a>
                        </div>
                      </div>
                    </div>

            <asp:Repeater ID="rptragent" runat="server">
                <ItemTemplate>

                    <div class="card">
                      <div class="card-body">
                        <h5 class="card-title agent-name"><%#Eval("agent_name") %></h5>
                        <p class="card-text ">
                            <p class="agency-name"><%#Eval("agency_name") %></p>
                        </p>
                        <div style="text-align: center">
                            <a href="#" class="btn btn-primary gotoproppage">View Profile</a>
                        </div>
                      </div>
                    </div>

                </ItemTemplate>
              </asp:Repeater>
        </div>
    </div>
</asp:Content>

