<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CustomerEntry.aspx.cs"
    Inherits="VTS.Customer.PL.CustomerEntry" EnableEventValidation="false" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta charset="utf-8" />
    <title>Customer Entry</title>
    <%--<meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <meta name="description" content="" />
    <meta name="author" content="" />
    <link href="css/bootstrap.css" rel="stylesheet" />
    <link href="css/font-awesome.css" rel="stylesheet" />
    <link href="css/style.css" rel="stylesheet" />
    <link rel="stylesheet" type="text/css" href="js/jquery-ui.css">
    <link href="css/treetable/jquery.treeTable.css" rel="stylesheet" />--%>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="css/style1.css" type="text/css" rel="stylesheet">
    <link href="css/bootstrap.min.css" type="text/css" rel="stylesheet">
    <!-- Grid view Row Selection Script -->
    <script type="text/javascript">
        var SelectedRow = null;
        var SelectedRowIndex = null;
        var UpperBound = null;
        var LowerBound = null;

        window.onload = function () {
            UpperBound = parseInt('<%= this.grdCustomerDetails.Rows.Count %>') - 1;
            LowerBound = 0;
            SelectedRowIndex = -1;
        }

        function SelectRow(CurrentRow, RowIndex) {
            if (SelectedRow == CurrentRow || RowIndex > UpperBound || RowIndex < LowerBound) return;

            if (SelectedRow != null) {
                SelectedRow.style.backgroundColor = SelectedRow.originalBackgroundColor;
                SelectedRow.style.color = SelectedRow.originalForeColor;
            }

            if (CurrentRow != null) {
                CurrentRow.originalBackgroundColor = CurrentRow.style.backgroundColor;
                CurrentRow.originalForeColor = CurrentRow.style.color;
                CurrentRow.style.backgroundColor = '#DCFC5C';
                CurrentRow.style.color = 'Black';
            }

            SelectedRow = CurrentRow;
            SelectedRowIndex = RowIndex;
            setTimeout("SelectedRow.focus();", 0);
        }

        function SelectSibling(e) {
            var e = e ? e : window.event;
            var KeyCode = e.which ? e.which : e.keyCode;

            if (KeyCode == 40)
                SelectRow(SelectedRow.nextSibling, SelectedRowIndex + 1);
            else if (KeyCode == 38)
                SelectRow(SelectedRow.previousSibling, SelectedRowIndex - 1);

            return false;
        }
    </script>
