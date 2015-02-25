<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="VTS_CustomerEntry_New.aspx.cs"
    Inherits="VTS_Customer.VTS_CustomerEntry_New" EnableEventValidation="false" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Customer Entry</title>
    <link rel="stylesheet" type="text/css" href="js/jquery-ui.css">
    <link rel="stylesheet" type="text/css" href="css/bootstrap.css">
    <script type="text/jscript" src="js/jquery-1.10.2.js"></script>
    <script type="text/jscript" src="js/jquery-ui.js"></script>
    <script src="js/FormValidation.js" type="text/javascript"></script>
</head>
<body>
    <form id="frmCustomerEntry_New" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <script type="text/javascript">
                var prm = Sys.WebForms.PageRequestManager.getInstance();
                prm.add_endRequest(function (s, e) {
                    $("#txtDob").datepicker({ dateFormat: 'd MM, yy',
                        changeMonth: true,
                        changeYear: true
                    });
                });
            </script>

              

            <div style="border: 1px solid #000; margin: 0 auto;">
                <%--<asp:UpdatePanel ID="updPnlAddress" runat="server">--%>
                <fieldset style="background: #FFE6B2; border: 1px solid #000; padding: 0; margin-top: 20px;">
                    <legend style="background: #FFCC66; padding: 3px; border: 1px solid #000; position: relative;
                        top: -10px;"><b>Customer Personal Data</b></legend>
                    <table width="95%" cellpadding="" cellspacing="" align="center">
                        <tr>
                            <td>
                                <div class="alert-success">
                                    <asp:Label ID="lblSucessMsg" runat="server" Text=" " data-dismiss="alert"></asp:Label>
                                </div>
                                <div class="alert-error">
                                    <asp:Label ID="lblErrMsg" runat="server" Text=" " data-dismiss="alert"></asp:Label>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="4">
                                <asp:GridView ID="grdCustomerDetails" runat="server" PageSize="5" OnPageIndexChanging="grdCustomerDetails_OnPageIndexChanging"
                                    AllowPaging="true" Width="100%" Height="50%" AutoGenerateColumns="false" EmptyDataText="No Records Fetch"
                                    BackColor="#FFEBC2" AlternatingRowStyle-BackColor="#FFE0A3" DataKeyNames="CustId"
                                    HeaderStyle-BackColor="#FFCC66"  OnSelectedIndexChanging="grdCustomerDetails_SelectedIndexChanging"
                                    AutoPostBack="TRUE" OnRowDataBound="OnRowDataBound" >
                                    <Columns>
                                        <asp:TemplateField HeaderText="CustId">
                                            <ItemTemplate>
                                                <asp:Label ID="grdlblCusId" runat="server" Text='<%#Eval("CustId")%>'></asp:Label></ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="CusName">
                                            <ItemTemplate>
                                                <asp:Label ID="grdlblCusName" runat="server" Text='<%#Eval("CustFstName")%>'></asp:Label></ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="MobileNo">
                                            <ItemTemplate>
                                                <asp:Label ID="grdlblMblNo" runat="server" Text='<%#Eval("Mobile")%>'></asp:Label></ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Email">
                                            <ItemTemplate>
                                                <asp:Label ID="grdlblEmail" runat="server" Text='<%#Eval("EmailID")%>'></asp:Label></ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Status">
                                            <ItemTemplate>
                                                <asp:Label ID="grdlblStatus" runat="server" Text='<%#Eval("wfs_Status")%>'></asp:Label></ItemTemplate>
                                        </asp:TemplateField>
                                    </Columns>
                                </asp:GridView>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <fieldset style="background: #FFE6B2; border: 1px solid #000; padding: 0; margin-top: 20px;">
                                    <table width="90%" cellpadding="" cellspacing="" align="center">
                                        <legend style="background: #FFCC66; padding: 3px; border: 1px solid #000; position: relative;">
                                            <b>Customer Personal Entry</b></legend>
                                        <tr>
                                            <td colspan="4" align="right">
                                                <asp:Label ID="lblManatoryfields" runat="server" Font-Size="X-Small" ForeColor="Red"
                                                    Text="( * ) Mandatory Fields"></asp:Label>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <asp:Label ID="lblCustomerId" CssClass="col-sm-2 control-label" runat="server" Text="Customer Id"></asp:Label>
                                            </td>
                                            <td colspan="3">
                                                <asp:Label ID="lblAutoCusId" CssClass="col-sm-2 control-label" runat="server" Text=""></asp:Label>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                            </td>
                                            <td>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                            </td>
                                            <td>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                            </td>
                                            <td>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <asp:Label ID="lblFstName" CssClass="col-sm-2 control-label" runat="server" Text="First Name *"></asp:Label>
                                            </td>
                                            <td>
                                                <asp:TextBox ID="txtFirstName" TabIndex="1" onkeypress="return isAlphaKey(event)"
                                                    MaxLength="25" ToolTip="First Name" CssClass="form-control" runat="server"></asp:TextBox>
                                            </td>
                                            <td>
                                                <asp:Label ID="lblMidName" CssClass="col-sm-2 control-label" runat="server" Text="Middle Name"></asp:Label>
                                            </td>
                                            <td>
                                                <asp:TextBox ID="txtMidName" MaxLength="25" TabIndex="2" ToolTip="Middle Name" onkeypress="return isAlphaKey(event)"
                                                    CssClass="form-control" runat="server"></asp:TextBox>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <asp:Label ID="lblLstName" CssClass="col-sm-2 control-label" runat="server" Text="Last Name *"></asp:Label>
                                            </td>
                                            <td>
                                                <asp:TextBox ID="txtLastName" TabIndex="3" MaxLength="25" onkeypress="return isAlphaKey(event)"
                                                    ToolTip="LastName" CssClass="form-control" runat="server"></asp:TextBox>
                                            </td>
                                            <td>
                                                <asp:Label ID="lblDob" CssClass="col-sm-2 control-label" runat="server" Text="Data of birth *"></asp:Label>
                                            </td>
                                            <td>
                                                <asp:TextBox ID="txtDob" runat="server" TabIndex="4" AutoPostBack="true" ToolTip="DOB"
                                                    CssClass="form-control"> </asp:TextBox>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <asp:Label ID="lblGender" CssClass="col-sm-2 control-label" runat="server" Text="Gender *"></asp:Label>
                                            </td>
                                            <td>
                                                <input type="radio" name="rdoGender" tabindex="5" checked runat="server" id="rdomale"
                                                    value="option1">Male
                                                <input type="radio" name="rdoGender" runat="server" id="rdoFemale" value="option2">Female
                                            </td>
                                            <td>
                                                <asp:Label ID="lblAddress1" CssClass="col-sm-2 control-label" runat="server" Text="Current Address Line1 *"></asp:Label>
                                            </td>
                                            <td>
                                                <asp:TextBox ID="txtAddress1" TabIndex="6" ToolTip="Address1" runat="server" TextMode="SingleLine"
                                                    CssClass="form-control"></asp:TextBox>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <asp:Label ID="lblCity" CssClass="col-sm-2 control-label" runat="server" Text="City *"></asp:Label>
                                            </td>
                                            <td>
                                                <asp:TextBox ID="txtCity" MaxLength="30" TabIndex="8" ToolTip="City" CssClass="form-control"
                                                    runat="server"></asp:TextBox>
                                            </td>
                                            <td>
                                                <asp:Label ID="lblAddress2" CssClass="col-sm-2 control-label" runat="server" Text="Current Address Line2"></asp:Label>
                                            </td>
                                            <td>
                                                <asp:TextBox ID="txtAddress2" TabIndex="7" ToolTip="Address2" TextMode="SingleLine"
                                                    CssClass="form-control" runat="server"></asp:TextBox>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <asp:Label ID="lblState" CssClass="col-sm-2 control-label" runat="server" Text="State *"></asp:Label>
                                            </td>
                                            <td>
                                                <asp:TextBox ID="txtState" TabIndex="9" MaxLength="20" ToolTip="State" CssClass="form-control"
                                                    runat="server"></asp:TextBox>
                                            </td>
                                            <td>
                                                <asp:Label ID="lblZipcode" CssClass="col-sm-2 control-label" runat="server" Text="Zipcode *"></asp:Label>
                                            </td>
                                            <td>
                                                <asp:TextBox ID="txtZipcode" MaxLength="10" TabIndex="10" ToolTip="Zipcode" CssClass="form-control"
                                                    runat="server"></asp:TextBox>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td colspan="4">
                                                <asp:Label ID="lblSameasAddress" CssClass="col-sm-2 control-label" runat="server"
                                                    Text="Tick if Permanent Address is same as current address"></asp:Label>
                                                <asp:CheckBox ID="chkSameasAddress" TabIndex="11" ToolTip="Sameasaddrress" runat="server"
                                                    AutoPostBack="true" OnCheckedChanged="chkSameasAddress_CheckedChanged" />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <asp:Label ID="Label1" CssClass="col-sm-2 control-label" runat="server" Text="Permanent Address Line1 "></asp:Label>
                                            </td>
                                            <td>
                                                <asp:TextBox ID="txtPrAddress1" TabIndex="12" ToolTip="PrAddress" TextMode="SingleLine"
                                                    CssClass="form-control" runat="server"></asp:TextBox>
                                            </td>
                                            <td>
                                                <asp:Label ID="lblPrAddress2" CssClass="col-sm-2 control-label" runat="server" Text="Permanent Address Line2 "></asp:Label>
                                            </td>
                                            <td>
                                                <asp:TextBox ID="txtPrAddress2" TabIndex="12" ToolTip="PrAddress" TextMode="SingleLine"
                                                    CssClass="form-control" runat="server"></asp:TextBox>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <asp:Label ID="lblPrCity" CssClass="col-sm-2 control-label" runat="server" Text="City "></asp:Label>
                                            </td>
                                            <td>
                                                <asp:TextBox ID="txtPrCity" MaxLength="30" TabIndex="14" ToolTip="PrCity" CssClass="form-control"
                                                    runat="server"></asp:TextBox>
                                            </td>
                                            <td>
                                                <asp:Label ID="lblPrState" CssClass="col-sm-2 control-label" runat="server" Text="State "></asp:Label>
                                            </td>
                                            <td>
                                                <asp:TextBox ID="txtPrState" TabIndex="15" MaxLength="20" ToolTip="PrState" CssClass="form-control"
                                                    runat="server"></asp:TextBox>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <asp:Label ID="lblPrZipcode" CssClass="col-sm-2 control-label" runat="server" Text="Zipcode "></asp:Label>
                                            </td>
                                            <td>
                                                <asp:TextBox ID="txtPrZipcode" MaxLength="10" TabIndex="16" ToolTip="PrZipcode" CssClass="form-control"
                                                    runat="server"></asp:TextBox>
                                            </td>
                                            <td>
                                                <asp:Label ID="lblMobileNo" CssClass="col-sm-2 control-label" runat="server" Text="Mobile No *"></asp:Label>
                                            </td>
                                            <td>
                                                <asp:TextBox ID="txtMobileNo" TabIndex="17" MaxLength="15" ToolTip="Mobile Number"
                                                    onkeypress="return validate(event)" CssClass="form-control" runat="server"></asp:TextBox>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <asp:Label ID="lblHomeNumber" CssClass="col-sm-2 control-label" runat="server" Text="Home Number"></asp:Label>
                                            </td>
                                            <td>
                                                <asp:TextBox ID="txtHomeNumber" MaxLength="12" TabIndex="18" ToolTip="Home Number"
                                                    onkeypress="return validate(event)" tCssClass="form-control" runat="server"></asp:TextBox>
                                            </td>
                                            <td>
                                                <asp:Label ID="lblEmail" CssClass="col-sm-2 control-label" runat="server" Text="Email ID *"></asp:Label>
                                            </td>
                                            <td>
                                                <asp:TextBox ID="txtEmail" TabIndex="19" MaxLength="30" ToolTip="EmailId" CssClass="form-control"
                                                    runat="server"></asp:TextBox>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <asp:Label ID="lblFax" CssClass="col-sm-2 control-label" runat="server" Text="Fax No"></asp:Label>
                                            </td>
                                            <td>
                                                <asp:TextBox ID="txtFax" MaxLength="12" TabIndex="20" ToolTip="Fax" onkeypress="return validate(event)"
                                                    CssClass="form-control" runat="server"></asp:TextBox>
                                            </td>
                                            <td>
                                                <asp:Label ID="lblWebsite" CssClass="col-sm-2 control-label" runat="server" Text="Website"></asp:Label>
                                            </td>
                                            <td>
                                                <asp:TextBox ID="txtWebsite" MaxLength="30" TabIndex="21" ToolTip="Website" CssClass="form-control"
                                                    runat="server"></asp:TextBox>
                                            </td>
                                            <td>
                                                <asp:HiddenField ID="hdnResultValue" Value="" runat="server" />
                                            </td>
                                        </tr>
                                    </table>
                                </fieldset>
                            </td>
                        </tr>
                        <tr>
                            <td align="center" class="button">
                                <asp:Button ID="btnSave" runat="server" Text="Save" OnClick="BtnSave_Click" />
                                <asp:Button ID="btnSubmit" Visible="false" runat="server" Text="Submit" OnClick="BtnSubmit_Click" />
                                <asp:Button ID="btnReset" runat="server" Text="Reset" OnClick="btnReset_Click" />
                            </td>
                        </tr>
                    </table>
                </fieldset>
                <%--</asp:UpdatePanel>--%>
            </div>
        </ContentTemplate>
        <Triggers>
            <asp:AsyncPostBackTrigger ControlID="chkSameasAddress" EventName="CheckedChanged" />
        </Triggers>
    </asp:UpdatePanel>
    </form>
</body>
</html>
