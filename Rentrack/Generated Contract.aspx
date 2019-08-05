<%@ Page Title="" Language="C#" MasterPageFile="~/HeaderandFooter.master" AutoEventWireup="true" CodeFile="Generated Contract.aspx.cs" Inherits="Generated_Contract" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <title>Generated Contract</title>

    <style>
        #centerdiv {
            padding: 0px;
            box-shadow: 0px 0px 15px #AAA;
            border-radius: 5px;
            margin-top: 5%;
            margin-bottom: 5%;
        }
        .formdiv {
            width: 100%;
            padding: 6% 15% 7% 15%;
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
        .title{
            font-size: 30px;
            font-weight: 500;
            font-family: Calibri;
            text-align: center;
            color: black;
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div style="width:100%">
        <div class="offset-lg-2 col-lg-8 offset-sm-1 col-sm-10 col-12 container-fluid" id="centerdiv">
            <div class="formdiv">
                <asp:Panel ID="Panel1" runat="server">
                    <asp:Repeater ID="gencntct" runat="server">
                        <ItemTemplate>
                            <br />
                            <br />
                            <br />
                            <br />
                            <br />
                            <br />
                            <br />
                            <br />
                            <br />
                            <br />
                            <br />
                            <br />
                            <br />
                            <br />
                            <br />
                            <br />
                            <br />
                            <br />
                <div class="align-content-center title"><p style="text-align: center; font-weight:500; font-size:30px;">TENANCY AGREEMENT</p></div>       
                    <br />
                    <br />
                <p>This Tenancy agreement is made at Karachi on this <%=Day %> day of <%=Month %>.</p>
                <p style="text-align: center; font-weight:600; margin-top:10px; margin-bottom:10px;">BETWEEN</p>

                <p><strong><%#Eval("landlord_name")%> son of <%#Eval("landlord_father")%></strong>, Muslim, adult, holding CNIC
                <%#Eval("landlord_cnic")%> resident of House No. <%#Eval("landlord_address")%>, Karachi hereinafter
                called the first part and as Landlord.
                </p>

                <p style="text-align: center; font-weight:600; margin-top:10px; margin-bottom:10px;">AND</p>

                <p><strong><%#Eval("tenant_name")%> son of <%#Eval("tenant_father")%></strong>, Muslim, adult, holding CNIC
                <%#Eval("tenant_cnic")%> resident of House No. <%#Eval("tenant_address")%>,
                Karachi hereinafter called the second part and as Tenant.
                AND WHEREAS the first party is the absolutely owner of a House
                No. <%#Eval("property_address")%>, Karachi and has agreed to give on rent the
                said property / house on the term and condition mentioned below.</p>

                <br />

                <p>1. That the tenant has agreed to pay Rs.<%#Eval("rent")%>/= only as monthly rent in
                advance on <%#Eval("rent_payable_date")%> of each month.</p>
                <p>2. That a tenant / second party has paid sum of Rs.<%#Eval("fixed_deposit")%>/= to the
                landlord/ First Party as fixed deposit security previously which will be
                return after the expiry of the agreement and after deducting if any.
                </p>

                <br />

                <p>3. That the fixed deposit will be refunded by the landlord / First Party to
                the tenant / Second Party at the time of vacant / termination of the
                house / Rented Premises and Rented premises will be handed over to
                the First Party / Landlord in sound condition to the first party.</p>
<br />
                <p>4. That the period of a tenancy will be for <strong><%#Eval("contract_life")%></strong> which has been
                <strong>started from <%#Eval("start_date", "{0:dd/MM/yyyy}")%> and will be ended on
                <%#Eval("end_date", "{0:dd/MM/yyyy}")%></strong>. After this period the fresh agreement can be made
                /renewed with the consent of both parties.
                </p>
<br />
                <p>5. That the second party / tenant shall not demolish / alter or damage the
                said premises or remove any installation during the period of the
                tenancy without the prior consent of the first party in writing or as the
                case may be</p>
<br />
                <p>6. That second party / Tenant permits the first party / Landlord or his
                agent to inspect the said rented premises at any reasonable time prior
                arrangement.</p>
<br />
                <p>7. That the second party / Tenant shall not sub-let the said house to any
                person(s) / society / institution on any terms whatsoever it may be.</p>
<br />
                <p>8. That at any time in case either or the party desirous to terminate /
                vacate the tenancy such party shall give notice Prior Two months in
                writing to the other party and that shall be final binding on the both
                parties</p>
<br />
                <p>9. That the second party / tenant shall keep and maintain the said house /
                rented premises in good condition and he shall look after the said house
                / rented premises with reasonable care and shall be exclusively
                responsible for the repair occasioned by use of the house.
                </p>
<br />
                <p>10. That the said rented house will be used only for residential purpose and
                will not be use for commercial use and the second party will not store
                any kind of blast and thud materials in the rented house at any cost.</p>
<br />
                <p>11. That the electricity bill and suigass bill be paid by the second party
                directly to the concerned department if in case of any failure of arrears
                remain continue during the tenancy tenure the said bill amount shall be
                adjusted from the security deposit.</p>
<br />
                <p><strong>IN WITNESSES WHERREOF</strong> the parties above named have set and
                subscribed their respective hands at Karachi on the day month and year first
                above mentioned.</p>
<br />
                <p style="text-align: center; font-weight:600; margin-top:10px; margin-bottom:10px; font-size:20px;">Witnesses</p>
                <br />
                <p>1. ______________ _________________</p>

                <p>______________________</p>
                <p>Landlord</p>
                <p>CNIC NO. <%#Eval("landlord_cnic")%></p>

                <p>2. _______________ _________________</p>
      
                <p>______________________</p>
                <p>Tenant</p>
                <p>CNIC No.<%#Eval("tenant_cnic")%></p>

                    </ItemTemplate>
                </asp:Repeater>
            </asp:Panel>
                <div style="width: 100%; text-align: center; margin-top: 40px">
                    <asp:Button ID="savebtn" runat="server" Text="Save" class="btn submitbtn" ValidationGroup="generate" OnClick="Save_Click"/>
                </div>
        </div>
    </div>
</div>
</asp:Content>