</head>
<body>
    <form id="frmCustomerEntry" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
    <header class="navbar navbar-fixed-top">
        <div class="navbar-inner">
            <!--/.container -->
            <div class="style1">
                <a class="btn btn-navbar" data-toggle="collapse" data-target=".nav-collapse"><span
                    class="icon-bar"></span>
                </a></div>
        </div>
        <!--/.nav-inner -->
    </header>
    <!--/.header -->
    <div class="container">
        <fieldset class="scheduler-border">
            <legend class="scheduler-border">Customer Entry</legend>
            <br />
            <br />
            <br />
            <asp:GridView ID="grdCustomerDetails" runat="server" PageSize="5" OnPageIndexChanging="grdCustomerDetails_OnPageIndexChanging"
                AllowPaging="true" Width="97%" AutoGenerateColumns="false" EmptyDataText="No Records Fetch"
                DataKeyNames="CustId" OnRowDataBound="OnRowDataBound" OnSelectedIndexChanging="grdCustomerDetails_SelectedIndexChanging">
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
            <br /> <br />
            <fieldset class="scheduler-border">
                <legend class="scheduler-border">Customer Details</legend>
                <asp:UpdatePanel ID="updPnlAddress" runat="server">
                    <ContentTemplate>
                        <div class="col-sm-6 col-md-6">
                            <form class="form-horizontal">
                            <div class="form-group">
                                <asp:Label ID="lblCustomerId" CssClass="col-sm-2 control-label" runat="server" Text="Customer Id"></asp:Label>
                                <div class="col-sm-10">
                                    <asp:Label ID="lblAutoCusId" CssClass="col-sm-2 control-label" runat="server" Text=""></asp:Label>
                                </div>
                            </div>
                            <asp:Panel ID="pnlCusDetails" Visible="true" runat="server">
                                <div class="form-group">
                                    <asp:Label ID="lblFstName" CssClass="col-sm-2 control-label" runat="server" Text="First Name *"></asp:Label>
                                    <div class="col-sm-10">
                                        <asp:TextBox ID="txtFirstName" TabIndex="1" onkeypress="return isAlphaKey(event)"
                                            MaxLength="25" ToolTip="First Name" CssClass="form-control" runat="server"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RfvFstName" ErrorMessage="Please Enter your First name"
                                            Font-Size="Small" ForeColor="Red" ControlToValidate="txtFirstName" runat="server" />
                                    </div>
                                </div>
                                <div class="form-group">
                                    <asp:Label ID="lblLstName" CssClass="col-sm-2 control-label" runat="server" Text="Last Name *"></asp:Label>
                                    <div class="col-sm-10">
                                        <asp:TextBox ID="txtLastName" TabIndex="3" MaxLength="25" onkeypress="return isAlphaKey(event)"
                                            ToolTip="LastName" CssClass="form-control" runat="server"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RfvLastName" ErrorMessage="Please Enter Your Last Name"
                                            Font-Size="Small" ForeColor="Red" ControlToValidate="txtLastName" runat="server" />
                                    </div>
                                </div>
                                <div class="form-group">
                                    <asp:Label ID="lblGender" CssClass="col-sm-2 control-label" runat="server" Text="Gender *"></asp:Label>
                                    <div class="col-sm-10">
                                        &nbsp;&nbsp;&nbsp;
                                        <lable class="radio inline">
                                                
                                                <input type="radio" name="rdoGender" runat="server" id="rdomale"  value="option1" checked> Male
                                                <%--<asp:RadioButtonList ID="rdo<asp:RadioButton runat="server"></asp:RadioButton>Gender" CssClass="radio inline" TabIndex="5" runat="server">
                                                        <asp:ListItem Value="male">male</asp:ListItem>
                                                        <asp:ListItem Value="female">female</asp:ListItem>
                                                    </asp:RadioButtonList>--%>
                                                  
                                                    <%--<asp:RequiredFieldValidator ID="RfvGender" InitialValue="-1" runat="server" ErrorMessage="*"
                                                        Font-Size="Small" ForeColor="Red" ControlToValidate="rdoGender"></asp:RequiredFieldValidator>--%>
                                              </lable>
                                        &nbsp;&nbsp;&nbsp;
                                        <lable class="radio inline">
                                              <input type="radio" name="rdoGender"  runat="server" id="rdoFemale"  value="option2">Female
                                                </lable>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <asp:Label ID="lblAddress2" CssClass="col-sm-2 control-label" runat="server" Text="Address 2"></asp:Label>
                                    <div class="col-sm-10">
                                        <asp:TextBox ID="txtAddress2" TabIndex="7" ToolTip="Address2" TextMode="MultiLine"
                                            CssClass="form-control" runat="server"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <asp:Label ID="lblState" CssClass="col-sm-2 control-label" runat="server" Text="State *"></asp:Label>
                                    <div class="col-sm-10">
                                        <asp:TextBox ID="txtState" TabIndex="9" MaxLength="20" ToolTip="State" CssClass="form-control"
                                            runat="server"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RfvState" runat="server" ErrorMessage=" Please enter the state"
                                            Font-Size="Small" ForeColor="Red" ControlToValidate="txtState"></asp:RequiredFieldValidator>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <asp:Label ID="lblSameasAddress" CssClass="col-sm-2 control-label" runat="server"
                                        Text="Please tick if Permanent Address"></asp:Label>
                                    <div class="col-sm-10">
                                        <asp:CheckBox ID="chkSameasAddress" TabIndex="11" ToolTip="Sameasaddrress" runat="server"
                                            CssClass="checkbox" AutoPostBack="true" OnCheckedChanged="chkSameasAddress_CheckedChanged" />
                                    </div>
                                </div>
                                <div class="form-group">
                                    <asp:Label ID="lblPrAddress2" CssClass="col-sm-2 control-label" runat="server" Text="Address 2"></asp:Label>
                                    <div class="col-sm-10">
                                        <asp:TextBox ID="txtPrAddress2" TabIndex="13" ToolTip="PrAddress2" TextMode="MultiLine"
                                            CssClass="form-control" runat="server"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <asp:Label ID="lblPrState" CssClass="col-sm-2 control-label" runat="server" Text="State *"></asp:Label>
                                    <div class="col-sm-10">
                                        <asp:TextBox ID="txtPrState" TabIndex="15" MaxLength="20" ToolTip="PrState" CssClass="form-control"
                                            runat="server"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RfvPrState" runat="server" ErrorMessage="Please enter the state"
                                            Font-Size="Small" ForeColor="Red" ControlToValidate="txtPrState"></asp:RequiredFieldValidator>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <asp:Label ID="lblMobileNo" CssClass="col-sm-2 control-label" runat="server" Text="Mobile No *"></asp:Label>
                                    <div class="col-sm-10">
                                        <asp:TextBox ID="txtMobileNo" TabIndex="17" MaxLength="15" ToolTip="Mobile Number"
                                            onkeypress="return validate(event)" CssClass="form-control" runat="server"></asp:TextBox>
                                        <asp:RegularExpressionValidator ID="RexMobileNo" runat="server" ValidationExpression="^[0-9]{12}$"
                                            ControlToValidate="txtMobileNo" ForeColor="Red" ErrorMessage="Please Enter your Mobile number"></asp:RegularExpressionValidator>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <asp:Label ID="lblEmail" CssClass="col-sm-2 control-label" runat="server" Text="Email ID *"></asp:Label>
                                    <div class="col-sm-10">
                                        <asp:TextBox ID="txtEmail" TabIndex="19" MaxLength="30" ToolTip="EmailId" CssClass="form-control"
                                            runat="server"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RfvEmail" runat="server" ErrorMessage="Please enter your Email ID"
                                            Font-Size="Small" ForeColor="Red" ControlToValidate="txtEmail"></asp:RequiredFieldValidator>
                                        <asp:RegularExpressionValidator ID="ReV" runat="server" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"
                                            ControlToValidate="txtEmail" ErrorMessage="Enter Valid ID" ForeColor="Red"></asp:RegularExpressionValidator>
                                    </div>
                                </div>
                            </asp:Panel>
                            </form>
                        </div>

                        <div class="col-sm-6 col-md-6">
                            <form class="form-horizontal">
                            <div class="form-group">
                                <asp:Label ID="lblMidName" CssClass="col-sm-2 control-label" runat="server" Text="Middle Name"></asp:Label>
                                <div class="col-sm-10">
                                    <asp:TextBox ID="txtMidName" MaxLength="25" TabIndex="2" ToolTip="Middle Name" onkeypress="return isAlphaKey(event)"
                                        CssClass="form-control" runat="server"></asp:TextBox>
                                </div>
                            </div>
                            <div class=" form-group">
                                <asp:Label ID="lblDob" CssClass="col-sm-2 control-label" runat="server" Text="Data of birth *"></asp:Label>
                                <div class="col-sm-10">
                                    <asp:TextBox ID="txtDob" runat="server" ToolTip="DOB" CssClass="form-control"> </asp:TextBox>
                                    <%--<asp:TextBox ID="txtDob" TabIndex="4" ToolTip="DOB" CssClass="form-control" runat="server"></asp:TextBox>
                                                    
                                                    <asp:RequiredFieldValidator ID="RfvDob" runat="server" ErrorMessage="Enter your DOB"
                                                        Font-Size="Small" ForeColor="Red" ControlToValidate="txtDob"></asp:RequiredFieldValidator>
                                    --%></div>
                            </div>
                            <div class="form-group">
                                <asp:TextBox ID="txtAddress1" TabIndex="6" ToolTip="Address1" runat="server" TextMode="MultiLine"
                                    CssClass="form-control"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RfvtxtAddress" runat="server" ErrorMessage=" Please enter your address"
                                        Font-Size="Small" ForeColor="Red" ControlToValidate="txtAddress1"></asp:RequiredFieldValidator>
                                </div>
                            </div>
                            <div class="form-group">
                                <asp:Label ID="lblCity" CssClass="col-sm-2 control-label" runat="server" Text="City *"></asp:Label>
                                <div class="col-sm-10">
                                    <asp:TextBox ID="txtCity" MaxLength="30" TabIndex="8" ToolTip="City" CssClass="form-control"
                                        runat="server"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RfvCity" runat="server" ErrorMessage="Please enter your city"
                                        Font-Size="Small" ForeColor="Red" ControlToValidate="txtCity"></asp:RequiredFieldValidator>
                                </div>
                            </div>
                            <div class="form-group">
                                <asp:Label ID="lblZipcode" CssClass="col-sm-2 control-label" runat="server" Text="Zipcode *"></asp:Label>
                                <div class="col-sm-10">
                                    <asp:TextBox ID="txtZipcode" MaxLength="10" TabIndex="10" ToolTip="Zipcode" CssClass="form-control"
                                        onkeypress="return validate(event)" runat="server"></asp:TextBox>
                                    <asp:RegularExpressionValidator ID="RevZipCode" runat="server" ValidationExpression="^[0-9]{6}$"
                                        ControlToValidate="txtZipcode" ForeColor="Red" ErrorMessage="Enter Valid Zipcode"></asp:RegularExpressionValidator>
                                </div>
                            </div>
                            <div class="form-group">
                                <asp:Label ID="lblPrAddress1" CssClass="col-sm-2 control-label" runat="server" Text="Address 1 *"></asp:Label>
                                <div class="col-sm-10">
                                    <asp:TextBox ID="txtPrAddress1" TabIndex="12" ToolTip="PrAddress" TextMode="MultiLine"
                                        CssClass="form-control" runat="server"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RfvPrAddress1" runat="server" ErrorMessage="Please enter your address"
                                        Font-Size="Small" ForeColor="Red" ControlToValidate="txtPrAddress1"></asp:RequiredFieldValidator>
                                </div>
                            </div>
                            <div class="form-group">
                                <asp:Label ID="lblPrCity" CssClass="col-sm-2 control-label" runat="server" Text="City *"></asp:Label>
                                <div class="col-sm-10">
                                    <asp:TextBox ID="txtPrCity" MaxLength="30" TabIndex="14" ToolTip="PrCity" CssClass="form-control"
                                        runat="server"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RfvPrCity" runat="server" ErrorMessage="Please enter your city"
                                        Font-Size="Small" ForeColor="Red" ControlToValidate="txtPrCity"></asp:RequiredFieldValidator>
                                </div>
                            </div>
                            <div class="form-group">
                                <asp:Label ID="lblPrZipcode" CssClass="col-sm-2 control-label" runat="server" Text="Zipcode *"></asp:Label>
                                <div class="col-sm-10">
                                    <asp:TextBox ID="txtPrZipcode" MaxLength="10" TabIndex="16" onkeypress="return validate(event)"
                                        ToolTip="PrZipcode" CssClass="form-control" runat="server"></asp:TextBox>
                                    <asp:RegularExpressionValidator ID="RevPrZipcode" runat="server" ValidationExpression="^[0-9]{6}$"
                                        ControlToValidate="txtPrZipcode" ForeColor="Red" ErrorMessage="Enter the valid Zipcode"></asp:RegularExpressionValidator>
                                </div>
                            </div>
                            <div class="form-group">
                                <asp:Label ID="lblHomeNumber" CssClass="col-sm-2 control-label" runat="server" Text="Home Number"></asp:Label>
                                <div class="col-sm-10">
                                    <asp:TextBox ID="txtHomeNumber" MaxLength="20" TabIndex="18" ToolTip="Home Number"
                                        onkeypress="return validate(event)" tCssClass="form-control" runat="server"></asp:TextBox>
                                </div>
                            </div>
                            <div class="form-group">
                                <asp:Label ID="lblFax" CssClass="col-sm-2 control-label" runat="server" Text="Fax No"></asp:Label>
                                <div class="col-sm-10">
                                    <asp:TextBox ID="txtFax" MaxLength="15" TabIndex="20" ToolTip="Fax" onkeypress="return validate(event)"
                                        CssClass="form-control" runat="server"></asp:TextBox>
                                </div>
                            </div>
                            <div class="form-group">
                                <asp:Label ID="lblWebsite" CssClass="col-sm-2 control-label" runat="server" Text="Website"></asp:Label>
                                <div class="col-sm-10">
                                    <asp:TextBox ID="txtWebsite" MaxLength="30" TabIndex="21" ToolTip="Website" CssClass="form-control"
                                        runat="server"></asp:TextBox>
                                </div>
                                <asp:HiddenField ID="hdnResultValue" Value="" runat="server" />
                            </div>
                            </form>
                        </div>
                        <div align="center">
                            <div style="margin-left: 200px" class="style5">
                                <asp:Button ID="btnSave" TabIndex="22" runat="server" CssClass="btn btn-default"
                                    Text="Save" OnClick="BtnSave_Click" />
                                <asp:Button ID="btnSubmit" TabIndex="23" Visible="false" runat="server" CssClass="btn btn-default"
                                    Text="Submit" OnClick="BtnSubmit_Click" />
                                <asp:Button ID="btnReset" TabIndex="24" runat="server" CssClass="btn btn-default"
                                    Text="Reset" OnClick="btnReset_Click" />
                            </div>
                    </ContentTemplate>
                    <Triggers>
                        <asp:AsyncPostBackTrigger ControlID="chkSameasAddress" EventName="CheckedChanged" />
                        <asp:AsyncPostBackTrigger ControlID="btnReset" EventName="Click" />
                    </Triggers>
                </asp:UpdatePanel>
            </fieldset>
    </fieldset>
    </div>
    <!-- /content -->
    <footer> Copyright © 2015 - <a href="#">vinformax</a> </footer>
    <script src="js/jquery.js"></script>
    <script src="js/bootstrap.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script type="text/jscript" src="js/jquery-1.10.2.js"></script>
    <script type="text/jscript" src="js/jquery-ui.js"></script>
    <script src="js/FormValidation.js" type="text/javascript"></script>
    </form>
</body>
</html>
